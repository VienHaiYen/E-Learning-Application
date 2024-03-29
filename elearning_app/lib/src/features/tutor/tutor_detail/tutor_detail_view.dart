import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:elearning_app/src/constants/country_list.dart';
import 'package:elearning_app/src/constants/language_list.dart';
import 'package:elearning_app/src/constants/routes.dart';
import 'package:elearning_app/src/features/booking/widgets/tutor_schedule.dart';
import 'package:elearning_app/src/features/tutor/tutor_detail/tutor_report_dialog.dart';
import 'package:elearning_app/src/models/tutor/tutor_feedback.dart';
import 'package:elearning_app/src/models/tutor/tutor_info.dart';
import 'package:elearning_app/src/providers/auth_provider.dart';
import 'package:elearning_app/src/services/tutor_service.dart';
import 'package:provider/provider.dart';
import 'package:video_player/video_player.dart';

class TutorDetailView extends StatefulWidget {
  const TutorDetailView({Key? key}) : super(key: key);

  @override
  State<TutorDetailView> createState() => _TutorDetailViewState();
}

class _TutorDetailViewState extends State<TutorDetailView> {
  VideoPlayerController? _videoPlayerController;
  ChewieController? _chewieController;

  late TutorInfo _tutorInfo;
  late final List<String> _specialties;
  late final List<String>? languages;
  List<TutorFeedback>? feedbacks;
  late String userId;

  bool _isLoading = true;

  Future<void> _fetchTutorInfo(AuthProvider authProvider) async {
    final String token = authProvider.token?.access?.token as String;

    final result = await TutorService.getTutorInfoById(
      token: token,
      userId: userId,
    );

    if (_isLoading) {
      final learnTopics = authProvider.learnTopics
          .where((topic) =>
              result.specialties?.split(',').contains(topic.key) ?? false)
          .map((e) => e.name ?? '');
      final testPreparations = authProvider.testPreparations
          .where((test) =>
              result.specialties?.split(',').contains(test.key) ?? false)
          .map((e) => e.name ?? '');
      _specialties = [...learnTopics, ...testPreparations];
      languages = result.languages?.split(',') ?? [''];
    }

    if (mounted) {
      setState(() {
        _tutorInfo = result;
        _isLoading = false;
        _videoPlayerController =
            VideoPlayerController.network(_tutorInfo.video ?? '');
        _chewieController = ChewieController(
          videoPlayerController: _videoPlayerController!,
          aspectRatio: 2 / 3,
          autoPlay: true,
        );
      });
    }
  }

  @override
  void dispose() {
    _videoPlayerController?.dispose();
    _chewieController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final authProvider = context.watch<AuthProvider>();

    if (_isLoading && authProvider.token != null) {
      final data = ModalRoute.of(context)?.settings.arguments as Map;
      userId = data['userId'];

      feedbacks = data['tutor']?.feedbacks;

      _fetchTutorInfo(authProvider);
    }

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: BackButton(
          color: Colors.blue[600],
        ),
        title: Text(
          'Teacher Details',
          style: Theme.of(context).textTheme.headline2,
        ),
      ),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : SingleChildScrollView(
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Container(
                        width: 72,
                        height: 72,
                        clipBehavior: Clip.hardEdge,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                        ),
                        child: Image.network(
                          _tutorInfo.user?.avatar ?? '',
                          fit: BoxFit.cover,
                          errorBuilder: (context, error, stackTrace) =>
                              const Icon(
                            Icons.error_outline_rounded,
                            color: Colors.red,
                            size: 32,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              _tutorInfo.user?.name ?? 'null name',
                              style: Theme.of(context).textTheme.headline3,
                            ),
                            Text(
                              countryList[_tutorInfo.user?.country] ??
                                  'unknown country',
                              style: const TextStyle(fontSize: 16),
                            ),
                            _tutorInfo.rating == null
                                ? const Text(
                                    'No reviews yet',
                                    style: TextStyle(
                                      fontStyle: FontStyle.italic,
                                      color: Colors.grey,
                                    ),
                                  )
                                : Row(children: [
                                    ...List<Widget>.generate(
                                      _tutorInfo.rating?.round() ?? 0,
                                      (index) => const Icon(Icons.star,
                                          color: Colors.amber),
                                    ),
                                    const SizedBox(width: 8),
                                    Text('(${_tutorInfo.totalFeedback})',
                                        style: const TextStyle(fontSize: 18))
                                  ])
                          ],
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    child: Text(
                      _tutorInfo.bio ?? 'null bio',
                      style: const TextStyle(fontSize: 16),
                    ),
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: TextButton(
                          onPressed: () async {
                            if (authProvider.token != null) {
                              final String accessToken =
                                  authProvider.token?.access?.token as String;
                              await TutorService.addTutorToFavorite(
                                token: accessToken,
                                userId: userId,
                              );
                              _fetchTutorInfo(authProvider);
                            }
                          },
                          child: Column(
                            children: [
                              _tutorInfo.isFavorite!
                                  ? const Icon(
                                      Icons.favorite_rounded,
                                      color: Colors.red,
                                    )
                                  : const Icon(
                                      Icons.favorite_border_rounded,
                                      color: Colors.blue,
                                    ),
                              Text(
                                'Favorite',
                                style: TextStyle(
                                  color: _tutorInfo.isFavorite!
                                      ? Colors.red
                                      : Colors.blue,
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                          child: TextButton(
                        onPressed: () {
                          Navigator.pushNamed(
                            context,
                            Routes.review,
                            arguments: feedbacks,
                          );
                        },
                        child: const Column(
                          children: [
                            Icon(Icons.reviews_outlined, color: Colors.blue),
                            Text('Reviews',
                                style: TextStyle(color: Colors.blue))
                          ],
                        ),
                      )),
                      Expanded(
                        child: TextButton(
                          onPressed: () async {
                            // await _showReportDialog(context);
                            final result = await showDialog(
                              context: context,
                              builder: (context) => TutorReportDialog(
                                token: authProvider.token?.access?.token ?? '',
                                userId: userId,
                              ),
                            );
                            if (result) {
                              await showDialog(
                                context: context,
                                builder: (context) {
                                  return AlertDialog(
                                    title: const Text('Report Success'),
                                    actions: [
                                      TextButton(
                                          onPressed: () {
                                            Navigator.pop(context);
                                          },
                                          child: const Text('OK')),
                                    ],
                                  );
                                },
                              );
                            }
                          },
                          child: Column(
                            children: const [
                              Icon(Icons.report_outlined, color: Colors.blue),
                              Text('Report',
                                  style: TextStyle(color: Colors.blue))
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(vertical: 8),
                    height: 300,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.blue, width: 2),
                        borderRadius:
                            const BorderRadius.all(Radius.circular(10))),
                    child: _chewieController == null
                        ? Text(
                            'No Introduction Video',
                            style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.w500,
                              color: Colors.blue[700],
                            ),
                          )
                        : Chewie(controller: _chewieController!),
                  ),
                  const SizedBox(height: 8),
                  Text('Languages',
                      style: Theme.of(context).textTheme.headline3),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Wrap(
                      spacing: 8,
                      runSpacing: 4,
                      children: List<Widget>.generate(
                        languages!.length,
                        (index) => Chip(
                          backgroundColor: Color.fromARGB(255, 156, 208, 232),
                          shape: const StadiumBorder(side: BorderSide()),
                          label: Text(
                            languageList[languages?[index]]?['name'] ??
                                'unknown language',
                            style: const TextStyle(
                                color: Color.fromARGB(255, 9, 52, 88)),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text('Specialties',
                      style: Theme.of(context).textTheme.headline3),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Wrap(
                      spacing: 8,
                      runSpacing: 8,
                      children: List<Widget>.generate(
                        _specialties.length,
                        (index) => Chip(
                          backgroundColor: Color.fromARGB(255, 156, 208, 232),
                          shape: const StadiumBorder(side: BorderSide()),
                          label: Text(
                            _specialties[index],
                            style: const TextStyle(
                                fontSize: 14, color: Colors.blue),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 8),
                  const SizedBox(height: 12),
                  Text('Interests',
                      style: Theme.of(context).textTheme.headline3),
                  Padding(
                    padding: const EdgeInsets.only(left: 10, right: 8),
                    child: Text(_tutorInfo.interests ?? 'No interests'),
                  ),
                  const SizedBox(height: 12),
                  Text('Teaching Experiences',
                      style: Theme.of(context).textTheme.headline3),
                  Padding(
                    padding: const EdgeInsets.only(left: 10, right: 8),
                    child: Text(
                        _tutorInfo.experience ?? 'No teaching experiences'),
                  ),
                  Container(
                      alignment: Alignment.topRight,
                      width: 200,
                      padding: const EdgeInsets.only(top: 16, bottom: 12),
                      child: ElevatedButton(
                        style: TextButton.styleFrom(
                            minimumSize: const Size.fromHeight(0),
                            padding: const EdgeInsets.symmetric(
                                vertical: 8, horizontal: 16),
                            backgroundColor: Colors.blue),
                        onPressed: () async {
                          await showModalBottomSheet(
                            context: context,
                            isScrollControlled: true,
                            elevation: 5,
                            clipBehavior: Clip.hardEdge,
                            builder: (context) => TutorSchedule(userId: userId),
                          );
                        },
                        child: const Text(
                          'Book Tutor',
                          style: TextStyle(
                              fontSize: 18,
                              color: Color.fromARGB(255, 240, 240, 240)),
                        ),
                      ))
                ],
              ),
            ),
    );
  }
}

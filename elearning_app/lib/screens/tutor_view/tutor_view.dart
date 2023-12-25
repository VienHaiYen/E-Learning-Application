import 'package:chewie/chewie.dart';
import 'package:elearning_app/models/tutor/tutor.dart';
import 'package:elearning_app/models/tutor/tutor_feedback.dart';
import 'package:elearning_app/models/tutor/tutor_info.dart';
import 'package:elearning_app/provider/auth_provider.dart';
import 'package:elearning_app/services/tutor_service.dart';
import 'package:elearning_app/widgets/my_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:getwidget/getwidget.dart';
import 'package:elearning_app/screens/tutor_view/widgets/comment_item.dart';
import 'package:elearning_app/widgets/group_fixed_button.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:video_player/video_player.dart';
import 'package:elearning_app/widgets/avatar.dart';
import 'package:elearning_app/widgets/star_rating.dart';
import 'package:elearning_app/widgets/favorite_icon.dart';

var counter = 0;

class TutorView extends StatefulWidget {
  final String userId;
  final Tutor tutor;

  const TutorView({super.key, required this.userId, required this.tutor});

  @override
  State<TutorView> createState() => _TutorViewState();
}

class _TutorViewState extends State<TutorView> {
  VideoPlayerController? _videoPlayerController;
  ChewieController? _chewieController;

  late TutorInfo _tutorInfo;
  late final List<String> _specialties;
  late final List<String> languages;
  late final List<TutorFeedback> feedbacks;
  late String userId;
  late Tutor tutor;

  bool _isLoading = true;

  Future<void> _fetchTutorInfo(AuthProvider authProvider) async {
    final String token = authProvider.token?.access?.token as String;

    final result = await TutorService.getTutorInfoById(
      token: token,
      userId: widget.userId,
    );

    print(result);

    if (_isLoading) {
      final learnTopics = authProvider.learnTopics
          .where((topic) =>
              result.specialties?.split(',').contains(topic.key) ?? false)
          .map((e) => e.name ?? 'null');
      final testPreparations = authProvider.testPreparations
          .where((test) =>
              result.specialties?.split(',').contains(test.key) ?? false)
          .map((e) => e.name ?? 'null');
      _specialties = [...learnTopics, ...testPreparations];
      languages = result.languages?.split(',') ?? ['null'];
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

  final courses = [
    "Basic Conversation Topics",
    "Life in the Internet Age",
    "IELTS Speaking Part 3"
  ];

  TextEditingController nameC = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final authProvider = context.watch<AuthProvider>();

    if (_isLoading && authProvider.token != null) {
      _fetchTutorInfo(authProvider);
    }
    // return Text(widget.userId);
    return Scaffold(
      appBar: MyAppBar(),
      body: Stack(
        children: [
          const Positioned(bottom: 20, right: 20, child: GroupFixedButton()),
          Padding(
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 20),
              child: ListView(children: [
                Container(
                  padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
                  child: Column(
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(right: 12),
                            child: Avatar(
                                url: _tutorInfo.user?.avatar ?? '',
                                height: 50,
                                width: 50),
                          ),
                          Expanded(
                              child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                Text(_tutorInfo.user?.name ?? '',
                                    style: const TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w600)),
                                // TODO: Add country image
                                Text(
                                  _tutorInfo.user?.country ?? '',
                                  textAlign: TextAlign.start,
                                ),
                                StarRating(
                                  rating: _tutorInfo.rating ?? 0,
                                ),
                              ])),
                          FavoriteIcon(
                              isInterested: _tutorInfo.isFavorite ?? false,
                              onPressed: () async {
                                if (authProvider.token != null) {
                                  final String accessToken = authProvider
                                      .token?.access?.token as String;
                                  await TutorService.addTutorToFavorite(
                                    token: accessToken,
                                    userId: widget.tutor.userId ?? '',
                                  );
                                  _fetchTutorInfo(authProvider);
                                }
                              })
                        ],
                      ),
                      Wrap(
                        spacing: 4,
                        runSpacing: -20,
                        children: List<Widget>.generate(
                          _specialties.length,
                          (index) => GFButton(
                            onPressed: null,
                            text: _specialties[index],
                            color: const Color.fromARGB(255, 64, 135, 194),
                            shape: GFButtonShape.pills,
                            size: 20,
                          ),
                        ),
                      ),
                      Text(
                        _tutorInfo.bio ?? '',
                        maxLines: 4,
                        overflow: TextOverflow.ellipsis,
                      ),
                      Row(
                        children: [
                          Container(
                            padding: const EdgeInsets.symmetric(
                                vertical: 16, horizontal: 4),
                            child: Column(
                              children: [
                                FavoriteIcon(
                                    isInterested:
                                        _tutorInfo.isFavorite ?? false,
                                    onPressed: () async {
                                      if (authProvider.token != null) {
                                        final String accessToken = authProvider
                                            .token?.access?.token as String;
                                        await TutorService.addTutorToFavorite(
                                          token: accessToken,
                                          userId: widget.tutor.userId ?? '',
                                        );
                                        _fetchTutorInfo(authProvider);
                                      }
                                    }),
                                Text(
                                  AppLocalizations.of(context)!.favourite,
                                  style: const TextStyle(color: Colors.blue),
                                )
                              ],
                            ),
                          ),
                          const Expanded(
                            child: Column(
                              children: [
                                Icon(
                                  Icons.report_outlined,
                                  color: Colors.blue,
                                ),
                                Text(
                                  "Báo cáo",
                                  style: TextStyle(color: Colors.blue),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                // TODO: Add VideoWidget here
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
                Container(
                  padding: const EdgeInsets.only(top: 8),
                  child: Text(
                    AppLocalizations.of(context)!.education,
                    style: const TextStyle(
                        fontSize: 18, fontWeight: FontWeight.w600),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(top: 8),
                  child: Text(
                    _tutorInfo.education ?? 'No education',
                    style: const TextStyle(fontSize: 16),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(top: 9),
                  child: Text(
                    AppLocalizations.of(context)!.language,
                    style: const TextStyle(
                        fontSize: 18, fontWeight: FontWeight.w600),
                  ),
                ),
                Wrap(
                  spacing: 4,
                  runSpacing: -20,
                  children: [
                    ...languages.map((option) {
                      return GFButton(
                        onPressed: null,
                        text: option,
                        color: const Color.fromARGB(255, 64, 135, 194),
                        shape: GFButtonShape.pills,
                        size: 20,
                      );
                    }).toList()
                  ],
                ),
                Container(
                  padding: const EdgeInsets.only(top: 9),
                  child: Text(
                    AppLocalizations.of(context)!.specialties,
                    style: const TextStyle(
                        fontSize: 18, fontWeight: FontWeight.w600),
                  ),
                ),
                Wrap(
                  spacing: 8,
                  runSpacing: -20,
                  children: [
                    ..._specialties.map((option) {
                      return GFButton(
                        onPressed: null,
                        text: option,
                        color: const Color.fromARGB(255, 64, 135, 194),
                        shape: GFButtonShape.pills,
                        size: 20,
                      );
                    }).toList()
                  ],
                ),
                Container(
                  padding: const EdgeInsets.only(top: 9),
                  child: Text(
                    AppLocalizations.of(context)!.suggested_courses,
                    style: const TextStyle(
                        fontSize: 18, fontWeight: FontWeight.w600),
                  ),
                ),
                Column(
                  children: [
                    ...courses.map((course) {
                      return ListTile(
                        title: Row(children: [
                          Text(
                            course,
                            style: const TextStyle(fontWeight: FontWeight.w600),
                          ),
                          TextButton(
                              onPressed: () {},
                              child: Text(
                                AppLocalizations.of(context)!.link_more,
                                style: TextStyle(color: Colors.blue),
                              ))
                        ]),
                      );
                    }).toList()
                  ],
                ),
                Container(
                  padding: const EdgeInsets.only(top: 9),
                  child: Text(
                    AppLocalizations.of(context)!.interests,
                    style: const TextStyle(
                        fontSize: 18, fontWeight: FontWeight.w600),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(top: 8),
                  child: Text(
                    _tutorInfo.interests ?? 'No interests',
                    style: const TextStyle(fontSize: 16),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(top: 9),
                  child: Text(
                    AppLocalizations.of(context)!.teaching_experience,
                    style: const TextStyle(
                        fontSize: 18, fontWeight: FontWeight.w600),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(top: 8),
                  child: Text(
                    _tutorInfo.experience ?? 'No teaching experiences',
                    style: const TextStyle(fontSize: 16),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(top: 9),
                  child: Text(
                    AppLocalizations.of(context)!.others_review,
                    style: const TextStyle(
                        fontSize: 18, fontWeight: FontWeight.w600),
                  ),
                ),
                // TODO: Get líst mapping all comment
                const CommentItem(),
                // TODO: Horizontal Scroll
                // TODO: Styling table
                Table(
                  border: TableBorder.all(),
                  defaultVerticalAlignment: TableCellVerticalAlignment.middle,
                  children: [
                    TableRow(children: [
                      Text(''),
                      Text(DateFormat('dd/MM').format(
                          DateTime.now().add(Duration(days: counter + 1)))),
                      Text(DateFormat('dd/MM').format(
                          DateTime.now().add(Duration(days: counter + 2)))),
                      Text(DateFormat('dd/MM').format(
                          DateTime.now().add(Duration(days: counter + 3)))),
                      Text(DateFormat('dd/MM').format(
                          DateTime.now().add(Duration(days: counter + 4)))),
                      Text(DateFormat('dd/MM').format(
                          DateTime.now().add(Duration(days: counter + 5)))),
                      Text(DateFormat('dd/MM').format(
                          DateTime.now().add(Duration(days: counter + 6)))),
                      Text(DateFormat('dd/MM').format(
                          DateTime.now().add(Duration(days: counter + 7))))
                    ]),
                    TableRow(children: [
                      Text('00:00 - 00: 25'),
                      Container(),
                      Container(),
                      Container(),
                      Container(),
                      Container(),
                      Container(),
                      Container(),
                    ]),
                    TableRow(children: [
                      Text('00:30 - 00: 55'),
                      Container(),
                      Container(),
                      Container(),
                      Container(),
                      Container(),
                      Container(),
                      Container(),
                    ]),
                    TableRow(children: [
                      Text('01:00 - 01: 25'),
                      Container(),
                      Container(),
                      Container(),
                      Container(),
                      Container(),
                      Container(),
                      Container(),
                    ]),
                    TableRow(children: [
                      Text('01:30 - 01: 55'),
                      Container(),
                      Container(),
                      Container(),
                      Container(),
                      Container(),
                      Container(),
                      Container(),
                    ]),
                  ],
                )
              ])),
        ],
      ),
    );
  }
}

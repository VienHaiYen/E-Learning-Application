import 'package:elearning_app/models/tutor/tutor.dart';
import 'package:elearning_app/models/tutor/tutor_info.dart';
import 'package:elearning_app/provider/auth_provider.dart';
import 'package:elearning_app/routers/routers.dart';
import 'package:elearning_app/services/tutor_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:getwidget/getwidget.dart';
import 'package:elearning_app/widgets/avatar.dart';
import 'package:elearning_app/widgets/star_rating.dart';
import 'package:elearning_app/widgets/favorite_icon.dart';

class TutorItem extends StatefulWidget {
  const TutorItem({
    super.key,
    required this.tutor,
  });
  final Tutor tutor;

  @override
  _TutorItemState createState() => _TutorItemState();
}

class _TutorItemState extends State<TutorItem> {
  TutorInfo? _tutorInfo;
  List<String> _specialties = [];

  Future<void> _fetchTutorInfo(AuthProvider authProvider) async {
    final String token = authProvider.token?.access?.token as String;

    final learnTopics = authProvider.learnTopics
        .where((topic) =>
            _tutorInfo?.specialties?.split(',').contains(topic.key) ?? false)
        .map((e) => e.name ?? 'null');
    final testPreparations = authProvider.testPreparations
        .where((test) =>
            _tutorInfo?.specialties?.split(',').contains(test.key) ?? false)
        .map((e) => e.name ?? 'null');
    _specialties = [...learnTopics, ...testPreparations];

    final result = await TutorService.getTutorInfoById(
      token: token,
      userId: widget.tutor.userId ?? '',
    );

    if (mounted) {
      setState(() {
        _tutorInfo = result;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final authProvider = context.watch<AuthProvider>();

    if (authProvider.token != null) {
      _fetchTutorInfo(authProvider);
    }

    return GestureDetector(
      onTap: () {
        print("23");
        print(widget.tutor.userId);
        Navigator.of(context).pushNamed(AppRouter.tutorView,
            arguments: {"userId": widget.tutor.userId, "tutor": widget.tutor});
      },
      child: Container(
        padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
        decoration: BoxDecoration(
            // color: Colors.black,
            border: Border.all(color: Colors.grey),
            borderRadius: const BorderRadius.all(Radius.circular(20))),
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 12),
                  child: Avatar(
                      url: widget.tutor.avatar ?? '', height: 50, width: 50),
                ),
                Expanded(
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                      Text(widget.tutor.name ?? '',
                          style: const TextStyle(
                              fontSize: 18, fontWeight: FontWeight.w600)),
                      // TODO: Add country image
                      Text(
                        widget.tutor.country ?? '',
                        textAlign: TextAlign.start,
                      ),
                      StarRating(
                        rating: widget.tutor.rating ?? 0,
                      ),
                    ])),
                FavoriteIcon(
                    isInterested: _tutorInfo?.isFavorite ?? false,
                    onPressed: () async {
                      if (authProvider.token != null) {
                        final String accessToken =
                            authProvider.token?.access?.token as String;
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
              widget.tutor.bio ?? '',
              maxLines: 4,
              overflow: TextOverflow.ellipsis,
            ),
            Container(
                margin: const EdgeInsets.all(16),
                alignment: Alignment.topRight,
                child: GFButton(
                  onPressed: () {
                    Navigator.pushNamed(context, AppRouter.booking);
                  },
                  icon: const Icon(Icons.calendar_month),
                  text: "Đặt lịch",
                  textStyle: TextStyle(color: Colors.blue),
                  color: Colors.white,
                  textColor: Colors.yellow,
                  borderSide: BorderSide(width: 1, color: Colors.blue),
                  shape: GFButtonShape.pills,
                ))
          ],
        ),
      ),
    );
  }
}

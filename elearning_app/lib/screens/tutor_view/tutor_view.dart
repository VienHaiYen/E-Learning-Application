// ignore_for_file: must_be_immutable
import 'package:elearning_app/widgets/my_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:getwidget/getwidget.dart';
import 'package:elearning_app/screens/tutor_view/widgets/comment_item.dart';
import 'package:elearning_app/widgets/group_fixed_button.dart';
import './widgets/tutor_item.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:video_player/video_player.dart';

var counter = 0;

class TutorView extends StatefulWidget {
  const TutorView({Key? key}) : super(key: key);

  @override
  State<TutorView> createState() => _TutorViewState();
}

class _TutorViewState extends State<TutorView> {
  VideoPlayerController? _videoPlayerController;

  final searchOptions = [
    "Tất cả",
    "Tiếng Anh cho trẻ em",
    "Tiếng Anh cho công việc",
    "Giao tiếp",
    "FLYERS"
  ];

  final languages = ["English"];

  final courses = [
    "Basic Conversation Topics",
    "Life in the Internet Age",
    "IELTS Speaking Part 3"
  ];

  final favorite =
      "I loved the weather, the scenery and the laid-back lifestyle of the locals.";

  final experience = "I have more than 10 years of teaching english experience";

  TextEditingController nameC = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(),
      body: Stack(
        children: [
          const Positioned(bottom: 20, right: 20, child: GroupFixedButton()),
          Padding(
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 20),
              child: ListView(children: [
                TutorItem(),
                // TODO: Add VideoWidget here
                const Text("Video o day chua xu li"),
                Container(
                  padding: const EdgeInsets.only(top: 8),
                  child: const Text(
                    "Học vấn",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(top: 8),
                  child: const Text(
                    "BA",
                    style: TextStyle(fontSize: 16),
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
                    ...searchOptions.map((option) {
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
                              child: const Text(
                                "Tìm hiểu",
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
                    favorite,
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
                    experience,
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

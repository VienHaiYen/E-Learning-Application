// ignore_for_file: must_be_immutable

import 'package:elearning_app/widgets/my_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:elearning_app/widgets/course_item.dart';
import 'package:elearning_app/widgets/group_fixed_button.dart';
// import 'package:elearning_app/widgets/dropdown.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class CoursesView extends StatefulWidget {
  CoursesView({super.key});

  @override
  State<CoursesView> createState() => _CoursesViewState();
}

class _CoursesViewState extends State<CoursesView> {
  TextEditingController coursesC = TextEditingController();
  final List<String> list = <String>['One', 'Two', 'Three', 'Four'];

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
                Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.only(top: 8, right: 16),
                      alignment: Alignment.topLeft,
                      child: const Icon(
                        Icons.school,
                        size: 120,
                      ),
                    ),
                    Container(
                        // padding: const EdgeInsets.symmetric(vertical: 8),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                          Text(
                            AppLocalizations.of(context)!.discover,
                            style: TextStyle(
                                fontSize: 25, fontWeight: FontWeight.w600),
                          ),
                          SizedBox(
                            height: 16,
                          ),
                          Row(
                            children: [
                              SizedBox(
                                  height: 40,
                                  width: 250,
                                  child: TextField(
                                      controller: coursesC,
                                      // style: TextStyle(fontSize: 12),
                                      decoration: InputDecoration(
                                          contentPadding: const EdgeInsets.only(
                                              top: 4, left: 8),
                                          hintText:
                                              AppLocalizations.of(context)!
                                                  .course,
                                          border: const OutlineInputBorder(
                                              borderSide: BorderSide(
                                                  color: Colors.black))))),
                              Container(
                                  height: 40,
                                  child: Ink(
                                    decoration: const ShapeDecoration(
                                      shape: RoundedRectangleBorder(
                                          side: BorderSide(
                                        color: Colors.grey,
                                      )),
                                    ),
                                    child: const IconButton(
                                        onPressed: null,
                                        icon: Icon(Icons.search)),
                                  ))
                            ],
                          ),
                        ])),
                  ],
                ),

                // TODO:

                Container(
                  margin: const EdgeInsets.only(top: 8),
                  padding: const EdgeInsets.only(top: 4, bottom: 8, left: 16),
                  decoration: const BoxDecoration(
                      border: Border(
                          left: BorderSide(
                              width: 4,
                              color: Color.fromARGB(255, 87, 86, 86)))),
                  child: const Text(
                    "LiveTutor đã xây dựng nên các khóa học của các lĩnh vực trong cuộc sống chất lượng, bài bản và khoa học nhất cho những người đang có nhu cầu trau dồi thêm kiến thức về các lĩnh vực.",
                    style: TextStyle(fontSize: 16),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(top: 9),
                  child: const Text(
                    "Latest Book",
                    style: TextStyle(fontSize: 17, fontWeight: FontWeight.w600),
                  ),
                ),
                // TODO: Chưa làm xong
                // Container(
                //     child: MyDropdownButton(
                //   options: list,
                // ))
                CourseItem()
              ])),
        ],
      ),
    );
  }
}

// ignore_for_file: must_be_immutable

import 'package:elearning_app/screens/calendar_view/widgets/tutor_item.dart';
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
          DefaultTabController(
              length: 2,
              child: Column(
                children: [
                  const TabBar(tabs: [
                    Tab(
                      icon: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.school_outlined,
                            color: Colors.blue,
                          ),
                          SizedBox(width: 8),
                          Text(
                            'All Courses',
                            style: TextStyle(color: Colors.blue),
                          )
                        ],
                      ),
                    ),
                    Tab(
                      icon: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.book_online_outlined,
                            color: Colors.blue,
                          ),
                          SizedBox(width: 8),
                          Text(
                            'E-Books',
                            style: TextStyle(color: Colors.blue),
                          )
                        ],
                      ),
                    ),
                  ]),
                  Expanded(
                    child: TabBarView(children: [
                      // Here goes the first tab
                      TutorItem(),
                      // Here goes the second tab
                      Padding(
                        padding: const EdgeInsets.all(16),
                        child: Column(
                          children: [
                            TextField(
                              decoration: InputDecoration(
                                contentPadding:
                                    const EdgeInsets.only(right: 24),
                                hintStyle: TextStyle(color: Colors.grey[400]),
                                hintText: 'search e-books',
                                prefixIcon: const Icon(Icons.search),
                                border: const OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Colors.grey, width: 2),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10))),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ]),
                  )
                ],
              )),
        ],
      ),
    );
  }
}

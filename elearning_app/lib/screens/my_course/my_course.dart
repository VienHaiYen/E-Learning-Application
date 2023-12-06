// ignore_for_file: must_be_immutable

import 'package:elearning_app/widgets/my_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:elearning_app/screens/my_course/widgets/my_course_item.dart';
import 'package:elearning_app/widgets/group_fixed_button.dart';

class MyCourse extends StatelessWidget {
  MyCourse({super.key});

  TextEditingController courseC = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: MyAppBar(),
        body: Stack(children: [
          MyCourseBody(),
          const Positioned(bottom: 20, right: 20, child: GroupFixedButton())
        ]));
  }
}

class MyCourseBody extends StatelessWidget {
  MyCourseBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 20),
        child: ListView(children: [
          Container(
            padding: const EdgeInsets.symmetric(vertical: 28),
            child: const Column(
              children: [
                Text(
                  "KHOÁ HỌC",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                ),
                Text(
                  "ENGLISH CONVERSATION 101",
                  style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w600,
                      color: Colors.blue),
                ),
                Text(
                  "Approachable lessons for absolute beginners",
                  style: TextStyle(fontSize: 14),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 12),
                  child: Text(
                    "20.00% (2/10 buổi học)",
                    style: TextStyle(fontSize: 16, color: Colors.blue),
                  ),
                ),
              ],
            ),
          ),

          // TODO:
          MyCourseItem(color: Colors.green),
        ]));
  }
}

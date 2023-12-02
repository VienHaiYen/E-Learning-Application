// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';
import 'package:lettutor/screens/tutor/widgets/comment_item.dart';
import 'package:lettutor/widgets/group_fixed_button.dart';
import './widgets/tutor_item.dart';

class Tutor extends StatelessWidget {
  const Tutor({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: "Sign Up Screen",
        theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(
                seedColor: Colors.black,
                primary: const Color.fromARGB(255, 250, 210, 8),
                brightness: Brightness.light)),
        home: Scaffold(
            appBar: AppBar(
                backgroundColor: Colors.white,
                title: const Text(
                  "Lettutor",
                  style: TextStyle(
                      color: Colors.blueAccent,
                      fontSize: 26,
                      fontWeight: FontWeight.w600),
                )),
            body: Stack(children: [
              TutorBody(),
              const Positioned(bottom: 20, right: 20, child: GroupFixedButton())
            ])));
  }
}

class TutorBody extends StatelessWidget {
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

  TutorBody({super.key});

  TextEditingController nameC = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
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
            child: const Text(
              "Ngôn ngữ",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
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
            child: const Text(
              "Chuyên ngành",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
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
            child: const Text(
              "Khóa học tham khảo",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
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
            child: const Text(
              "Sở thích",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
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
            child: const Text(
              "Kinh nghiệm giảng dạy",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
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
            child: const Text(
              "Người khác đánh giá",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
            ),
          ),
          // TODO: Get líst mapping all comment
          const CommentItem()

          // TODO: Make Schedule ( not know nơ )
        ]));
  }
}

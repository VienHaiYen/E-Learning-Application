// ignore_for_file: must_be_immutable

import 'package:elearning_app/widgets/my_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:elearning_app/widgets/course_item.dart';

import 'package:elearning_app/screens/tutor/tutor.dart';
import 'package:elearning_app/widgets/group_fixed_button.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class CourseDetail extends StatelessWidget {
  CourseDetail({super.key});

  TextEditingController courseC = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        appBar: MyAppBar(),
        body: Stack(children: [
          CourseDetailBody(),
          Positioned(bottom: 20, right: 20, child: GroupFixedButton())
        ]));
  }
}

class CourseDetailBody extends StatelessWidget {
  const CourseDetailBody({Key? key}) : super(key: key);

  static const topics = [
    'The Internet',
    'Artificial Intelligence',
    'Social Media',
    'Internet Privacy',
    'Live Streaming'
  ];

  Widget header(BuildContext context, String header) {
    return Row(
      children: [
        const SizedBox(
          width: 24,
          child: Divider(),
        ),
        const SizedBox(
          width: 8,
        ),
        Text(
          header,
          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        const SizedBox(
          width: 8,
        ),
        const Expanded(child: Divider())
      ],
    );
  }

  Widget subHeading(BuildContext context, IconData icon, String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: [
          Icon(
            icon,
            size: 19,
            color: const Color.fromARGB(255, 54, 120, 244),
          ),
          const SizedBox(
            width: 8,
          ),
          Text(title,
              style: const TextStyle(
                fontSize: 16,
              )),
        ],
      ),
    );
  }

  Widget description(
      BuildContext context, IconData icon, String title, String content) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: 8,
        ),
        Row(
          children: [
            Icon(
              icon,
              size: 18,
              color: const Color.fromARGB(255, 244, 54, 54),
            ),
            const SizedBox(
              width: 8,
            ),
            Text(
              title,
              style: const TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(left: 32, top: 4),
          child: Text(
            content,
            textAlign: TextAlign.left,
            style: const TextStyle(fontWeight: FontWeight.w100),
          ),
        ),
      ],
    );
  }

  Widget topicList() {
    return ListView.builder(
      shrinkWrap: true,
      scrollDirection: Axis.vertical,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: topics.length,
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            // Navigator.push(context,
            // MaterialPageRoute(builder: (context) => const LogIn()));
          },
          child: Card(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 36),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('${index + 1}.'),
                  const SizedBox(
                    height: 8,
                  ),
                  Text(topics[index],
                      style: const TextStyle(
                          fontSize: 16, fontWeight: FontWeight.bold)),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget suggestedTutor(BuildContext context, String tutorName) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(tutorName),
        TextButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const Tutor()));
            },
            child: Text(AppLocalizations.of(context)!.more_info)),
      ],
    );
  }

  Widget suggestedTutorList() {
    return ListView.builder(
      shrinkWrap: true,
      scrollDirection: Axis.vertical,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: 12,
      itemBuilder: (context, index) {
        return suggestedTutor(context, '${index + 1}. April');
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          CourseItem(
              bottomWidget: Row(
            children: [
              Expanded(
                child: ElevatedButton(
                  onPressed: () {},
                  child: const Text('Khám phá'),
                ),
              ),
            ],
          )),

          // Overview
          header(context, 'Overview'),
          const SizedBox(
            height: 8,
          ),
          description(
              context,
              Icons.question_mark_outlined,
              'Why take this course',
              "Our world is rapidly changing thanks to new technology, and the vocabulary needed to discuss modern life is evolving almost daily. In this course you will learn the most up-to-date terminology from expertly crafted lessons as well from your native-speaking tutor."),
          const SizedBox(
            height: 8,
          ),
          description(
              context,
              Icons.question_mark_outlined,
              'What will you be able to do',
              "You will learn vocabulary related to timely topics like remote work, artificial intelligence, online privacy, and more. In addition to discussion questions, you will practice intermediate level speaking tasks such as using data to describe trends."),
          const SizedBox(
            height: 16,
          ),

          // Experience level
          header(context, 'Experience Level'),
          const SizedBox(
            height: 8,
          ),
          subHeading(context, Icons.person_add_alt_1_outlined, 'Beginner'),

          // Course length
          header(context, 'Course Length'),
          const SizedBox(
            height: 8,
          ),
          subHeading(context, Icons.my_library_books_outlined, '5 topics'),

          // List topic
          header(context, 'List Topic'),
          topicList(),
          const SizedBox(
            height: 16,
          ),

          // Suggested tutors
          header(context, 'Suggested Tutors'),
          const SizedBox(
            height: 8,
          ),
          suggestedTutorList()
        ],
      ),
    );
  }
}

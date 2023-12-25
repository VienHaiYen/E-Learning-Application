// ignore_for_file: must_be_immutable

import 'package:cached_network_image/cached_network_image.dart';
import 'package:elearning_app/models/course/course.dart';
import 'package:elearning_app/models/course/course_topic.dart';
import 'package:elearning_app/provider/auth_provider.dart';
import 'package:elearning_app/widgets/my_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:elearning_app/services/course_service.dart';
import 'package:elearning_app/widgets/group_fixed_button.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

final courseLevels = {
  '0': 'Any level',
  '1': 'Beginner',
  '2': 'High Beginner',
  '3': 'Pre-Intermediate',
  '4': 'Intermediate',
  '5': 'Upper-Intermediate',
  '6': 'Advanced',
  '7': 'Proficiency'
};

class CourseDetail extends StatefulWidget {
  CourseDetail({super.key, required this.courseId});

  final String courseId;

  @override
  State<CourseDetail> createState() => _CourseDetailState();
}

class _CourseDetailState extends State<CourseDetail> {
  TextEditingController courseC = TextEditingController();

  late final String courseId;
  late final Course courseDetail;

  bool _isLoading = true;

  Future<void> _fetchCourseDetail(String token) async {
    final result = await CourseService.getCourseDetailById(
      token: token,
      courseId: widget.courseId,
    );

    setState(() {
      courseDetail = result;
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    final authProvider = context.watch<AuthProvider>();

    if (_isLoading && authProvider.token != null) {
      courseId = widget.courseId;
      final String accessToken = authProvider.token?.access?.token as String;
      _fetchCourseDetail(accessToken);
    }
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
                style:
                    const TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
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

    Widget topicList(List<CourseTopic> topics) {
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
                padding:
                    const EdgeInsets.symmetric(horizontal: 8, vertical: 36),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('${index + 1}.'),
                    const SizedBox(
                      height: 8,
                    ),
                    Text(topics[index].name ?? 'null.',
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
                // Navigator.push(context,
                //     MaterialPageRoute(builder: (context) => const TutorView()));
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

    return Scaffold(
        appBar: MyAppBar(),
        body: Stack(children: [
          Positioned(bottom: 20, right: 20, child: GroupFixedButton()),
          SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              children: [
                Container(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: GestureDetector(
                      onTap: null,
                      child: Card(
                        elevation: 8,
                        child: SizedBox(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CachedNetworkImage(
                                imageUrl: courseDetail.imageUrl ?? '',
                                fit: BoxFit.cover,
                                placeholder: (context, url) => const Icon(
                                  Icons.image_rounded,
                                  size: 48,
                                  color: Colors.grey,
                                ),
                                errorWidget: (context, url, error) =>
                                    const Icon(
                                  Icons.error_outline_rounded,
                                  size: 32,
                                  color: Colors.redAccent,
                                ),
                              ),
                              Container(
                                padding:
                                    const EdgeInsets.fromLTRB(10, 10, 10, 15),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      courseDetail.name ?? "null name",
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      style: const TextStyle(
                                          fontSize: 19,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Container(
                                      margin: const EdgeInsets.only(
                                          top: 8, bottom: 15),
                                      child: Text(
                                        courseDetail.description ?? 'null.',
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(
                                            fontSize: 12,
                                            color: Colors.grey[800]),
                                      ),
                                    ),
                                    // bottomWidget ??
                                    Text(
                                      'Any level',
                                      style: TextStyle(
                                          fontSize: 15,
                                          color: Colors.grey[800]),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    )),

                // Overview
                header(context, 'Overview'),
                const SizedBox(
                  height: 8,
                ),
                description(context, Icons.question_mark_outlined,
                    'Why take this course', courseDetail.reason ?? 'null.'),
                const SizedBox(
                  height: 8,
                ),
                description(
                    context,
                    Icons.question_mark_outlined,
                    'What will you be able to do',
                    courseDetail.purpose ?? 'null.'),
                const SizedBox(
                  height: 16,
                ),

                // Experience level
                header(context, 'Experience Level'),
                const SizedBox(
                  height: 8,
                ),
                subHeading(context, Icons.person_add_alt_1_outlined,
                    courseLevels[courseDetail.level ?? '0'] ?? 'null.'),

                // Course length
                header(context, 'Course Length'),
                const SizedBox(
                  height: 8,
                ),
                subHeading(context, Icons.my_library_books_outlined,
                    '${courseDetail.topics!.length ?? ''} topics'),

                // List topic
                header(context, 'List Topic'),
                topicList(courseDetail.topics ?? []),
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
          ),
        ]));
  }
}

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:elearning_app/routers/routers.dart';
import 'package:elearning_app/models/course/course.dart';

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

class CourseCard extends StatelessWidget {
  const CourseCard({
    Key? key,
    required this.course,
  }) : super(key: key);

  final Course course;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(
          context,
          AppRouter.courseDetail,
          arguments: {'courseId': course.id ?? 'null courseId'},
        );
      },
      child: Card(
        margin: const EdgeInsets.symmetric(vertical: 8),
        clipBehavior: Clip.hardEdge,
        elevation: 2,
        surfaceTintColor: Colors.white,
        child: Column(
          children: [
            CachedNetworkImage(
              imageUrl: course.imageUrl ?? '',
              fit: BoxFit.cover,
              placeholder: (context, url) => const Icon(
                Icons.image_rounded,
                size: 48,
                color: Colors.grey,
              ),
              errorWidget: (context, url, error) => const Icon(
                Icons.error_outline_rounded,
                size: 32,
                color: Colors.redAccent,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    course.name ?? 'null course name',
                    style: Theme.of(context).textTheme.headline3,
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Text(
                    course.description ?? 'null course description',
                    style: const TextStyle(
                        fontWeight: FontWeight.w400, color: Colors.grey),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          courseLevels[course.level!] ?? 'null course level',
                          style: const TextStyle(fontSize: 18),
                        ),
                      ),
                      Text(
                        '${course.topics!.length} lessons',
                        style: const TextStyle(fontSize: 18),
                      )
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

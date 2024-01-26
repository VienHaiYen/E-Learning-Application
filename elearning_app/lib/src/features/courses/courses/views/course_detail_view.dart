import 'package:flutter/material.dart';
import 'package:elearning_app/src/constants/course_levels.dart';

import 'package:elearning_app/src/features/courses/courses/widgets/topic_card.dart';
import 'package:elearning_app/src/models/course/course.dart';
import 'package:elearning_app/src/providers/auth_provider.dart';
import 'package:elearning_app/src/services/course_service.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class CourseDetailView extends StatefulWidget {
  const CourseDetailView({
    Key? key,
  }) : super(key: key);

  @override
  State<CourseDetailView> createState() => _CourseDetailState();
}

class _CourseDetailState extends State<CourseDetailView> {
  late final String courseId;
  late final Course courseDetail;

  bool _isLoading = true;

  Future<void> _fetchCourseDetail(String token) async {
    final result = await CourseService.getCourseDetailById(
      token: token,
      courseId: courseId,
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
      courseId = ModalRoute.of(context)!.settings.arguments as String;
      final String accessToken = authProvider.token?.access?.token as String;
      _fetchCourseDetail(accessToken);
    }

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: BackButton(
          color: Colors.blue[600],
        ),
        title: Text(
          'Course Detail',
          style: Theme.of(context).textTheme.headline2,
        ),
      ),
      body: _isLoading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : SingleChildScrollView(
              padding: const EdgeInsets.only(bottom: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.network(
                    courseDetail.imageUrl ?? '',
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) => const Icon(
                        Icons.error_outline_rounded,
                        size: 32,
                        color: Colors.redAccent),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                    child: Text(
                      courseDetail.name ?? '',
                      style: const TextStyle(
                        fontSize: 26,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Text(
                      courseDetail.description ?? '',
                      style: const TextStyle(fontSize: 16),
                    ),
                  ),
                  const SizedBox(height: 16),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Text(
                      AppLocalizations.of(context)!.overview,
                      style: Theme.of(context).textTheme.headline3,
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                    child: Row(
                      children: [
                        const Icon(Icons.help_outline, color: Colors.blue),
                        const SizedBox(width: 8),
                        Text(
                          AppLocalizations.of(context)!.why_take_course,
                          style: Theme.of(context).textTheme.headline4,
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 48, right: 16),
                    child: Text(courseDetail.reason ?? ''),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                    child: Row(
                      children: [
                        const Icon(Icons.help_outline, color: Colors.blue),
                        const SizedBox(width: 8),
                        Text(
                          AppLocalizations.of(context)!.what_able_to_do,
                          style: Theme.of(context).textTheme.headline4,
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 48, right: 16),
                    child: Text(courseDetail.purpose ?? ''),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
                    child: Text(
                      AppLocalizations.of(context)!.experience_level,
                      style: Theme.of(context).textTheme.headline3,
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                    child: Row(
                      children: [
                        const Icon(Icons.group_add_outlined,
                            color: Colors.blue),
                        const SizedBox(width: 8),
                        Text(
                          courseLevels[courseDetail.level ?? '0'] ?? '',
                          style: Theme.of(context).textTheme.headline4,
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
                    child: Text(
                      AppLocalizations.of(context)!.course_length,
                      style: Theme.of(context).textTheme.headline3,
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                    child: Row(
                      children: [
                        const Icon(Icons.book_outlined, color: Colors.blue),
                        const SizedBox(width: 8),
                        Text(
                          '${courseDetail.topics!.length} Topics',
                          style: Theme.of(context).textTheme.headline4,
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
                    child: Text(
                      AppLocalizations.of(context)!.list_topics,
                      style: Theme.of(context).textTheme.headline3,
                    ),
                  ),
                  ...List<Widget>.generate(
                    courseDetail.topics?.length ?? 0,
                    (index) => TopicCard(
                      index: index,
                      topic: courseDetail.topics![index],
                    ),
                  ),
                ],
              ),
            ),
    );
  }
}

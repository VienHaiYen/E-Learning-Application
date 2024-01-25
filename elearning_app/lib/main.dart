import 'dart:io';
import 'package:elearning_app/src/app_style/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:elearning_app/src/features/courses/courses/views/course_detail_view.dart';
import 'package:elearning_app/src/features/tutor/search_tutor/views/tutor_search_result.dart';
import 'package:elearning_app/src/features/tutor/tutor_feedback/tutor_feedback_view.dart';
import 'package:provider/provider.dart';

import 'package:elearning_app/src/providers/app_provider.dart';
import 'package:elearning_app/src/providers/auth_provider.dart';
import 'package:elearning_app/src/constants/routes.dart';

import 'package:elearning_app/src/features/authentication/login_view.dart';
import 'package:elearning_app/src/features/authentication/register_view.dart';
import 'package:elearning_app/src/features/navigation/navigation_page.dart';
import 'package:elearning_app/src/features/tutor/tutor_detail/tutor_detail_view.dart';
import 'package:elearning_app/src/features/user_profile/user_profile_view.dart';

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}

void main() {
  HttpOverrides.global = MyHttpOverrides();
  runApp(const Elearning_app());
}

class Elearning_app extends StatelessWidget {
  const Elearning_app({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => AppProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => AuthProvider(),
        ),
      ],
      child: MaterialApp(
          title: 'Elearning_app',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
              useMaterial3: true,
              primaryColor: Colors.blue,
              scaffoldBackgroundColor: Colors.white,
              textTheme: AppThemes.textTheme),
          home: const LoginView(),
          routes: {
            Routes.login: (context) => const LoginView(),
            Routes.register: (context) => const RegisterView(),
            Routes.main: (context) => const NavigationPage(),
            Routes.userProfile: (context) => const UserProfileView(),
            Routes.courseDetail: (context) => const CourseDetailView(),
            Routes.teacherDetail: (context) => const TutorDetailView(),
            Routes.review: (context) => const TutorFeedbackView(),
            // Routes.writeReview: (context) => const WriteReviewView(),
            Routes.tutorSearchResult: (context) => const TutorSearchResult(),
          }),
    );
  }
}

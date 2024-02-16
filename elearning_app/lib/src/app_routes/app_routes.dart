import 'package:elearning_app/src/features/courses/courses/views/course_detail_view.dart';
import 'package:elearning_app/src/features/tutor/search_tutor/views/tutor_search_result.dart';
import 'package:elearning_app/src/features/tutor/tutor_feedback/tutor_feedback_view.dart';
import 'package:elearning_app/src/features/authentication/register_view.dart';
import 'package:elearning_app/src/features/navigation/navigation_page.dart';
import 'package:elearning_app/src/features/tutor/tutor_detail/tutor_detail_view.dart';
import 'package:elearning_app/src/features/user_profile/user_profile_view.dart';
import 'package:elearning_app/src/features/authentication/login_view.dart';
import 'package:elearning_app/src/constants/routes.dart';

final AppRoutes = {
  Routes.login: (context) => const LoginView(),
  Routes.register: (context) => const RegisterView(),
  Routes.main: (context) => const NavigationPage(),
  Routes.userProfile: (context) => const UserProfileView(),
  Routes.courseDetail: (context) => const CourseDetailView(),
  Routes.teacherDetail: (context) => const TutorDetailView(),
  Routes.review: (context) => const TutorFeedbackView(),
  // Routes.writeReview: (context) => const WriteReviewView(),
  Routes.tutorSearchResult: (context) => const TutorSearchResult(),
};

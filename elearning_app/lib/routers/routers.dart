import 'package:elearning_app/screens/booking/booking.dart';
import 'package:elearning_app/screens/home/home.dart';
import 'package:elearning_app/screens/unknown/unknown.dart';
import 'package:flutter/material.dart';

import 'package:elearning_app/screens/authenticate/signUp.dart';
import 'package:elearning_app/screens/authenticate/logIn.dart';
import 'package:elearning_app/screens/authenticate/forgetPassword.dart';
import 'package:elearning_app/screens/findingTutor/findingTutor.dart';
import 'package:elearning_app/screens/tutorHome/tutorHome.dart';
import 'package:elearning_app/screens/tutor_view/tutor_view.dart';
import 'package:elearning_app/screens/calendar_view/calendar_view.dart';
import 'package:elearning_app/screens/calendar_detail/calendar_detail.dart';
import 'package:elearning_app/screens/history/history.dart';
import 'package:elearning_app/screens/history_detail/history_detail.dart';
import 'package:elearning_app/screens/courses_view/courses_view.dart';
import 'package:elearning_app/screens/my_course/my_course.dart';
// import 'package:elearning_app/screens/menu_list/menu_list.dart';
import 'package:elearning_app/screens/wallet/wallet.dart';
import 'package:elearning_app/screens/meeting/meeting.dart';
import 'package:elearning_app/screens/course_detail/course_detail.dart';
import 'package:elearning_app/screens/become_tutor/become_tutor.dart';
import 'package:elearning_app/screens/setting/setting.dart';

class AppRouter {
  AppRouter._();

  // Authentication pages
  static const String logIn = '/log-in';
  static const String signUp = '/sign-up';
  static const String forgotPassword = '/forgot-password';

  // Home page
  static const String home = '/home';

  static const String findingTutor = '/finding-tutor';
  // TODO: Tutor screen, must add
  static const String tutorHome = '/tutor-home';

  // Tutor pages
  // TODO: check lai
  static const String tutorView = '/tutor-view';

// TODO: Not yet make UI for this page
  static const String booking = '/booking';

  // Course pages
  static const String courses = '/courses';
  static const String courseDetail = '/course-detail';

  // Profile pages
  static const String myWallet = '/my-wallet';
  static const String myHistory = '/my-history';
  static const String historyDetail = '/history-detail';
  static const String myCourses = '/my-courses';
  static const String becomeTutor = '/become-tutor';
  static const String myCalendar = '/calendar';
  static const String calendarDetail = '/calendar-detail';

  // Meeting page
  static const String meeting = '/meeting';

  // Setting page
  static const String setting = '/setting';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case home:
        return MaterialPageRoute(
          builder: (context) => const Home(),
        );
      case logIn:
        return MaterialPageRoute(
          builder: (context) => const LogIn(),
        );
      case signUp:
        return MaterialPageRoute(
          builder: (context) => const SignUp(),
        );
      case forgotPassword:
        return MaterialPageRoute(
          builder: (context) => const ForgetPassword(),
        );
      case findingTutor:
        return MaterialPageRoute(
          builder: (context) => const FindingTutor(),
        );
      case tutorHome:
        return MaterialPageRoute(
          builder: (context) => const TutorHome(),
        );
      case tutorView:
        final args = settings.arguments as Map<String, dynamic>;
        return MaterialPageRoute(
          builder: (context) => TutorView(
            tutor: args["tutor"],
            userId: args["userId"],
          ),
        );
      // TODO: cosider Booking Page
      case booking:
        return MaterialPageRoute(
          builder: (context) => const Booking(
              // tutorId: settings.arguments as String,
              ),
        );
      // TODO: cosider Tutor review Page
      // TODO: cosider Writing review Page

      case courses:
        return MaterialPageRoute(
          builder: (context) => CoursesView(),
        );
      case courseDetail:
        final args = settings.arguments as Map<String, dynamic>;
        return MaterialPageRoute(
          builder: (context) => CourseDetail(
            courseId: args["courseId"],
          ),
        );

      // TODO: cosider Topic Page
      // TODO: cosider Profile Page
      // TODO: cosider My Profile Page

      case myWallet:
        return MaterialPageRoute(
          builder: (context) => Wallet(),
        );
      case myCalendar:
        return MaterialPageRoute(
          builder: (context) => const CalendarView(),
        );
      // TODO: Not yet write UI for this page
      case calendarDetail:
        return MaterialPageRoute(
          builder: (context) => const CalendarDetail(),
        );
      case myHistory:
        return MaterialPageRoute(
          builder: (context) => const History(),
        );
      // TODO: Not yet write UI for this page
      case historyDetail:
        return MaterialPageRoute(
          builder: (context) => const HistoryDetail(
              // historyInfo: settings.arguments as NextSchedule,
              ),
        );
      case myCourses:
        return MaterialPageRoute(
          builder: (context) => MyCourse(),
        );
      // TODO: cosider Change password Page

      // TODO: Not yet write UI for this page
      case becomeTutor:
        return MaterialPageRoute(
          builder: (context) => const BecomeTutor(),
        );
      case meeting:
        return MaterialPageRoute(
          builder: (context) => Meeting(),
        );
      case setting:
        return MaterialPageRoute(
          builder: (context) => const Setting(),
        );

      // TODO: Not yet write UI for this page
      default:
        return MaterialPageRoute(
          builder: (context) => const Unknown(),
        );
    }
  }
}

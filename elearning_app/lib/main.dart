import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:elearning_app/l10n/l10n.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'package:elearning_app/app_style/theme.dart';

import 'package:elearning_app/screens/authenticate/signUp.dart';
import 'package:elearning_app/screens/authenticate/logIn.dart';
import 'package:elearning_app/screens/dashboard/dashboard.dart';
import 'package:elearning_app/screens/tutor/tutor.dart';
import 'package:elearning_app/screens/calendar/calendar.dart';
import 'package:elearning_app/screens/history/history.dart';
import 'package:elearning_app/screens/course/course.dart';
import 'package:elearning_app/screens/my_course/my_course.dart';
import 'package:elearning_app/screens/menu_list/menu_list.dart';
import 'package:elearning_app/screens/wallet/wallet.dart';
import 'package:elearning_app/screens/meeting/meeting.dart';
import 'package:elearning_app/screens/course_detail/course_detail.dart';

void main() {
  runApp(MaterialApp(
      title: 'Localizations Sample App',
      debugShowCheckedModeBanner: false,
      locale: const Locale('vi'),
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: L10n.all,
      home: MyApp()));
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return LogIn();
  }
}

import 'package:flutter/material.dart';
import 'screens/Home/Home.dart';
import 'screens/FindTutor/FindTutor.dart';
import 'screens/TutorInfo/TutorInfo.dart';
import 'screens/Schedule/Schedule.dart';

// class MyApp extends StatelessWidget {
//   const MyApp({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return const Material(child: Home());
//   }
// }

void main() {
  runApp(const MaterialApp(title: 'E-Learning App', home: Schedule()));
}

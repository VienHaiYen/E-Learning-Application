import 'package:flutter/material.dart';
import 'screens/Home.dart';
import 'screens/FindTutor.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Material(child: Home());
  }
}

void main() {
  runApp(const MaterialApp(title: 'Shopping App', home: FindTutor()));
}
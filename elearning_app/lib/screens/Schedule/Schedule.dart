import 'package:flutter/material.dart';
import './widgets/Header.dart';
import './widgets/ScheduleItem.dart';

class Schedule extends StatelessWidget {
  const Schedule({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: "Login",
        home: Scaffold(
            body: ListView(
          children: const <Widget>[
            Header(),
            ScheduleItem(),
          ],
        )));
  }
}

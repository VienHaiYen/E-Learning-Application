import 'package:elearning_app/screens/courses/courses.dart';
import 'package:elearning_app/screens/findingTutor/findingTutor.dart';
import 'package:elearning_app/screens/tutorHome/tutorHome.dart';
import 'package:flutter/material.dart';

import 'package:elearning_app/widgets/bottom_navbar.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var selectedIndex = 0;
  var screens = [const FindingTutor(), Courses(), const TutorHome()];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        bottomNavigationBar: BottomNavbar(
          selectedIndex: selectedIndex,
          onClicked: (int index) {
            setState(() {
              selectedIndex = index;
            });
          },
        ),
        body: screens[selectedIndex],
      ),
    );
  }
}

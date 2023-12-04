import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:elearning_app/widgets/group_fixed_button.dart';

import 'package:flutter/material.dart';

// TODO: Not setup or have element
class Meeting extends StatelessWidget {
  Meeting({super.key});

  TextEditingController courseC = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: "Learning Courses",
        theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(
                seedColor: Colors.black,
                primary: const Color.fromARGB(255, 250, 210, 8),
                brightness: Brightness.light)),
        home: Scaffold(
            appBar: AppBar(
                backgroundColor: Colors.white,
                title: const Text(
                  "elearning_app",
                  style: TextStyle(
                      color: Colors.blueAccent,
                      fontSize: 26,
                      fontWeight: FontWeight.w600),
                )),
            body: const Stack(children: [
              MeetingBody(),
              Positioned(bottom: 20, right: 20, child: GroupFixedButton())
            ])));
  }
}

class MeetingBody extends StatefulWidget {
  const MeetingBody({Key? key}) : super(key: key);
  @override
  State<MeetingBody> createState() => _MeetingBodyState();
}

class _MeetingBodyState extends State<MeetingBody> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'Meeting',
          style: Theme.of(context).textTheme.headline6,
        ),
        const SizedBox(
          height: 8,
        ),
      ],
    );
  }
}

import 'package:elearning_app/widgets/my_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:elearning_app/widgets/group_fixed_button.dart';

// TODO: Not setup or have element
// ignore: must_be_immutable
class Meeting extends StatelessWidget {
  Meeting({super.key});

  TextEditingController courseC = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        appBar: MyAppBar(),
        body: Stack(children: [
          MeetingBody(),
          Positioned(bottom: 20, right: 20, child: GroupFixedButton())
        ]));
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

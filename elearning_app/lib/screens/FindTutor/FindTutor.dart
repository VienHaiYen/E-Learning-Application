import 'package:flutter/material.dart';
import '../../widgets/Heading.dart';
import '../../widgets/TutorListItem.dart';

class FindTutor extends StatelessWidget {
  const FindTutor({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController nameInput = TextEditingController();
    TextEditingController passwordInput = TextEditingController();
    return MaterialApp(
        title: "Login",
        home: Scaffold(
            body: ListView(
                // padding: const EdgeInsets.all(16.0),
                children: <Widget>[
              const Heading("Find a tutor"),
              Container(
                padding: const EdgeInsets.all(10),
                child: TextField(
                  obscureText: true,
                  controller: passwordInput,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Enter tutor name',
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.all(10),
                child: TextField(
                  obscureText: true,
                  controller: nameInput,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Select tutor nationality',
                  ),
                ),
              ),
              TutorListItem()
            ])));
  }
}

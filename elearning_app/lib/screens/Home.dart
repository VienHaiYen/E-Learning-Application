import 'package:flutter/material.dart';

import '../widgets/LogIn.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: "Login",
        home: Scaffold(
            appBar: AppBar(
              title: const Text("Log In"),
              backgroundColor: Colors.black,
            ),
            body: const LogIn()));
  }
}

import 'package:flutter/material.dart';
import './Heading.dart';

class LogIn extends StatelessWidget {
  const LogIn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController nameInput = TextEditingController();
    TextEditingController passwordInput = TextEditingController();
    return ListView(children: <Widget>[
      const Heading("Log In"),
      Container(
        padding: const EdgeInsets.all(10),
        child: TextField(
          controller: nameInput,
          decoration: const InputDecoration(
            border: OutlineInputBorder(),
            labelText: 'Email',
          ),
        ),
      ),
      Container(
        padding: const EdgeInsets.all(10),
        child: TextField(
          obscureText: true,
          controller: passwordInput,
          decoration: const InputDecoration(
            border: OutlineInputBorder(),
            labelText: 'Password',
          ),
        ),
      ),
      TextButton(
        onPressed: () {
          //forgot password screen
        },
        child: const Text(
          'Forgot Password  ',
        ),
      ),
      Container(
          height: 50,
          padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
          child: ElevatedButton(
            child: const Text('LOG IN'),
            onPressed: () {
              // Login
            },
          )),
    ]);
  }
}

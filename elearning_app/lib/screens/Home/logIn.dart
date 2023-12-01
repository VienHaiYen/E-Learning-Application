import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:elearning_app/screens/Home/forget_password.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("LetTutor")),
      body: const LoginBody(),
    );
  }
}

class LoginBody extends StatefulWidget {
  const LoginBody({super.key});

  @override
  State<LoginBody> createState() => _LoginBodyState();
}

class _LoginBodyState extends State<LoginBody> {
  late String message = '';
  late bool isSuccess = false;

  @override
  Widget build(BuildContext context) {
    TextEditingController nameController = TextEditingController();
    TextEditingController passwordController = TextEditingController();

    return Padding(
      padding: const EdgeInsets.all(10),
      child: ListView(
        children: <Widget>[
          Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.all(10),
              child: const Text(
                "Sign-In",
                style: TextStyle(
                    color: Colors.blue,
                    fontWeight: FontWeight.w500,
                    fontSize: 30),
              )),
          Container(
            padding: const EdgeInsets.all(10),
            child: TextField(
              controller: nameController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: "Email",
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
            child: TextField(
              obscureText: true,
              controller: passwordController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: "Password",
              ),
            ),
          ),
          message != ''
              ? Container(
                  margin: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                  alignment: Alignment.centerLeft,
                  child: Text(
                    message,
                    style:
                        TextStyle(color: isSuccess ? Colors.green : Colors.red),
                  ),
                )
              : Container(),
          TextButton(
            onPressed: () {},
            child: const Text(
              "Forgot Password",
            ),
          ),
          Container(
            height: 50,
            padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
            child: ElevatedButton(
                child: const Text("Sign In"),
                onPressed: () async {
                  if (nameController.text == '' ||
                      passwordController.text == '') {
                    setState(() {
                      isSuccess = false;
                      message = "Empty";
                    });
                  } else {
                    if (!mounted) return;
                  }
                }),
          ),
          Container(
            margin: const EdgeInsets.fromLTRB(0, 30, 0, 0),
            alignment: Alignment.center,
            // child: Text(lang.continueWith),
          ),
          Container(
            margin: const EdgeInsets.fromLTRB(0, 30, 0, 10),
            alignment: Alignment.center,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                        shape: const CircleBorder(
                            side:
                                BorderSide(width: 1, color: Color(0xff007CFF))),
                        backgroundColor: Colors.white,
                        padding: const EdgeInsets.all(5)),
                    child: SvgPicture.asset("asset/svg/ic_facebook.svg",
                        width: 30, height: 30, color: const Color(0xff007CFF))),
                ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                        shape: const CircleBorder(
                            side:
                                BorderSide(width: 1, color: Color(0xff007CFF))),
                        backgroundColor: Colors.white,
                        padding: const EdgeInsets.all(5)),
                    child: SvgPicture.asset("asset/svg/ic_google.svg",
                        width: 30, height: 30)),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TextButton(
                child: const Text(
                  "Sign UP",
                  style: TextStyle(fontSize: 18),
                ),
                onPressed: () {},
              )
            ],
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("LetTutor")),
      body: const RegisterBody(),
    );
  }
}

class RegisterBody extends StatefulWidget {
  const RegisterBody({super.key});

  @override
  State<RegisterBody> createState() => _RegisterBodyState();
}

class _RegisterBodyState extends State<RegisterBody> {
  late String message = '';
  late bool isSuccess = false;

  @override
  Widget build(BuildContext context) {
    TextEditingController nameController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
    TextEditingController repasswordController = TextEditingController();

    return Padding(
      padding: const EdgeInsets.all(10),
      child: ListView(
        children: <Widget>[
          Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.all(10),
              child: Text(
                "signUp",
                style: const TextStyle(
                    color: Colors.blue,
                    fontWeight: FontWeight.w500,
                    fontSize: 30),
              )),
          Container(
            padding: const EdgeInsets.all(10),
            child: TextField(
              controller: nameController,
              decoration: InputDecoration(
                border: const OutlineInputBorder(),
                labelText: "email",
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.fromLTRB(10, 10, 10, 20),
            child: TextField(
              obscureText: true,
              controller: passwordController,
              decoration: InputDecoration(
                border: const OutlineInputBorder(),
                labelText: "password",
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.fromLTRB(10, 10, 10, 20),
            child: TextField(
              obscureText: true,
              controller: repasswordController,
              decoration: InputDecoration(
                border: const OutlineInputBorder(),
                labelText: "confirmPassword",
              ),
            ),
          ),
          message != ''
              ? Container(
                  margin: const EdgeInsets.fromLTRB(10, 0, 10, 20),
                  alignment: Alignment.centerLeft,
                  child: Text(
                    message,
                    style:
                        TextStyle(color: isSuccess ? Colors.green : Colors.red),
                  ),
                )
              : Container(),
          Container(
            height: 50,
            padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
            child: ElevatedButton(
                child: Text("signUp"),
                onPressed: () async {
                  if (nameController.text == '' ||
                      passwordController.text == '' ||
                      repasswordController.text == '') {
                    setState(() {
                      isSuccess = false;
                      message = "emptyField";
                    });
                  }
                }),
          ),
          Container(
            margin: const EdgeInsets.fromLTRB(0, 30, 0, 0),
            alignment: Alignment.center,
            child: Text("continueWith"),
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
              Text("loginQuestion"),
              TextButton(
                child: Text(
                  "signIn",
                  style: const TextStyle(fontSize: 18),
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
              )
            ],
          ),
        ],
      ),
    );
  }
}

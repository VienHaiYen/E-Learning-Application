// ignore: file_names
import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';
import 'package:lettutor/screens/authenticate/signUp.dart';
import 'package:lettutor/screens/authenticate/forgetPassword.dart';

class LogIn extends StatelessWidget {
  const LogIn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: "Log In Screen",
        home: Scaffold(
            appBar: AppBar(
                // leading: const Icon(Icons.book_online),
                title: const Text("Lettutor")),
            body: LogInBody()));
  }
}

class LogInBody extends StatelessWidget {
  LogInBody({super.key});

  TextEditingController nameC = TextEditingController();
  TextEditingController passwordC = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(24, 0, 24, 0),
      child: ListView(
        children: <Widget>[
          Image.asset("assets/images/login.png"),
          Container(
              padding: const EdgeInsets.fromLTRB(8, 16, 8, 16),
              alignment: Alignment.center,
              child: Column(
                children: [
                  Padding(
                      padding: EdgeInsets.all(8),
                      child: Text("Đăng Nhập",
                          style: TextStyle(
                            color: Colors.blue[700],
                            fontSize: 26,
                            fontWeight: FontWeight.w600,
                          ))),
                  const Text(
                      "Phát triển kĩ năng tiếng anh nhanh nhất bằng cách học 1 kèm 1 trực tuyến theo mục tiêu và lộ trình dành cho riêng bạn",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 16,
                      )),
                  TextField(
                    controller: nameC,
                    style: const TextStyle(fontSize: 14),
                    decoration: const InputDecoration(
                      prefixIcon: Icon(Icons.account_circle),
                      labelText: 'Địa chỉ Email',
                      hintText: 'mail@example.com',
                      labelStyle: TextStyle(fontSize: 14, color: Colors.grey),
                      hintStyle: TextStyle(fontSize: 14, color: Colors.grey),
                      // filled: true,
                    ),
                  ),
                  TextField(
                    controller: passwordC,
                    obscureText: true,
                    decoration: const InputDecoration(
                      prefixIcon: Icon(Icons.key),
                      labelText: 'Mật khẩu',
                      hintText: 'mail@example.com',
                      labelStyle: TextStyle(fontSize: 14, color: Colors.grey),
                      hintStyle: TextStyle(fontSize: 14, color: Colors.grey),
                      // filled: true,
                    ),
                  ),
                  Container(
                      height: 32,
                      alignment: Alignment.topLeft,
                      child: TextButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const ForgetPassword()),
                            );
                          },
                          child: const Text(
                            "Quên mật khẩu",
                            style: TextStyle(fontWeight: FontWeight.normal),
                          ))),
                  Container(
                    margin: const EdgeInsets.only(top: 20),
                    width: double.infinity,
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor:
                              const Color.fromARGB(255, 29, 137, 225),
                        ),
                        onPressed: () {},
                        child: Text(
                          "Đăng nhập".toUpperCase(),
                          style: const TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 16),
                        )),
                  ),
                  Container(
                      margin: const EdgeInsets.fromLTRB(0, 12, 0, 12),
                      child: const Text(
                        "Hoặc tiếp tục với",
                      )),
                  Container(
                      margin: const EdgeInsets.symmetric(
                          vertical: 8, horizontal: 40),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          GFIconButton(
                            onPressed: () {},
                            icon: const Icon(Icons.facebook_sharp),
                            type: GFButtonType.transparent,
                            // shape: GFIconButtonShape.circle,
                          ),
                          GFIconButton(
                            onPressed: () {},
                            icon: const Icon(Icons.mail),
                            type: GFButtonType.transparent,
                          ),
                          GFIconButton(
                            onPressed: () {},
                            icon: const Icon(Icons.phone_android),
                            type: GFButtonType.transparent,
                          ),
                        ],
                      )),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text("Chưa có tài khoản"),
                      TextButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const LogIn()),
                            );
                          },
                          child: const Text("Đăng kí"))
                    ],
                  )
                ],
              ))
        ],
      ),
    );
  }
}

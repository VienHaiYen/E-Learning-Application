// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:elearning_app/screens/authenticate/logIn.dart';

class ForgetPassword extends StatelessWidget {
  const ForgetPassword({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: "Forget password Screen",
        home: Scaffold(
            appBar: AppBar(
                // leading: const Icon(Icons.book_online),
                title: const Text("elearning_app")),
            body: InputMail()));
  }
}

class InputMail extends StatelessWidget {
  InputMail({super.key});

  TextEditingController nameC = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(30),
      child: Column(
        children: [
          const Text(
            "Đặt lại mật khẩu",
            style: TextStyle(fontSize: 26, fontWeight: FontWeight.w600),
          ),
          const Text("Vui lòng nhập email để tìm kiếm tìa khoản của bạn"),
          Container(
            margin: const EdgeInsets.symmetric(vertical: 12),
            child: TextField(
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
          ),
          ElevatedButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const LogIn()));
              },
              child: const Text("Xác nhận"))
        ],
      ),
    );
  }
}

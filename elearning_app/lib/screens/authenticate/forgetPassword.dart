// ignore_for_file: must_be_immutable

import 'package:elearning_app/routers/routers.dart';
import 'package:elearning_app/widgets/my_app_bar.dart';
import 'package:flutter/material.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ForgetPassword extends StatelessWidget {
  const ForgetPassword({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: MyAppBar(), body: InputMail());
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
          Text(
            AppLocalizations.of(context)!.forgot_password,
            style: const TextStyle(fontSize: 26, fontWeight: FontWeight.w600),
          ),
          Text(AppLocalizations.of(context)!.email_reset_password),
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
                Navigator.pushNamed(context, AppRouter.logIn);
              },
              child: Text(AppLocalizations.of(context)!.confirm_password))
        ],
      ),
    );
  }
}

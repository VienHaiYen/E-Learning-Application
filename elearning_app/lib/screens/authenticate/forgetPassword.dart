// ignore_for_file: must_be_immutable

import 'package:elearning_app/provider/app_provider.dart';
import 'package:elearning_app/routers/routers.dart';
import 'package:elearning_app/services/auth_service.dart';
import 'package:elearning_app/widgets/my_app_bar.dart';
import 'package:flutter/material.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ForgetPassword extends StatefulWidget {
  const ForgetPassword({Key? key}) : super(key: key);

  @override
  State<ForgetPassword> createState() => _ForgetPasswordState();
}

class _ForgetPasswordState extends State<ForgetPassword> {
  final _emailController = TextEditingController();

  String _emailErrorText = '';
  bool _isValidToSend = false;

  void _handleValidation() {
    final emailRegExp = RegExp(
        r'^[a-zA-Z0-9.!#$%&’*+/=?^_`{|}~-]+@[a-zA-Z0-9-]+(?:\.[a-zA-Z0-9-]+)*$');
    if (_emailController.text.isEmpty) {
      _emailErrorText = AppLocalizations.of(context)!.email_empty;
      _isValidToSend = false;
    } else if (!emailRegExp.hasMatch(_emailController.text)) {
      _emailErrorText = AppLocalizations.of(context)!.email_wrong_format;
      _isValidToSend = false;
    } else {
      _emailErrorText = '';
      _isValidToSend = true;
    }
    setState(() {});
  }

  void _handleForgotPassword() async {
    try {
      await AuthService.forgotPassword(_emailController.text);

      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
              content: Text("Sent recovery email to ${_emailController.text}")),
        );
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error Reset Password: ${e.toString()}')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(),
      body: SingleChildScrollView(
        padding:
            EdgeInsets.fromLTRB(16, MediaQuery.of(context).padding.top, 16, 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 36),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/logo/lettutor.png',
                    width: 100,
                    height: 100,
                  ),
                  Text(
                    ' LetTutor ',
                    style: Theme.of(context).textTheme.headline1,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),
            Text(
              AppLocalizations.of(context)!.email_reset_password,
              style: Theme.of(context).textTheme.bodyText1,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 16),
            Text(
              AppLocalizations.of(context)!.email,
              style: const TextStyle(fontSize: 16, color: Colors.grey),
            ),
            const SizedBox(height: 8),
            TextField(
              controller: _emailController,
              keyboardType: TextInputType.emailAddress,
              autocorrect: false,
              onChanged: (value) {
                _handleValidation();
              },
              decoration: InputDecoration(
                hintStyle: TextStyle(color: Colors.grey[400]),
                hintText: "abc@example.com",
                prefixIcon: Icon(
                  Icons.mail,
                  color:
                      _emailErrorText.isEmpty ? Colors.blue : Colors.red[700],
                ),
                errorText: _emailErrorText.isEmpty ? null : _emailErrorText,
                border: const OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey, width: 2),
                    borderRadius: BorderRadius.all(Radius.circular(10))),
              ),
            ),
            const SizedBox(height: 24),
            TextButton(
              onPressed: _isValidToSend
                  ? () {
                      _handleForgotPassword();
                    }
                  : null,
              style: TextButton.styleFrom(
                minimumSize: const Size.fromHeight(56),
                backgroundColor:
                    _isValidToSend ? Colors.blue : Colors.grey[400],
              ),
              child: Text(
                AppLocalizations.of(context)!.sent_to_email,
                style: const TextStyle(fontSize: 18, color: Colors.white),
              ),
            ),
            const SizedBox(height: 8),
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text(
                AppLocalizations.of(context)!.sign_in,
                style: const TextStyle(fontSize: 16),
              ),
            ),
          ],
        ),
      ),
    );
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

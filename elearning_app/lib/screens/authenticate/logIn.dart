// ignore: file_names
// ignore_for_file: must_be_immutable

import 'package:elearning_app/provider/auth_provider.dart';
import 'package:elearning_app/services/auth_service.dart';
import 'package:elearning_app/widgets/my_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';
import 'package:elearning_app/routers/routers.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:google_sign_in/google_sign_in.dart';

class LogIn extends StatefulWidget {
  const LogIn({Key? key}) : super(key: key);

  @override
  State<LogIn> createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
  final TextEditingController _nameC = TextEditingController();
  final TextEditingController _passwordC = TextEditingController();

  final _googleSignIn = GoogleSignIn();

  // Login with name and password
  void _handleLogIn(AuthProvider authProvider) async {}

  // Login with google
  void _handleGoogleLogin(AuthProvider authProvider) async {}

  // Login with facebook
  void _handleFacebookLogin(AuthProvider authProvider) async {}

  // Login with phone
  void _handlePhoneLogin(AuthProvider authProvider) async {}

  @override
  Widget build(BuildContext context) {
    AuthProvider authProvider = AuthProvider();
    return Scaffold(
      appBar: MyAppBar(),
      body: Container(
        padding: const EdgeInsets.fromLTRB(24, 0, 24, 0),
        child: ListView(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: Image.asset("assets/img/login.png"),
            ),
            Container(
                padding: const EdgeInsets.fromLTRB(8, 16, 8, 16),
                alignment: Alignment.center,
                child: Column(
                  children: [
                    Padding(
                        padding: const EdgeInsets.all(8),
                        child: Text(AppLocalizations.of(context)!.sign_in,
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
                      controller: _nameC,
                      style: const TextStyle(fontSize: 14),
                      decoration: const InputDecoration(
                        prefixIcon: Icon(Icons.account_circle),
                        labelText: 'Email',
                        hintText: 'mail@example.com',
                        labelStyle: TextStyle(fontSize: 14, color: Colors.grey),
                        hintStyle: TextStyle(fontSize: 14, color: Colors.grey),
                        // filled: true,
                      ),
                    ),
                    TextField(
                      controller: _passwordC,
                      obscureText: true,
                      decoration: const InputDecoration(
                        prefixIcon: Icon(Icons.key),
                        labelText: 'Password',
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
                              Navigator.pushNamed(
                                  context, AppRouter.forgotPassword);
                            },
                            child: Text(
                              AppLocalizations.of(context)!.forgot_password,
                              style: const TextStyle(
                                  fontWeight: FontWeight.normal),
                            ))),
                    Container(
                      margin: const EdgeInsets.only(top: 20),
                      width: double.infinity,
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor:
                                const Color.fromARGB(255, 29, 137, 225),
                          ),
                          onPressed: () {
                            // Navigator.pushNamed(
                            //     context, AppRouter.findingTutor);
                            _handleLogIn(authProvider);
                          },
                          child: Text(
                            AppLocalizations.of(context)!.sign_up.toUpperCase(),
                            style: const TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 16),
                          )),
                    ),
                    Container(
                        margin: const EdgeInsets.fromLTRB(0, 12, 0, 12),
                        child: Text(
                          AppLocalizations.of(context)!.or,
                        )),
                    Container(
                        margin: const EdgeInsets.symmetric(
                            vertical: 8, horizontal: 40),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            GFIconButton(
                              onPressed: () {
                                _handleFacebookLogin(authProvider);
                              },
                              icon: const Icon(Icons.facebook_sharp),
                              type: GFButtonType.transparent,
                              // shape: GFIconButtonShape.circle,
                            ),
                            GFIconButton(
                              onPressed: () {
                                _handleGoogleLogin(authProvider);
                              },
                              icon: const Icon(Icons.mail),
                              type: GFButtonType.transparent,
                            ),
                            GFIconButton(
                              onPressed: () {
                                _handlePhoneLogin(authProvider);
                              },
                              icon: const Icon(Icons.phone_android),
                              type: GFButtonType.transparent,
                            ),
                          ],
                        )),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(AppLocalizations.of(context)!.not_have_account),
                        TextButton(
                            onPressed: () {
                              Navigator.pushNamed(context, AppRouter.signUp);
                            },
                            child: Text(AppLocalizations.of(context)!.sign_up))
                      ],
                    )
                  ],
                ))
          ],
        ),
      ),
    );
  }
}

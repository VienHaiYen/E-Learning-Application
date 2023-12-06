// ignore: file_names
import 'package:elearning_app/routers/routers.dart';
import 'package:elearning_app/widgets/my_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SignUp extends StatelessWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: MyAppBar(), body: SignUpBody());
  }
}

// ignore: must_be_immutable
class SignUpBody extends StatelessWidget {
  SignUpBody({super.key});

  TextEditingController nameC = TextEditingController();
  TextEditingController passwordC = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(24, 0, 24, 0),
      child: ListView(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32),
            child: Image.asset("assets/img/login.png"),
          ),
          Container(
              padding: const EdgeInsets.fromLTRB(8, 16, 8, 16),
              alignment: Alignment.center,
              child: Column(
                children: [
                  Padding(
                      padding: const EdgeInsets.all(8),
                      child: Text(AppLocalizations.of(context)!.sign_up,
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
                      labelText: 'Email',
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
                      labelText: 'Password',
                      hintText: 'mail@example.com',
                      labelStyle: TextStyle(fontSize: 14, color: Colors.grey),
                      hintStyle: TextStyle(fontSize: 14, color: Colors.grey),
                      // filled: true,
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 20),
                    width: double.infinity,
                    child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor:
                              const Color.fromARGB(255, 29, 137, 225),
                        ),
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
                      Text(AppLocalizations.of(context)!.have_an_account),
                      TextButton(
                          onPressed: () {
                            Navigator.pushNamed(context, AppRouter.logIn);
                          },
                          child: Text(AppLocalizations.of(context)!.sign_in))
                    ],
                  )
                ],
              ))
        ],
      ),
    );
  }
}

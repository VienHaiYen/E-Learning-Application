import 'package:flutter/material.dart';
import 'package:elearning_app/src/constants/routes.dart';

import 'package:elearning_app/src/providers/app_provider.dart';
import 'package:elearning_app/src/providers/auth_provider.dart';
import 'package:elearning_app/src/services/auth_service.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  String chosenLanguage = 'en';

  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _isAuthenticating = true;
  bool _isAuthenticated = false;

  String _emailErrorText = '';
  String _passwordErrorText = '';
  bool _isValidToLogin = false;

  void _handleValidation() {
    final emailRegExp = RegExp(
        r'^[a-zA-Z0-9.!#$%&’*+/=?^_`{|}~-]+@[a-zA-Z0-9-]+(?:\.[a-zA-Z0-9-]+)*$');
    if (_emailController.text.isEmpty) {
      _emailErrorText = AppLocalizations.of(context)!.email_empty;
      _isValidToLogin = false;
    } else if (!emailRegExp.hasMatch(_emailController.text)) {
      _emailErrorText = AppLocalizations.of(context)!.email_wrong_format;
      _isValidToLogin = false;
    } else {
      _emailErrorText = '';
      _isValidToLogin = true;
    }

    if (_passwordController.text.isEmpty) {
      _passwordErrorText = AppLocalizations.of(context)!.password_empty;
      _isValidToLogin = false;
    } else if (_passwordController.text.length < 6) {
      _passwordErrorText = AppLocalizations.of(context)!.password_too_short;
      _isValidToLogin = false;
    } else {
      _passwordErrorText = '';
      _isValidToLogin = true;
    }
    setState(() {});
  }

  void _handleLogin(AuthProvider authProvider) async {
    try {
      await AuthService.loginWithEmailAndPassword(
        // email: _emailController.text,
        // password: _passwordController.text,
        email: "student@lettutor.com",
        password: "123456",
        onSuccess: (user, token) async {
          authProvider.logIn(user, token);

          final prefs = await SharedPreferences.getInstance();
          await prefs.setString(
            'refresh_token',
            authProvider.token!.refresh!.token!,
          );

          setState(() {
            _isAuthenticating = false;
            _isAuthenticated = true;
          });

          Future.delayed(const Duration(seconds: 1), () {
            Navigator.pushNamedAndRemoveUntil(
              context,
              Routes.main,
              (route) => false,
            );
          });
        },
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error Login: ${e.toString()}')),
      );
    }
  }

  void _handlePreviousSession(AuthProvider authProvider) async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      final refreshToken = prefs.getString('refresh_token') ?? '';

      await AuthService.continueSession(
        refreshToken: refreshToken,
        onSuccess: (user, token) async {
          authProvider.logIn(user, token);

          final prefs = await SharedPreferences.getInstance();
          await prefs.setString(
            'refresh_token',
            authProvider.token!.refresh!.token!,
          );

          setState(() {
            _isAuthenticating = false;
            _isAuthenticated = true;
          });

          Future.delayed(const Duration(seconds: 1), () {
            Navigator.pushNamedAndRemoveUntil(
              context,
              Routes.main,
              (route) => false,
            );
          });
        },
      );
    } catch (e) {
      setState(() {
        _isAuthenticating = false;
      });
    }
  }

  void _loadLanguage(AppProvider appProvider) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final lang = prefs.getString('language') ?? 'EN';
    if (lang == 'en') {
      chosenLanguage = 'en';
      appProvider.setLanguage('en');
    } else {
      chosenLanguage = 'vi';
      appProvider.setLanguage('vi');
    }
  }

  void _updateLanguage(AppProvider appProvider, String value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (value == 'en') {
      appProvider.language = 'en';
      await prefs.setString('language', 'en');
    } else {
      appProvider.language = 'vi';
      await prefs.setString('language', 'vi');
    }
  }

  @override
  Widget build(BuildContext context) {
    final authProvider = context.watch<AuthProvider>();
    final appProvider = context.watch<AppProvider>();

    _loadLanguage(appProvider);
    if (_isAuthenticating) {
      _handlePreviousSession(authProvider);
    }

    return Scaffold(
      body: _isAuthenticating
          ? const Center(child: CircularProgressIndicator(color: Colors.blue))
          : _isAuthenticated
              ? const SizedBox.shrink()
              : SingleChildScrollView(
                  padding: EdgeInsets.fromLTRB(
                      16, MediaQuery.of(context).padding.top, 16, 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Align(
                        alignment: Alignment.centerRight,
                        child: DropdownButton<String>(
                          padding: const EdgeInsets.only(left: 8),
                          icon: const Icon(Icons.language),
                          value: chosenLanguage,
                          items: const [
                            DropdownMenuItem<String>(
                              value: 'en',
                              child: Text('English'),
                            ),
                            DropdownMenuItem<String>(
                              value: 'vi',
                              child: Text('Tiếng Việt'),
                            ),
                          ],
                          onChanged: (String? language) {
                            if (language != null) {
                              _updateLanguage(appProvider, language);
                            }
                            setState(() {
                              chosenLanguage = language!;
                            });
                          },
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 36),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              'assets/user/login.png',
                              width: 150,
                              height: 150,
                            ),
                            Text(
                              ' LetTutor ',
                              style: Theme.of(context).textTheme.headline1,
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 16),
                      Text(
                        AppLocalizations.of(context)!.email,
                        style:
                            const TextStyle(fontSize: 16, color: Colors.grey),
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
                          hintText: 'mail@gmail.com',
                          errorText:
                              _emailErrorText.isEmpty ? null : _emailErrorText,
                          prefixIcon: Icon(
                            Icons.mail,
                            color: _emailErrorText.isEmpty
                                ? Colors.blue
                                : Colors.red[700],
                          ),
                          border: const OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.grey, width: 2),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10))),
                        ),
                      ),
                      const SizedBox(height: 24),
                      Text(
                        "Password",
                        style:
                            const TextStyle(fontSize: 16, color: Colors.grey),
                      ),
                      const SizedBox(height: 8),
                      TextField(
                        controller: _passwordController,
                        obscureText: true,
                        autocorrect: false,
                        onChanged: (value) {
                          _handleValidation();
                        },
                        decoration: InputDecoration(
                          hintStyle: TextStyle(color: Colors.grey[400]),
                          hintText: '******',
                          errorText: _passwordErrorText.isEmpty
                              ? null
                              : _passwordErrorText,
                          prefixIcon: Icon(
                            Icons.lock,
                            color: _passwordErrorText.isEmpty
                                ? Colors.blue
                                : Colors.red[700],
                          ),
                          border: const OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.grey, width: 2),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10))),
                        ),
                      ),
                      const SizedBox(height: 8),
                      Container(
                        height: 36,
                        alignment: Alignment.topLeft,
                        child: TextButton(
                          onPressed: () {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text('Not started yet')),
                            );
                          },
                          child: Text(
                            AppLocalizations.of(context)!.forgot_password,
                            style: const TextStyle(fontSize: 16),
                          ),
                        ),
                      ),
                      const SizedBox(height: 16),
                      TextButton(
                        onPressed: () {
                          _handleLogin(authProvider);
                        },
                        style: TextButton.styleFrom(
                          minimumSize: const Size.fromHeight(56),
                          backgroundColor:
                              _isValidToLogin ? Colors.blue : Colors.grey[400],
                        ),
                        child: Text(
                          AppLocalizations.of(context)!.sign_in,
                          style: const TextStyle(
                              fontSize: 20, color: Colors.white),
                        ),
                      ),
                      const SizedBox(height: 16),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            AppLocalizations.of(context)!.not_have_account,
                            style: const TextStyle(fontSize: 16),
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.pushNamed(context, Routes.register);
                            },
                            child: Text(
                              AppLocalizations.of(context)!.sign_up,
                              style: const TextStyle(fontSize: 16),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
    );
  }
}

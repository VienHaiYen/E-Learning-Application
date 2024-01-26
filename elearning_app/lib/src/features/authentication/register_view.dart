import 'package:flutter/material.dart';
import 'package:elearning_app/src/providers/app_provider.dart';
import 'package:elearning_app/src/services/auth_service.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({Key? key}) : super(key: key);

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  String chosenLanguage = 'en';

  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  String _emailErrorText = '';
  String _passwordErrorText = '';
  String _confirmErrorText = '';
  bool _isValidToRegister = false;

  void _handleValidation() {
    final emailRegExp = RegExp(
        r'^[a-zA-Z0-9.!#$%&’*+/=?^_`{|}~-]+@[a-zA-Z0-9-]+(?:\.[a-zA-Z0-9-]+)*$');
    if (_emailController.text.isEmpty) {
      _emailErrorText = AppLocalizations.of(context)!.email_empty;
      _isValidToRegister = false;
    } else if (!emailRegExp.hasMatch(_emailController.text)) {
      _emailErrorText = AppLocalizations.of(context)!.email_wrong_format;
      _isValidToRegister = false;
    } else {
      _emailErrorText = '';
      _isValidToRegister = true;
    }

    if (_passwordController.text.isEmpty) {
      _passwordErrorText = AppLocalizations.of(context)!.password_empty;
      _isValidToRegister = false;
    } else if (_passwordController.text.length < 6) {
      _passwordErrorText = AppLocalizations.of(context)!.password_too_short;
      _isValidToRegister = false;
    } else {
      _passwordErrorText = '';
      _isValidToRegister = true;
    }

    if (_confirmPasswordController.text.isEmpty) {
      _confirmErrorText = AppLocalizations.of(context)!.password_empty;
      _isValidToRegister = false;
    } else if (_confirmPasswordController.text.length < 6) {
      _confirmErrorText = AppLocalizations.of(context)!.password_too_short;
      _isValidToRegister = false;
    } else if (_confirmPasswordController.text != _passwordController.text) {
      _confirmErrorText = AppLocalizations.of(context)!.confirm_password_error;
      _isValidToRegister = false;
    } else {
      _confirmErrorText = '';
      _isValidToRegister = true;
    }
    setState(() {});
  }

  void _handleRegister() async {
    try {
      await AuthService.registerWithEmailAndPassword(
        email: _emailController.text,
        password: _passwordController.text,
      );

      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
              content: Text(AppLocalizations.of(context)!.sign_in_success)),
        );
        Navigator.pop(context);
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error Register: ${e.toString()}')),
      );
    }
  }

  void _loadLanguage(AppProvider appProvider) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final lang = prefs.getString('language') ?? 'en';
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
    final appProvider = context.watch<AppProvider>();
    _loadLanguage(appProvider);

    return Scaffold(
      body: SingleChildScrollView(
        padding:
            EdgeInsets.fromLTRB(16, MediaQuery.of(context).padding.top, 16, 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Align(
              alignment: Alignment.centerRight,
              child: DropdownButton<String>(
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
            const SizedBox(height: 12),
            Text(
              AppLocalizations.of(context)!.email,
              style: const TextStyle(fontSize: 16, color: Colors.grey),
            ),
            const SizedBox(height: 4),
            TextField(
              controller: _emailController,
              keyboardType: TextInputType.emailAddress,
              autocorrect: false,
              onChanged: (value) {
                _handleValidation();
              },
              decoration: InputDecoration(
                hintStyle: TextStyle(color: Colors.grey[400]),
                hintText: "mail@gmail.com",
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
            const SizedBox(height: 12),
            Text(
              "Password",
              style: const TextStyle(fontSize: 16, color: Colors.grey),
            ),
            const SizedBox(height: 4),
            TextField(
              controller: _passwordController,
              obscureText: true,
              autocorrect: false,
              onChanged: (value) {
                _handleValidation();
              },
              decoration: InputDecoration(
                hintStyle: TextStyle(color: Colors.grey[400]),
                hintText: "******",
                prefixIcon: Icon(
                  Icons.lock,
                  color: _passwordErrorText.isEmpty
                      ? Colors.blue
                      : Colors.red[700],
                ),
                errorText:
                    _passwordErrorText.isEmpty ? null : _passwordErrorText,
                border: const OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey, width: 2),
                    borderRadius: BorderRadius.all(Radius.circular(10))),
              ),
            ),
            const SizedBox(height: 12),
            Text(
              AppLocalizations.of(context)!.confirm_password,
              style: const TextStyle(fontSize: 16, color: Colors.grey),
            ),
            const SizedBox(height: 4),
            TextField(
              controller: _confirmPasswordController,
              obscureText: true,
              autocorrect: false,
              onChanged: (value) {
                _handleValidation();
              },
              decoration: InputDecoration(
                hintStyle: TextStyle(color: Colors.grey[400]),
                hintText: "******",
                prefixIcon: Icon(
                  Icons.lock,
                  color:
                      _confirmErrorText.isEmpty ? Colors.blue : Colors.red[700],
                ),
                errorText: _confirmErrorText.isEmpty ? null : _confirmErrorText,
                border: const OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey, width: 2),
                    borderRadius: BorderRadius.all(Radius.circular(10))),
              ),
            ),
            const SizedBox(height: 24),
            TextButton(
              onPressed: _isValidToRegister
                  ? () {
                      _handleRegister();
                    }
                  : null,
              style: TextButton.styleFrom(
                minimumSize: const Size.fromHeight(56),
                backgroundColor:
                    _isValidToRegister ? Colors.blue : Colors.grey[400],
              ),
              child: Text(
                AppLocalizations.of(context)!.sign_up,
                style: const TextStyle(fontSize: 20, color: Colors.white),
              ),
            ),
            const SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  AppLocalizations.of(context)!.have_an_account,
                  style: const TextStyle(fontSize: 16),
                ),
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
            )
          ],
        ),
      ),
    );
  }
}

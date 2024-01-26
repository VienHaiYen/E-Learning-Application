import 'package:elearning_app/src/providers/app_provider.dart';
import 'package:flutter/material.dart';
import 'package:elearning_app/src/constants/routes.dart';
import 'package:elearning_app/src/providers/auth_provider.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  String chosenLanguage = 'en';
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

    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Align(
            alignment: Alignment.center,
            child: Container(
              width: 120,
              height: 120,
              clipBehavior: Clip.hardEdge,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
              ),
              child: Image.network(
                authProvider.currentUser.avatar ?? '',
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) =>
                    const Icon(Icons.person_rounded),
              ),
            ),
          ),
          const SizedBox(height: 12),
          Align(
              alignment: Alignment.center,
              child: Text(
                authProvider.currentUser.name ?? '',
                style: Theme.of(context).textTheme.headline3,
              )),
          //const SizedBox(height: 12),
          TextButton(
            onPressed: () {
              Navigator.pushNamed(context, Routes.userProfile);
            },
            child: const Text('Edit Profile'),
          ),
          // Functions Starts Here
          const SizedBox(height: 4),
          GestureDetector(
            onTap: () => Navigator.pushNamed(context, Routes.userProfile),
            child: Card(
              surfaceTintColor: Colors.white,
              elevation: 2,
              child: Padding(
                padding: EdgeInsets.all(12),
                child: Row(
                  children: [
                    Icon(Icons.manage_accounts, size: 30),
                    SizedBox(width: 12),
                    Text(
                      AppLocalizations.of(context)!.my_account,
                      style: TextStyle(fontSize: 16),
                    )
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(height: 4),
          Card(
            surfaceTintColor: Colors.white,
            elevation: 2,
            child: Padding(
              padding: EdgeInsets.all(12),
              child: Row(
                children: [
                  Icon(Icons.language, size: 30),
                  SizedBox(width: 12),
                  Text(
                    AppLocalizations.of(context)!.language,
                    style: TextStyle(fontSize: 16),
                  ),
                  DropdownButton<String>(
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
                ],
              ),
            ),
          ),
          const SizedBox(height: 4),
          GestureDetector(
            onTap: () => {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('Not started yet')),
              )
            },
            child: Card(
              surfaceTintColor: Colors.white,
              elevation: 2,
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: Row(
                  children: [
                    Icon(Icons.assignment, size: 30),
                    SizedBox(width: 12),
                    Text(
                      AppLocalizations.of(context)!.tutor_register,
                      style: TextStyle(fontSize: 16),
                    )
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(height: 24),

          const SizedBox(height: 48),
          TextButton(
            onPressed: () async {
              final result = await _showLogOutConfirmDialog(context);
              if (result) {
                final prefs = await SharedPreferences.getInstance();
                prefs.remove('refresh_token');
                authProvider.token = null;

                if (mounted) {
                  Navigator.pushNamedAndRemoveUntil(
                    context,
                    Routes.login,
                    (route) => false,
                  );
                }
              }
            },
            style: TextButton.styleFrom(
              minimumSize: const Size.fromHeight(44),
              backgroundColor: const Color.fromRGBO(255, 0, 0, 0.2),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.logout, color: Colors.red),
                SizedBox(width: 8),
                Text(
                  AppLocalizations.of(context)!.log_out,
                  style: TextStyle(fontSize: 18, color: Colors.red),
                ),
              ],
            ),
          ),
          const SizedBox(height: 48),
        ],
      ),
    );
  }
}

Future<bool> _showLogOutConfirmDialog(BuildContext context) async {
  return showDialog<bool>(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: Text(AppLocalizations.of(context)!.log_out),
        content: const Text('Are you sure you want to log out?'),
        actions: [
          TextButton(
              onPressed: () {
                Navigator.pop(context, false);
              },
              child: const Text('NO')),
          TextButton(
              onPressed: () {
                Navigator.pop(context, true);
              },
              child: const Text('YES')),
        ],
      );
    },
  ).then((value) => value ?? false);
}

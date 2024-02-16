import 'dart:io';
import 'package:elearning_app/l10n/l10n.dart';
import 'package:elearning_app/src/app_routes/app_routes.dart';
import 'package:elearning_app/src/app_style/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

import 'package:elearning_app/src/providers/app_provider.dart';
import 'package:elearning_app/src/providers/auth_provider.dart';

import 'package:elearning_app/src/features/authentication/login_view.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}

void main() {
  HttpOverrides.global = MyHttpOverrides();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    // _loadLanguage();

    return MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (_) => AppProvider(),
          ),
          ChangeNotifierProvider(
            create: (_) => AuthProvider(),
          ),
        ],
        child: Builder(builder: (context) {
          var appProvider = Provider.of<AppProvider>(context);
          return MaterialApp(
              supportedLocales: L10n.all,
              debugShowCheckedModeBanner: false,
              locale: Locale(appProvider.language),
              localizationsDelegates: const [
                AppLocalizations.delegate,
                GlobalMaterialLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
                GlobalCupertinoLocalizations.delegate,
              ],
              title: 'Lettutor',
              theme: ThemeData(
                  useMaterial3: true,
                  primaryColor: Colors.blue,
                  scaffoldBackgroundColor: Colors.white,
                  textTheme: AppThemes.textTheme),
              home: const LoginView(),
              routes: AppRoutes);
        }));
  }
}

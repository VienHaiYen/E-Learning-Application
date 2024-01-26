import 'dart:io';
import 'package:elearning_app/src/app_routes/app_routes.dart';
import 'package:elearning_app/src/app_style/app_theme.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'package:elearning_app/src/providers/app_provider.dart';
import 'package:elearning_app/src/providers/auth_provider.dart';

import 'package:elearning_app/src/features/authentication/login_view.dart';

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

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => AppProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => AuthProvider(),
        ),
      ],
      child: MaterialApp(
          title: 'Lettutor',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
              useMaterial3: true,
              primaryColor: Colors.blue,
              scaffoldBackgroundColor: Colors.white,
              textTheme: AppThemes.textTheme),
          home: const LoginView(),
          routes: AppRoutes),
    );
  }
}

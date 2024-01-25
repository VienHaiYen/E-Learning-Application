import 'package:flutter/material.dart';

class AppThemes {
  static TextTheme textTheme = TextTheme(
      headline1: TextStyle(
          fontSize: 40,
          fontWeight: FontWeight.bold,
          color: Colors.blue[600],
          letterSpacing: 1.1),
      headline2: TextStyle(
        fontSize: 26,
        fontWeight: FontWeight.w700,
        //letterSpacing: 1.0,
        color: Colors.blue[600],
      ),
      headline3: const TextStyle(
        fontSize: 22,
        fontWeight: FontWeight.bold,
        color: Colors.black,
      ),
      headline4: const TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w500,
        color: Colors.black,
      ),
      bodyText1: const TextStyle(fontSize: 16.0, fontWeight: FontWeight.w400),
      bodyText2: TextStyle(fontSize: 15.0, color: Colors.grey[700]));
}

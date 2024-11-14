import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData lightTheme = ThemeData(
    // primarySwatch: Colors.blue,
    brightness: Brightness.light,
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.white,
      iconTheme: IconThemeData(color: Colors.black),
      elevation: 0,
    ),
    scaffoldBackgroundColor: Colors.white,
    primaryColor: Colors.black,
    fontFamily: 'Roboto',
    useMaterial3: true,
  );

  // static ThemeData darkTheme = ThemeData(
  //   primarySwatch: Colors.blue,
  //   brightness: Brightness.dark,
  //   textTheme: const TextTheme(
  //     headlineLarge: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
  //     bodyMedium: TextStyle(fontSize: 16),
  //   ),
  //   appBarTheme: const AppBarTheme(
  //     backgroundColor: Colors.black,
  //     elevation: 0,
  //   ),
  // );
}

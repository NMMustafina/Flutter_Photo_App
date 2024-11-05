import 'package:flutter/material.dart';

class MainSnackBar {
  static const errorColor = Color(0xFFB3261E);
  static const successColor = Colors.green;

  static Future<void> showSnackBar(
      BuildContext context, String message, bool error) async {
    ScaffoldMessenger.of(context).removeCurrentSnackBar();

    final snackBar = SnackBar(
      duration: const Duration(seconds: 5),
      content: Text(message),
      backgroundColor: error ? errorColor : successColor,
    );

    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}

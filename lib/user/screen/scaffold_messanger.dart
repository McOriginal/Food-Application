import 'package:flutter/material.dart';

class SnackBarMessanger {
  static void showSnackBar(GlobalKey<ScaffoldMessengerState> scaffoldKey,
      String message, Color bgColor) {
    scaffoldKey.currentState!.hideCurrentSnackBar();
    scaffoldKey.currentState!.showSnackBar(
      SnackBar(
        duration: const Duration(seconds: 5),
        content: Text(
          message,
          textAlign: TextAlign.center,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 15,
          ),
        ),
        backgroundColor: bgColor,
      ),
    );
  }
}

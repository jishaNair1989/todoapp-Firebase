import 'package:flutter/material.dart';

import '../styles/app_style.dart';

class SnackBarPopUp {
  static popUp(String messege, BuildContext context,
      {Color bgColor = AppStyle.redColor}) {
    ScaffoldMessenger.of(context).hideCurrentSnackBar();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(10.0),
          ),
        ),
        duration: const Duration(milliseconds: 2000),
        behavior: SnackBarBehavior.floating,
        backgroundColor: bgColor,
        margin: const EdgeInsets.all(16.0),
        padding: const EdgeInsets.symmetric(vertical: 6.0),
        content: Text(
          messege,
          style: const TextStyle(
            letterSpacing: 1.0,
            fontWeight: FontWeight.w500,
            fontSize: 16.0,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}

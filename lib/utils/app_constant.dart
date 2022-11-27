import 'package:flutter/material.dart';

class AppConstant {
  static const String errorString = "\"success\":false";

  static snackBar(String msg, BuildContext context) {
    return ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(msg),
    ));
  }
}

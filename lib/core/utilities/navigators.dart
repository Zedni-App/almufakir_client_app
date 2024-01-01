import 'package:flutter/material.dart';

import '../../main.dart';

showMessage(String message) {
  ScaffoldMessenger.of(navKey.currentContext!).showSnackBar(
    SnackBar(
      content: Text(
        message,
        textAlign: TextAlign.center,
      ),
      duration: const Duration(seconds: 3),
      behavior: SnackBarBehavior.floating,
    ),
  );
}

Future pagePush(Widget newPage) async => await Navigator.push(
    navKey.currentContext!, MaterialPageRoute(builder: (context) => newPage));

dynamic pagePop([var x]) {
  return Navigator.pop(navKey.currentContext!, x);
}

Future pageReplacement(Widget newPage) async => await Navigator.pushReplacement(
    navKey.currentContext!, MaterialPageRoute(builder: (_) => newPage));

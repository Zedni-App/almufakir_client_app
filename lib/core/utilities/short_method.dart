import 'package:flutter/material.dart';
import '../../main.dart';

showMessage( String message) {
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

String phoneFormatter(String num) {
  if (num[0] == '+') {
    return num;
  }
  return "+963${num.substring(1)}";
}

Future pagePush(Widget newPage) async => await Navigator.push(
    navKey.currentContext!, MaterialPageRoute(builder: (context) => newPage));

Future pageReplacement(Widget newPage)async =>await Navigator.pushReplacement(
    navKey.currentContext!, MaterialPageRoute(builder: (_) => newPage));

String formTime([DateTime? time]) {
  time ??= DateTime.now();
  return "${time.hour}:${time.minute}";
}

String timeTo12Sys(String time) {
  try {
    int h = int.parse(time.split(":").first);
    if (h > 12) {
      return "${h - 12}:${time.split(":").last}م";
    }

    return "$timeص";
  } catch (_) {
    return time;
  }
}

String formDate([DateTime? date]) {
  date ??= DateTime.now();
  return "${date.month}/${date.day}";
}

void showProcessingDialog(BuildContext context,
    {String? text, bool isDark = false}) {
  showDialog(
      context: context,
      builder: (ctx) => Dialog(
            backgroundColor: Colors.transparent,
            elevation: 0,
            child: Center(
              child: Container(
                height: 111,
                width: 111,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: isDark ? Colors.black : Colors.white,
                  shape: BoxShape.rectangle,
                  borderRadius: const BorderRadius.all(Radius.circular(10)),
                ),
                child: text == null
                    ? const CircularProgressIndicator()
                    : Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const CircularProgressIndicator(),
                          Text(text)
                        ],
                      ),
              ),
            ),
          ));
}

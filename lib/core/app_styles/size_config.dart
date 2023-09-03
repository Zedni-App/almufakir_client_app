import 'package:flutter/material.dart';
import '../../main.dart';

double percentHeight(double percent) {
  return MediaQuery.sizeOf(navKey.currentContext!).height * percent;
}

double percentWidth(double percent) {
  return MediaQuery.sizeOf(navKey.currentContext!).width * percent;
}

EdgeInsets percentPadding(double x, double y) => EdgeInsets.symmetric(
      horizontal: MediaQuery.sizeOf(navKey.currentContext!).width * x,
      vertical: MediaQuery.sizeOf(navKey.currentContext!).height * y,
    );

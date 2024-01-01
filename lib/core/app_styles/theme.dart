import 'package:flutter/material.dart';


class AppColors {
  AppColors._();
  static const kPrimaryColor = Color.fromARGB(255, 135, 37, 132);
  static const kComplementColor1 = Color.fromARGB(255, 21, 48, 72);
  static const lprimarycolor2 = Color.fromARGB(255, 106, 84, 103);
  static const lPrimaryColor = Color(0xFF3B3353);
  static const lSecondaryColor = Color(0xFF2E7E13);
  static const lBorderColor = Color.fromRGBO(243, 243, 245, 1);
  static const lBLueDark = Color.fromARGB(255, 134, 104, 191);
  static const lprimarycolor4 = Color.fromARGB(255, 157, 171, 180);
  static const lprimarycolor5 = Color.fromARGB(255, 217, 224, 230);
  static const lprimarycolor6 = Color.fromARGB(255, 240, 239, 239);
  static const Color kComplementColor2 = Color.fromARGB(255, 173, 202, 25);
  static const Color lInfoRowColor = Color.fromARGB(255, 246, 240, 246);
  static const Color dInfoRowColor = Color.fromARGB(255, 47, 26, 47);
  static const Color dBackgroundColor = Color.fromARGB(255, 20, 19, 23);
  static const Color lprimarycolor3 = Color.fromARGB(255, 162, 88, 143);
}

OutlineInputBorder buildOutlineInputBorder() {
  return OutlineInputBorder(
    borderRadius: BorderRadius.circular(10),
    borderSide: const BorderSide(
      width: 2,
    ),
  );
}

TextStyle smallTitleTextStyle() => const TextStyle(
    fontSize: 22, color: AppColors.lprimarycolor2, fontWeight: FontWeight.bold);


TextStyle appbarTitleStyle() =>
    const TextStyle(fontSize: 22, fontWeight: FontWeight.w600);
ThemeData getTheme(bool isDark) {
  return ThemeData(
    brightness: isDark ? Brightness.dark : Brightness.light,
    scaffoldBackgroundColor: isDark ? AppColors.dBackgroundColor : Colors.white,
    colorScheme: ColorScheme.fromSeed(
        seedColor: AppColors.kPrimaryColor,
        brightness: isDark ? Brightness.dark : Brightness.light),
    useMaterial3: true,
    buttonTheme: ButtonThemeData(
      colorScheme: ColorScheme.fromSeed(
        seedColor: AppColors.kPrimaryColor,
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color>(AppColors.kPrimaryColor),
      ),
    ),
  );
}

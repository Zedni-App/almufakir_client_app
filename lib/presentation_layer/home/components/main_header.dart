import 'package:flutter/material.dart';

import '../../../core/app_styles/size_config.dart';
import '../../../core/app_styles/theme.dart';

class MainHeader extends StatelessWidget {
  const MainHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: percentHeight(0.2),
      color: AppColors.lprimarycolor5.withOpacity(0.7),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Padding(
            padding: EdgeInsets.all(percentWidth(0.025)),
            child: Image.asset(
              "assets/images/logo.png",
              width: percentWidth(0.3),
              height: percentHeight(0.3),
            ),
          ),
          const Text(
            "مرحباً بك\nفي تطبيق المفكر",
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: AppColors.kPrimaryColor,
            ),
          ),
        ],
      ),
    );
  }
}

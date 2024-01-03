import 'package:flutter/material.dart';

import '../../../../core/app_styles/size_config.dart';
import '../../../core/app_styles/app_theme.dart';

class MainScreenViews extends StatelessWidget {
  const MainScreenViews(this.title, this.image, {super.key});

  final String title;
  final String image;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          Expanded(
              flex: 4,
              child: AspectRatio(aspectRatio: 1, child: Image.asset(image))),
          const Spacer(),
          FittedBox(
            child: Container(
              decoration: BoxDecoration(
                color: AppColors.kComplementColor2.withOpacity(0.3),
                borderRadius: BorderRadius.circular(3),
              ),
              padding: EdgeInsets.symmetric(
                vertical: percentHeight(0.01),
                horizontal: percentWidth(0.03),
              ),
              child: Text(
                title,
                textAlign: TextAlign.center,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  color: AppColors.kPrimaryColor,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          const Spacer(),
        ],
      ),
    );
  }
}

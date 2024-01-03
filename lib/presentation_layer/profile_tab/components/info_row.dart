import 'package:flutter/material.dart';

import '../../../core/app_styles/app_theme.dart';

class InfoRow extends StatelessWidget {
  const InfoRow({
    super.key,
    required this.value,
    required this.title,
  });

  final String title;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Container(
          margin: const EdgeInsets.all(6),
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(15)),
            color: AppTheme.isDark()
                ? AppColors.dInfoRowColor
                : AppColors.lInfoRowColor,
          ),
          child: Row(
            children: [
              Text(
                title,
                style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: AppColors.kPrimaryColor,),
              ),
              const SizedBox(width: 5),
              Flexible(
                child: Text(
                  value,
                  maxLines: 1,
                  style: const TextStyle(fontSize: 18),
                ),
              ),
            ],
          ),
        );
      
  }
}

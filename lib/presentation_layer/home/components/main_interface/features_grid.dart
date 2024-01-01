import 'package:flutter/material.dart';

import '../../../../core/assets.dart';
import 'main_screen_views.dart';

class FeaturesGrid extends StatelessWidget {
  const FeaturesGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView(
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 300,
        childAspectRatio: 0.8,
        mainAxisSpacing: 5,
        crossAxisSpacing: 5,
      ),
      shrinkWrap: true,
      children: const [
        MainScreenViews("متابعة الطالب", AppAssets.steper),
        MainScreenViews("تواصل مع الأهل", AppAssets.connect),
        MainScreenViews("جوائز تحفيزية", AppAssets.gift),
        MainScreenViews("أذكار و أدعية", AppAssets.azkar),
        MainScreenViews("جدول دراسي", AppAssets.timeline),
        MainScreenViews("تذكيرات", AppAssets.reminder),
      ],
    );
  }
}

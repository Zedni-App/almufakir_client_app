import 'package:flutter/material.dart';

import '../../../../core/assets.dart';
import 'main_screen_views.dart';

class DiscountGrid extends StatelessWidget {
  const DiscountGrid({super.key});
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
        MainScreenViews("المتفوقين", AppAssets.rate),
        MainScreenViews("حفظة القرآن الكريم", AppAssets.quran),
        MainScreenViews("ذوي الهمم", AppAssets.disa),
        MainScreenViews("الإخوة", AppAssets.bro),
      ],
    );
  }
}

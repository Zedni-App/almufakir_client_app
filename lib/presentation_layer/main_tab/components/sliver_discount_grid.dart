import 'package:flutter/material.dart';

import '../../../../core/assets.dart';
import 'main_screen_views.dart';

class SliverDiscountGrid extends StatelessWidget {
  const SliverDiscountGrid({super.key});
  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      sliver: SliverGrid(
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 300,
          childAspectRatio: 0.8,
          mainAxisSpacing: 5,
          crossAxisSpacing: 5,
        ),
        delegate: SliverChildListDelegate(const [
          MainScreenViews("المتفوقين", AppAssets.rate),
          MainScreenViews("حفظة القرآن الكريم", AppAssets.quran),
          MainScreenViews("ذوي الهمم", AppAssets.disa),
          MainScreenViews("الإخوة", AppAssets.bro),
        ]),
      ),
    );
  }
}

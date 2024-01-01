import 'package:flutter/material.dart';

import '../../../../core/assets.dart';
import 'main_screen_views.dart';

class CoursesGrid extends StatelessWidget {
  const CoursesGrid({super.key});

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
        MainScreenViews("بكالوريا علمي", AppAssets.elmi),
        MainScreenViews("component2", AppAssets.adbi),
        MainScreenViews("component3", AppAssets.nine),
        MainScreenViews("component4", AppAssets.ret),
      ],
    );
  }
}

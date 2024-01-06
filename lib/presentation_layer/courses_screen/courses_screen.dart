import 'package:flutter/material.dart';

import '../../core/app_styles/app_theme.dart';
import 'components/screen_body.dart';

class CoursesScreen extends StatelessWidget {
  const CoursesScreen({super.key, required this.sectionName});
  final String sectionName;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            pinned: true,
            floating: true,
            expandedHeight: 150,
            flexibleSpace: FlexibleSpaceBar(
              background: const DecoratedBox(
                decoration: BoxDecoration(color: AppColors.kPrimaryColor),
              ),
              title: Text("كورسات\n$sectionName"),
            ),
          ),
          const ScreenBody(),
        ],
      ),
    );
  }
}

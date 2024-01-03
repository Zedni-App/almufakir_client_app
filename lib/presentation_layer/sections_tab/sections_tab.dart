import 'package:flutter/material.dart';
import '../../core/app_styles/app_theme.dart';
import 'components/sliver_sections_grid.dart';

class SectionsTab extends StatelessWidget {
  const SectionsTab({super.key});

  @override
  Widget build(BuildContext context) {
    return const CustomScrollView(
      slivers: [
        SliverAppBar(
          pinned: true,
          floating: true,
          expandedHeight: 150,
          flexibleSpace: FlexibleSpaceBar(
            background: DecoratedBox(
              decoration: BoxDecoration(color: AppColors.kPrimaryColor),
            ),
            title: Text(
              "الكورسات",
            
            ),
          ),
        ),
        SliverSectionsGrid(),
      ],
    );
  }
}

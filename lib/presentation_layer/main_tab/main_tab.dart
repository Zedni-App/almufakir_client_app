import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../home/cubit/home_cubit.dart';
import '../sections_tab/components/sliver_sections_grid.dart';
import 'components/sliver_features_grid.dart';
import 'components/images_slider.dart';
import 'components/section_title.dart';
import 'components/main_sliver_app_bar.dart';
import 'components/sliver_discount_grid.dart';

class MainTab extends StatefulWidget {
  const MainTab({Key? key}) : super(key: key);

  @override
  State<MainTab> createState() => _MainTabState();
}

class _MainTabState extends State<MainTab> {
  final scrollCtrl = ScrollController();
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      controller: scrollCtrl,
      slivers: [
        MainSliverAppBar(scrollCtrl: scrollCtrl),
        const ImagesSlider(),
        SectionTitle(
          title: "الكورسات",
          fun: () => context.read<HomeCubit>().changeActiveTab(1),
        ),
        const SliverSectionsGrid(maxElement: 4),
        SectionTitle(
          title: "الحسومات",
          fun: () {},
        ),
        const SliverDiscountGrid(),
        SectionTitle(
          title: "الميزات",
          fun: () {},
        ),
        const SliverFeaturesGrid(),
      ],
    );
  }
}

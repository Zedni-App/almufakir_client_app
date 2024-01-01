import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/app_styles/size_config.dart';
import '../../../core/app_styles/theme.dart';
import '../../courses_screen/components/sections_grid.dart';
import '../components/images_slider.dart';
import '../components/main_header.dart';
import '../components/main_interface/discount_grid.dart';
import '../components/main_interface/features_grid.dart';
import '../components/section_title.dart';
import '../controller/home_bloc.dart';

class MainInterface extends StatelessWidget {
  const MainInterface({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
  
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            ..._screenHeader(),
            const ImagesSlider(),
            SectionTitle(
              title: "الكورسات",
              fun: () {
                context.read<HomeBloc>().add(ChangeActiveScreen(newIndex: 1));
              },
            ),
            const CoursesGrid(maxElement: 4),
            SectionTitle(
              title: "الحسومات",
              fun: () {},
            ),
            const DiscountGrid(),
            SectionTitle(
              title: "الميزات",
              fun: () {},
            ),
            const FeaturesGrid(),
          ],
        ),
      ),
    );
  }

  List<Widget> _screenHeader() {
    return [
      Container(
        width: double.infinity,
        height: percentHeight(0.03),
        color: AppColors.kPrimaryColor.withOpacity(0.7),
      ),
      const MainHeader(),
      Container(
        width: double.infinity,
        height: percentHeight(0.04),
        color: AppColors.kPrimaryColor.withOpacity(0.7),
      ),
    ];
  }
}

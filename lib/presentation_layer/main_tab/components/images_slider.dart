import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import '../../../core/app_styles/size_config.dart';

class ImagesSlider extends StatelessWidget {
  const ImagesSlider({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12),
        child: CarouselSlider(
            options: CarouselOptions(
              height: percentHeight(0.4),
              autoPlay: true,
              autoPlayAnimationDuration: const Duration(
                seconds: 1,
              ),
            ),
            items: [
              Image.asset("assets/images/intro1.jpg"),
              Image.asset("assets/images/intro2.jpg"),
              Image.asset("assets/images/intro3.jpg"),
              Image.asset("assets/images/intro4.jpg"),
              Image.asset("assets/images/intro4.jpg"),
            ]),
      ),
    );
  }
}

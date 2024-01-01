import 'package:flutter/material.dart';

import 'package:zidne/core/app_styles/size_config.dart';
import 'package:zidne/core/app_styles/theme.dart';
import 'package:zidne/domain_layer/entities/section_entity.dart';

import '../../components/network_image.dart';

class SectionView extends StatelessWidget {
  const SectionView(this.section, {super.key});

  final SectionEntity section;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          Expanded(
            flex: 4,
            child: AspectRatio(
              aspectRatio: 1,
              child: NetworkImageWidget(
                imageUrl: section.image,
              ),
            ),
          ),
          const Spacer(),
          FittedBox(
            child: Container(
              decoration: BoxDecoration(
                color: AppColors.kComplementColor2.withOpacity(0.3),
                borderRadius: BorderRadius.circular(3),
              ),
              padding: EdgeInsets.symmetric(
                vertical: percentHeight(0.01),
                horizontal: percentWidth(0.03),
              ),
              child: Text(
                section.name,
                textAlign: TextAlign.center,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  color: AppColors.kPrimaryColor,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          const Spacer(),
        ],
      ),
    );
  }
}

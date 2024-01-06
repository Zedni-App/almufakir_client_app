import 'package:flutter/material.dart';

import '../../../core/app_styles/app_theme.dart';
import '../../../core/app_styles/size_config.dart';
import '../../../domain_layer/entities/course_entity.dart';
import '../../shared_components/network_image.dart';


class CourseView extends StatelessWidget {
  const CourseView(this.course, {super.key});

  final CourseEntity course;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        
      },
      child: Card(
        child: Column(
          children: [
            Expanded(
              flex: 4,
              child: AspectRatio(
                aspectRatio: 1,
                child: NetworkImageWidget(
                  imageUrl: course.imageURL,
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
                  course.name,
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
      ),
    );
  }
}

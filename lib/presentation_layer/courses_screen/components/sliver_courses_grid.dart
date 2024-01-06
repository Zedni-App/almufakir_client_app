import 'package:flutter/material.dart';
import 'package:zidne/domain_layer/entities/course_entity.dart';

import 'section_view.dart';

class SliverCoursesGrid extends StatelessWidget {
  const SliverCoursesGrid({
    required this.courses,
    super.key,
  });
  final List<CourseEntity> courses;
  @override
  Widget build(BuildContext context) {
    return SliverPadding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          sliver: SliverGrid.builder(
            gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 300,
              mainAxisSpacing: 5,
              crossAxisSpacing: 5,
            ),
            itemCount: courses.length,
            itemBuilder: (_, index) {
              return CourseView(courses[index]);
            },
          ),
        );
    
  }
}

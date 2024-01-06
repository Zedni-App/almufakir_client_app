import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'courses_screen.dart';

import '../../domain_layer/entities/section_entity.dart';
import 'cubit/courses_cubit.dart';

class Courses extends StatelessWidget {
  const Courses({super.key, required this.section});
  final SectionEntity section;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => CoursesCubit(section),
      child: CoursesScreen(sectionName: section.name),
    );
  }
}

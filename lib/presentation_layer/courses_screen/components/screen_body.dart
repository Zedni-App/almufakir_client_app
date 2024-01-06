import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newtons_cradle_loading_indicator/newtons_cradle_loading_indicator.dart';


import '../../shared_components/custom_error_widget.dart';
import '../cubit/courses_cubit.dart';
import 'sliver_courses_grid.dart';

class ScreenBody extends StatelessWidget {
  const ScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CoursesCubit, CoursesState>(
      buildWhen: (p, c) =>
          c is Loading || c is LoadingDone || c is LoadingFailed,
      builder: (context, state) {
       
        final cubit = context.read<CoursesCubit>();

        if (state is LoadingFailed) {
          return SliverFillRemaining(
            child: CustomErrorWidget(
              primaryMessage: state.error,
              retryFun: () => cubit.getCourses(),
            ),
          );
        }
        if (state is LoadingDone) {
          return SliverCoursesGrid(courses: state.courses,);
        }

        cubit.getCourses();
        return const SliverFillRemaining(child: NewtonLoadingIndicator());
      },
    );
  }
}
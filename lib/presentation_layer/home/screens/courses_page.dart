import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'presentation_layer/home/components/custom_error_widget.dart';
import 'presentation_layer/home/components/newten_progress_indicator/custom_progress_indicator.dart';
import 'presentation_layer/home/components/newten_progress_indicator/section_view.dart';
import 'presentation_layer/home/controller/home_bloc.dart';

class Courses extends StatefulWidget {
  const Courses({Key? key}) : super(key: key);
  static const screenRoute = 'Courses';

  @override
  State<Courses> createState() => _CoursesState();
}

class _CoursesState extends State<Courses> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<HomeBloc, HomeState>(
        buildWhen: (p, c) =>
            c is LoadingCoursesState ||
            c is LoadingCoursesDoneState ||
            c is LoadingCoursesFailedState,
        builder: (context, state) {
          if (state is LoadingCoursesState) {
            return const CustomProgressIndicator(
              widgetHeight: 200,
            );
          }
          if (state is LoadingCoursesFailedState) {
            return CustomErrorWidget(
              primaryMessage: state.errorMessage,
              retryFun: () => context.read<HomeBloc>().add(GetCourses()),
            );
          }
          if (state is LoadingCoursesDoneState && state.data.sections.isEmpty) {
            return CustomErrorWidget(
              primaryMessage: "لم يتم نحميل الدورات أعد المحاولة",
              retryFun: () => context.read<HomeBloc>().add(GetCourses()),
            );
          }
          if (state is LoadingCoursesDoneState) {
            return GridView.builder(
              padding: const EdgeInsets.all(8),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 5,
                crossAxisSpacing: 5,
              ),
              itemCount: state.data.sections.length,
              itemBuilder: (_, index) {
                return SectionView(state.data.sections[index]);
              },
            );
          }
          context.read<HomeBloc>().add(GetCourses());
          return const CustomProgressIndicator(
            widgetHeight: 200,
          );
        },
      ),
    );
  }
}

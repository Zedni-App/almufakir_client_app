import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newtons_cradle_loading_indicator/newtons_cradle_loading_indicator.dart';
import 'package:zidne/presentation_layer/home/components/course_view.dart';
import 'package:zidne/presentation_layer/home/controller/home_bloc.dart';

import 'presentation_layer/home/components/custom_error_widget.dart';

class CourseContent extends StatefulWidget {
  const CourseContent({Key? key}) : super(key: key);

  @override
  State<CourseContent> createState() => _CourseContentState();
}

class _CourseContentState extends State<CourseContent> {
  String elementnamea1 = "رياضيات";
  String elementnamea2 = "فيزياء";
  String elementnamea3 = "كيمياء";
  String elementnamea4 = "علوم";

  String elementnameb1 = "جغرافية";
  String elementnameb2 = "تاريخ";
  String elementnameb3 = "عربي";
  String elementnameb4 = "فلسفة";

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
          return const NewtonLoadingIndicator();
        }
        if (state is LoadingCoursesFailedState) {
          return CustomErrorWidget(
            primaryMessage: state.errorMessage,
            retryFun: () => context.read<HomeBloc>().add(GetCourses()),
          );
        }
        if (state is LoadingCoursesDoneState && state.data.courses.isEmpty) {
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
            itemCount: state.data.courses.length,
            itemBuilder: (_, index) {
              return CourseView(state.data.courses[index]);
            },
          );
        }
        context.read<HomeBloc>().add(GetCourses());
        return const NewtonLoadingIndicator();
      },
    ));
  }
}

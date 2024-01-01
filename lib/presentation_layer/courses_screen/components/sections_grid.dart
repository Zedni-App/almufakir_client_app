import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newtons_cradle_loading_indicator/newtons_cradle_loading_indicator.dart';

import '../../home/components/custom_error_widget.dart';
import '../../home/controller/home_bloc.dart';
import 'section_view.dart';

class CoursesGrid extends StatelessWidget {
  const CoursesGrid({
    this.maxElement,
    super.key,
  });
  final int? maxElement;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
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
        if (state is LoadingCoursesDoneState && state.data.sections.isEmpty) {
          return CustomErrorWidget(
            primaryMessage: "لم يتم نحميل الدورات أعد المحاولة",
            retryFun: () => context.read<HomeBloc>().add(GetCourses()),
          );
        }
        if (state is LoadingCoursesDoneState) {
          return GridView.builder(
            padding: const EdgeInsets.all(8),
            shrinkWrap: maxElement != null,
            gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 300,
              mainAxisSpacing: 5,
              crossAxisSpacing: 5,
            ),
            itemCount: _getCount(state),
            itemBuilder: (_, index) {
              return SectionView(state.data.sections[index]);
            },
          );
        }
        if (kDebugMode) {
          print("you dont know anything from courses page");
        }
        //default not reachable
        context.read<HomeBloc>().add(GetCourses());
        return const NewtonLoadingIndicator();
      },
    );
  }

  int _getCount(LoadingCoursesDoneState state) {
    if (maxElement == null || maxElement! > state.data.sections.length) {
      return state.data.sections.length;
    }

    return maxElement!;
  }
}

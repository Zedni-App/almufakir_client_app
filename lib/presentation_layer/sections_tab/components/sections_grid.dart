// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:newtons_cradle_loading_indicator/newtons_cradle_loading_indicator.dart';

// import '../../shared_components/custom_error_widget.dart';
// import '../cubit/sections_cubit.dart';
// import 'section_view.dart';

// class CoursesGrid extends StatelessWidget {
//   const CoursesGrid({
//     this.maxElement,
//     super.key,
//   });
//   final int? maxElement;
//   @override
//   Widget build(BuildContext context) {
//     return BlocBuilder<SectionsCubit, SectionsState>(
//       buildWhen: (p, c) =>
//           c is Loading || c is LoadingDone || c is LoadingFailed,
//       builder: (context, state) {
//         if (state is Loading) {
//           return const NewtonLoadingIndicator();
//         }
//         if (state is LoadingFailed) {
//           return CustomErrorWidget(
//             primaryMessage: state.errorMessage,
//             retryFun: () => context.read<HomeBloc>().add(GetCourses()),
//           );
//         }
//         if (state is LoadingSectionsDoneState && state.data.isEmpty) {
//           return CustomErrorWidget(
//             primaryMessage: "لم يتم نحميل الدورات أعد المحاولة",
//             retryFun: () => context.read<HomeBloc>().add(GetCourses()),
//           );
//         }
//         if (state is LoadingSectionsDoneState) {
//           return GridView.builder(
//             padding: const EdgeInsets.all(8),
//             shrinkWrap: maxElement != null,
//             gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
//               maxCrossAxisExtent: 300,
//               mainAxisSpacing: 5,
//               crossAxisSpacing: 5,
//             ),
//             itemCount: _getCount(state),
//             itemBuilder: (_, index) {
//               return SectionView(state.data[index]);
//             },
//           );
//         }
//         if (kDebugMode) {
//           print("you dont know anything from courses page");
//         }
//         //default not reachable
//         context.read<HomeBloc>().add(GetCourses());
//         return const NewtonLoadingIndicator();
//       },
//     );
//   }

//   int _getCount(LoadingSectionsDoneState state) {
//     if (maxElement == null || maxElement! > state.data.length) {
//       return state.data.length;
//     }

//     return maxElement!;
//   }
// }

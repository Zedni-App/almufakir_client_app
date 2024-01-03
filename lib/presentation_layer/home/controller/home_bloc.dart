// import 'dart:async';

// import 'package:equatable/equatable.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

// import '../../../core/utilities/service_locator.dart';
// import '../../../domain_layer/entities/course_data_entity.dart';
// import '../../../domain_layer/entities/section_entity.dart';
// import '../../../domain_layer/use_cases/course/get_course_data.dart';
// import '../../../domain_layer/use_cases/courses/get_sections.dart';

// part 'home_event.dart';
// part 'home_state.dart';

// class HomeBloc extends Bloc<HomeEvent, HomeState> {
//   HomeBloc() : super(HomeInitial()) {
//     on<ChangeActiveScreen>(_changeScreen);
//     on<GetCourses>(_getCourses);
//     on<GetCourseData>(_getCourseData);
//   }



//   FutureOr<void> _getCourseData(
//       GetCourseData event, Emitter<HomeState> emit) async {
//     emit(LoadingCourseDataState());
//     final reqResult =
//         await sl<GetCourseDataUseCase>().call(courseID: event.courseID);
//     reqResult.fold((l) {
//       emit(LoadingCourseDataFailedState(errorMessage: l.message));
//     }, (r) {
//       emit(LoadingCourseDataDoneState(data: r));
//     });
//   }

//   void _changeScreen(ChangeActiveScreen event, Emitter<HomeState> emit) =>
//       emit(ActiveScreenChanged(newIndex: event.newIndex));
// }

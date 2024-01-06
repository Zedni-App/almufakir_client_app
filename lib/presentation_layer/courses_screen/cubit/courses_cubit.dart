import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:zidne/domain_layer/entities/section_entity.dart';

import '../../../core/utilities/service_locator.dart';
import '../../../domain_layer/entities/course_entity.dart';
import '../../../domain_layer/use_cases/courses/get_courses.dart';
part 'courses_state.dart';

class CoursesCubit extends Cubit<CoursesState> {
  CoursesCubit(this.section) : super(CoursesInitial());
  final SectionEntity section;
  getCourses() async {
    emit(Loading());
    final reqResult = await sl<GetCoursesUseCase>().call(sectionID: section.id);
    reqResult.fold(
      (l) => emit(LoadingFailed(error: l.message)),
      (r) => emit(LoadingDone(courses: r)),
    );
  }
}

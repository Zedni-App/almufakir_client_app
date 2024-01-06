part of 'courses_cubit.dart';

sealed class CoursesState extends Equatable {
  const CoursesState();

  @override
  List<Object> get props => [];
}

final class CoursesInitial extends CoursesState {}

final class Loading extends CoursesState {}

final class LoadingDone extends CoursesState {
  final List<CourseEntity> courses;

  const LoadingDone({required this.courses});
}

final class LoadingFailed extends CoursesState {
  final String error;

  const LoadingFailed({required this.error});
}

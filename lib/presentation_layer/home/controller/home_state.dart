part of 'home_bloc.dart';

abstract class HomeState extends Equatable {}

class HomeInitial extends HomeState {
  @override
  List<Object?> get props => [];
}

class ActiveScreenChanged extends HomeState {
  final int newIndex;

  ActiveScreenChanged({required this.newIndex});
  @override
  List<Object?> get props => [newIndex];
}

class LoadingCoursesState extends HomeState {
  @override
  List<Object?> get props => [];
}

class LoadingCoursesDoneState extends HomeState {
  final ComboEntity data;

  LoadingCoursesDoneState({required this.data});
  @override
  List<Object?> get props => [data];
}

class LoadingCoursesFailedState extends HomeState {
  final String errorMessage;
  LoadingCoursesFailedState({required this.errorMessage});
  @override
  List<Object?> get props => [errorMessage];
}

class LoadingCourseDataState extends HomeState {
  @override
  List<Object?> get props => [];
}

class LoadingCourseDataDoneState extends HomeState {
  final CourseDataEntity data;

  LoadingCourseDataDoneState({required this.data});
  @override
  List<Object?> get props => [data];
}

class LoadingCourseDataFailedState extends HomeState {
  final String errorMessage;
  LoadingCourseDataFailedState({required this.errorMessage});
  @override
  List<Object?> get props => [errorMessage];
}

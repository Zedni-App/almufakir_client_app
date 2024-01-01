part of 'home_bloc.dart';

abstract class HomeEvent {}

class ChangeActiveScreen extends HomeEvent {
  final int newIndex;

  ChangeActiveScreen({required this.newIndex});
}

class GetCourses extends HomeEvent {}

class GetCourseData extends HomeEvent {
  final int courseID;

  GetCourseData({required this.courseID});
}

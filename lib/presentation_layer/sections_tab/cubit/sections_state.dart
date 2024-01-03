part of 'sections_cubit.dart';

sealed class SectionsState extends Equatable {
  const SectionsState();

  @override
  List<Object> get props => [];
}

final class SectionsInitial extends SectionsState {}

final class Loading extends SectionsState {}

final class LoadingDone extends SectionsState {}

final class LoadingFailed extends SectionsState {
  final String error;

  const LoadingFailed(this.error);
}

part of 'profile_bloc.dart';

abstract class ProfileState extends Equatable {
  const ProfileState();
}

class ProfileInitial extends ProfileState {
  @override
  List<Object?> get props => [];
}

class UpdateUserDataState extends ProfileState {
  final ProcessState processState;
  final String resultMessage;

  const UpdateUserDataState({
    required this.processState,
    required this.resultMessage,
  });

  @override
  List<Object> get props => [
        processState,
        resultMessage,
      ];
}

class UpdateUserImageState extends ProfileState {
  final ProcessState processState;
  final String resultMessage;

  const UpdateUserImageState({
    required this.processState,
    required this.resultMessage,
  });

  @override
  List<Object> get props => [
        processState,
        resultMessage,
      ];
}

class GetUserDataState extends ProfileState {
  final ProcessState processState;
  final String resultMessage;

  const GetUserDataState({
    required this.processState,
    required this.resultMessage,
  });

  @override
  List<Object> get props => [
        processState,
        resultMessage,
      ];
}

class InvertPassHideState extends ProfileState {
  @override
  List<Object?> get props => [];
}

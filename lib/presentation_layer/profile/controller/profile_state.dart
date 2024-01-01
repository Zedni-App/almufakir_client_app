part of 'profile_bloc.dart';

abstract class ProfileState extends Equatable {
  const ProfileState();
}

class ProfileInitial extends ProfileState {
  @override
  List<Object?> get props => [];
}

class UpdateUserNameState extends ProfileState {
  final ProcessState processState;
  final String resultMessage;

  const UpdateUserNameState({
    required this.processState,
    this.resultMessage = "",
  });

  @override
  List<Object> get props => [
        processState,
        resultMessage,
      ];
}

class UpdateUserPassState extends ProfileState {
  final ProcessState processState;
  final String resultMessage;

  const UpdateUserPassState({
    required this.processState,
    this.resultMessage = "",
  });

  @override
  List<Object> get props => [
        processState,
        resultMessage,
      ];
}

class UpdateUserEmailState extends ProfileState {
  final ProcessState processState;
  final String resultMessage;

  const UpdateUserEmailState({
    required this.processState,
    this.resultMessage = "",
  });

  @override
  List<Object> get props => [
        processState,
        resultMessage,
      ];
}

class UpdateUserPhoneState extends ProfileState {
  final ProcessState processState;
  final String resultMessage;

  const UpdateUserPhoneState({
    required this.processState,
    this.resultMessage = "",
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
    this.resultMessage = "",
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
    this.resultMessage = "",
  });

  @override
  List<Object> get props => [
        processState,
        resultMessage,
      ];
}

class InvertPassHideState extends ProfileState {
  final bool show;

  const InvertPassHideState(this.show);

  @override
  List<Object?> get props => [show];
}

class AppThemeChanged extends ProfileState {
  final bool isDark;

  const AppThemeChanged({required this.isDark});
  @override
  List<Object?> get props => [isDark];
}

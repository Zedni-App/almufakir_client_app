part of 'login_bloc.dart';

abstract class LoginState {}

class LoginInitial extends LoginState {}

class LoginRequest extends LoginState {
  final ProcessState requestState;
  final String resultMessage;

  LoginRequest({
    required this.requestState,
    this.resultMessage = '',
  });
}

class RegisterRequest extends LoginState {
  final ProcessState requestState;
  final String resultMessage;

  RegisterRequest({
    required this.requestState,
    this.resultMessage = '',
  });
}

class GetUserDataRequest extends LoginState {
  final ProcessState requestState;
  final String resultMessage;

  GetUserDataRequest({
    required this.requestState,
    this.resultMessage = '',
  });
}

class InvertPassHideState extends LoginState {}

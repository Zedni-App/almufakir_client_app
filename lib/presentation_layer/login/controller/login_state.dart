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

class LogoutDone extends LoginState {
  final String message;

  LogoutDone({required this.message});
}

class InvertPassHideState extends LoginState {}

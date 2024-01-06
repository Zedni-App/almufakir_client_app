part of 'login_bloc.dart';

abstract class LoginEvents {}

class LoginEvent extends LoginEvents {
  final String email;
  final String password;

  LoginEvent({
    required this.email,
    required this.password,
  });
}

class RegisterEvent extends LoginEvents {
  final UserEntity newUser;

  RegisterEvent({required this.newUser});
}

class InvertShowPass extends LoginEvents {}

class LogoutEvent extends LoginEvents {
  final bool manually;

  LogoutEvent({required this.manually});
}

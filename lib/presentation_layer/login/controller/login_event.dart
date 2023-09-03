part of 'login_bloc.dart';

abstract class LoginEvents extends Equatable {
  const LoginEvents();
}

class LoginEvent extends LoginEvents {
  final String email;
  final String password;

  const LoginEvent({
    required this.email,
    required this.password,
  });

  @override
  List<Object?> get props => [
        email,
        password,
      ];
}

class RegisterEvent extends LoginEvents {
  final String email;
  final String name;
  final String password;

  const RegisterEvent({
    required this.email,
    required this.name,
    required this.password,
  });

  @override
  List<Object?> get props => [
    email,
    name,
    password,
  ];
}
class InvertShowPass extends LoginEvents {
  @override
  List<Object?> get props => [];
}


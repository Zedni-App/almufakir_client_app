import 'package:equatable/equatable.dart';

class UserEntity extends Equatable {
  final int id;
  final String name;
  final String email;
  final String phone;
  final String password;
  final String imageUrl;

  const UserEntity({
    required this.id,
    required this.name,
    required this.email,
    required this.phone,
    required this.password,
    required this.imageUrl,
  });

  @override
  List<Object> get props => [id,name, email, phone, password, imageUrl];
}

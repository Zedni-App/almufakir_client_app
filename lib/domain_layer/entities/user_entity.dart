import 'package:equatable/equatable.dart';

class UserEntity extends Equatable {
  final int id;
  final String fName;
  final String lName;
  final String email;
  final String phone;
  final String password;
  final String imageUrl;
  final String regDate;

  const UserEntity({
    required this.id,
    required this.fName,
    required this.lName,
    required this.email,
    required this.phone,
    required this.password,
    required this.imageUrl,
    required this.regDate,
  });

  factory UserEntity.newUser({
    required String fName,
    required String lName,
    required String email,
    required String password,
  }) {
    return UserEntity(
      id: 0,
      fName: fName,
      lName: lName,
      email: email,
      phone: "",
      password: password,
      imageUrl: "",
      regDate: "",
    );
  }

  @override
  List<Object> get props => [
        id,
        fName,
        lName,
        email,
        phone,
        password,
        imageUrl,
        regDate,
      ];

  UserEntity copyWith({
    int? id,
    String? fName,
    String? lName,
    String? email,
    String? phone,
    String? password,
    String? imageUrl,
    String? regDate,
  }) {
    return UserEntity(
      id: id ?? this.id,
      fName: fName ?? this.fName,
      lName: lName ?? this.lName,
      email: email ?? this.email,
      phone: phone ?? this.phone,
      password: password ?? this.password,
      imageUrl: imageUrl ?? this.imageUrl,
      regDate: regDate ?? this.regDate,
    );
  }
}

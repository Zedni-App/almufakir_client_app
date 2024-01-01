import 'package:zidne/data_layer/shared_preferences.dart';

import '../../domain_layer/entities/user_entity.dart';

class UserModel extends UserEntity {
  const UserModel({
    required super.id,
    required super.fName,
    required super.lName,
    required super.email,
    required super.phone,
    required super.password,
    required super.imageUrl,
    required super.regDate,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'fname': fName,
      'lname': lName,
      'email': email,
      'phone': phone,
      'password': password,
      // 'imageUrl': imageUrl,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      id: map['id'] as int,
      fName: map['fname'] as String,
      lName: map['lname'] as String,
      email: map['email'] as String,
      phone: map['phone'] ?? "",
      password: "",
      imageUrl: map['imageUrl'] ?? "",
      regDate: map['reg_date'] as String,
    );
  }

  factory UserModel.fromEntity(UserEntity user) {
    return UserModel(
      id: user.id,
      fName: user.fName,
      lName: user.lName,
      email: user.email,
      phone: user.phone,
      password: user.password,
      imageUrl: user.imageUrl,
      regDate: user.regDate,
    );
  }
  saveUser() {
    AppSp.setInt(key: SPVars.userID, value: id);
    AppSp.setString(key: SPVars.userName, value: fName);
    AppSp.setString(key: SPVars.userNick, value: lName);
    AppSp.setString(key: SPVars.userEmail, value: email);
    AppSp.setString(key: SPVars.userPhone, value: phone);
    AppSp.setString(key: SPVars.userRegDate, value: regDate);
    AppSp.setString(key: SPVars.userImageURL, value: imageUrl);
  }
}

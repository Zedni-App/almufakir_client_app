import '../data_layer/shared_preferences.dart';
import '../domain_layer/entities/user_entity.dart';

UserEntity appUser = UserEntity(
  id: AppSp.getInt(SPVars.userID) ?? 0,
  fName: AppSp.getString(SPVars.userName) ?? "",
  lName: AppSp.getString(SPVars.userNick) ?? "",
  email: AppSp.getString(SPVars.userEmail) ?? "",
  phone: AppSp.getString(SPVars.userPhone) ?? "",
  password: "",
  imageUrl: AppSp.getString(SPVars.userImageURL) ?? "",
  regDate: AppSp.getString(SPVars.userRegDate) ?? "",
);

void updateAppUser({
  String? fName,
  String? lName,
  String? email,
  String? phone,
  String? imageUrl,
}) {
  appUser = UserEntity(
    id: appUser.id,
    fName: fName ?? appUser.fName,
    lName: lName ?? appUser.lName,
    email: email ?? appUser.email,
    phone: phone ?? appUser.phone,
    password: '',
    imageUrl: imageUrl ?? appUser.imageUrl,
    regDate: appUser.regDate,
  );
  if (fName != null) {
    AppSp.setString(key: SPVars.userName, value: fName);
  }
  if (lName != null) {
    AppSp.setString(key: SPVars.userNick, value: lName);
  }
  if (email != null) {
    AppSp.setString(key: SPVars.userEmail, value: email);
  }
  if (phone != null) {
    AppSp.setString(key: SPVars.userPhone, value: phone);
  }
  if (imageUrl != null) {
    AppSp.setString(key: SPVars.userImageURL, value: imageUrl);
  }
}

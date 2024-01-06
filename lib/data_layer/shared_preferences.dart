import 'package:shared_preferences/shared_preferences.dart';

class AppSp {
  static late SharedPreferences _sp;

  static Future init() async {
    _sp = await SharedPreferences.getInstance();
  }

  static Future<bool> setString(
      {required String key, required String value}) async {
    return await _sp.setString(key, value);
  }

  static Future<bool> setInt({required String key, required int value}) async {
    return await _sp.setInt(key, value);
  }

  static Future<bool> setDouble(
          {required String key, required double value}) async =>
      await _sp.setDouble(key, value);

  static Future<bool> setBool(
      {required String key, required bool value}) async {
    return await _sp.setBool(key, value);
  }

  static String? getString(String key) => _sp.getString(key);

  static int? getInt(String key) => _sp.getInt(key);

  static double getDouble(String key) => _sp.getDouble(key) ?? -1;

  static bool getBool(String key) => _sp.getBool(key) ?? false;

  static Future<bool> removeKey(String key) => _sp.remove(key);
  static Future<bool> clear() async {
    return await _sp.clear();
  }
}

abstract class SPVars {
  static const isDark = "is_dark";
  static const loggedIn = "loggedIn";
  static const userID = "user_id";
  static const userEmail = "user_email";
  static const userName = "user_name";
  static const userNick = "user_last_name";
  static const userPhone = "user_phone";
  static const userRate = "user_rate";
  static const userRegDate = "user_reg_date";
  static const userImageURL = "user_image";
  static const sessionToken = "sessionToken";
  static const videoMoveValue = "videoMoveValue";
}

import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalData extends GetxController {
  SharedPreferences? _sharedPreferences;

  Future<List> initData() async {
    if (kDebugMode) print("LocalData: Loading local user data.");
    _sharedPreferences = await SharedPreferences.getInstance();
    String token = _sharedPreferences?.getString("token") ?? "";
    if (kDebugMode) print("LocalData: token = $token");
    return [token, true];
  }

  // logout user
  void deleteUserData() {
    writeData(key: "token", value: "");
    writeBool(key: "showWelComeWindow", value: false);
  }

  void writeData({required String key, required String value}) {
    if (_sharedPreferences == null) return;
    _sharedPreferences?.setString(key, value);
    if (kDebugMode) print("LocalData.writeData(): String: $key Value: $value");
  }

  void writeBool({required String key, required bool value}) {
    if (_sharedPreferences == null) return;
    _sharedPreferences?.setBool(key, value);
    if (kDebugMode) print("LocalData.writeBool(): String: $key Value: $value");
  }
}

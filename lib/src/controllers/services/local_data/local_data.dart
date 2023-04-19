import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalData extends GetxController {
  SharedPreferences? _sharedPreferences;
  String tokenName = "token";
  String showWelcomeWindowName = "showWelcomeWindow";

  Future<List> initData() async {
    if (kDebugMode) print("LocalData: Loading local user data.");
    _sharedPreferences = await SharedPreferences.getInstance();
    String token = _sharedPreferences?.getString(tokenName) ?? "";
    bool showWelcomeWindow = _sharedPreferences?.getBool(showWelcomeWindowName) ?? false;
    if (kDebugMode) print("LocalData: token = $token showWelcomeWindow = $showWelcomeWindow");
    return [token, showWelcomeWindow];
  }

  // logout user
  void deleteUserData() {
    writeData(key: tokenName, value: "");
    writeBool(key: showWelcomeWindowName, value: false);
  }

  // set welcomeScreen value
  void setShowWelcomeScreenValue() {
    writeBool(key: showWelcomeWindowName, value: true);
  }

  // Write local data
  void writeData({required String key, required String value}) {
    if (_sharedPreferences == null) return;
    _sharedPreferences?.setString(key, value);
    if (kDebugMode) print("LocalData.writeData(): String: $key Value: $value");
  }

  // Write local bool data
  void writeBool({required String key, required bool value}) {
    if (_sharedPreferences == null) return;
    _sharedPreferences?.setBool(key, value);
    if (kDebugMode) print("LocalData.writeBool(): String: $key Value: $value");
  }
}

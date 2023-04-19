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
    _writeData(key: tokenName, value: "");
    _writeBool(key: showWelcomeWindowName, value: false);
  }

  // set token value on login
  void setTokenValue(String token) {
    _writeData(key: tokenName, value: token);
  }

  // set welcomeScreen value
  void setShowWelcomeScreenValue() {
    _writeBool(key: showWelcomeWindowName, value: true);
  }

  // Write local data
  void _writeData({required String key, required String value}) {
    if (_sharedPreferences == null) return;
    _sharedPreferences?.setString(key, value);
    if (kDebugMode) print("LocalData.writeData(): $key: $value");
  }

  // Write local bool data
  void _writeBool({required String key, required bool value}) {
    if (_sharedPreferences == null) return;
    _sharedPreferences?.setBool(key, value);
    if (kDebugMode) print("LocalData.writeBool(): $key: $value");
  }
}

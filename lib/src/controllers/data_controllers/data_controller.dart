import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:ubazar/src/controllers/services/api/api_services.dart';
import 'package:ubazar/src/controllers/services/handle_error/error_handler.dart';
import 'package:ubazar/src/controllers/services/local_data/local_data.dart';
import 'package:ubazar/src/controllers/services/user_message/snackbar.dart';

class DataController extends GetxController {
  final LocalData _localData = Get.put(LocalData());
  RxString token = "".obs;
  bool showWelcomeScreen = false;
  RxBool isRequesting = false.obs;

  DataController();

  Future<void> initApp() async {
    await _localData.initData().then((value) {
      token.value = value[0];
      showWelcomeScreen = value[1];
    });
    loadData();
  }

  // Change welcomeScreenValue
  void setShowWelcomeScreenValue() {
    showWelcomeScreen = true;
    _localData.setShowWelcomeScreenValue();
  }

  // Run to load primary data
  Future<void> loadData() async {
    await _errorHandler(function: () async {
      await getProductList();
    });
  }

  // Fetching product
  Future<void> getProductList() async {
    if (token.isNotEmpty) await ApiServices.getProductList(token.value);
  }

  // Login (Needed to be changed with api)
  Future<bool> login(String tokenValue) async {
    if (tokenValue.isEmpty) return false;
    showSnackBar(title: "Success", message: "Token has been changed");
    if (kDebugMode) print("DataController.login(): Login request for $tokenValue");
    token.value = tokenValue;
    _localData.setTokenValue(tokenValue);
    return true;
  }

  // Logout
  Future<void> logout() async {
    token.value = "";
    _localData.deleteUserData();
  }

  // Error handler
  Future<ErrorType> _errorHandler({required Function function}) async {
    isRequesting.value = true;
    ErrorType errorType = await ErrorHandler.errorHandler(() async => function());
    if (errorType == ErrorType.invalidUser) logout();
    isRequesting.value = false;
    return errorType;
  }
}

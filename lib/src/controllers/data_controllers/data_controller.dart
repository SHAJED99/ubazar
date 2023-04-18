import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:ubazar/src/controllers/services/api/api_services.dart';
import 'package:ubazar/src/controllers/services/handle_error/error_handler.dart';
import 'package:ubazar/src/controllers/services/local_data/local_data.dart';

class DataController extends GetxController {
  final LocalData _localData = Get.put(LocalData());
  RxString token =
      "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJVc2VySWQiOiI3OCIsIkN1cnJlbnRDb21JZCI6IjEiLCJuYmYiOjE2ODE3MDI5OTAsImV4cCI6MTY4MjMwNzc5MCwiaWF0IjoxNjgxNzAyOTkwfQ.JCU1MPH_SOJsHYpOn9GKrYx90N3Tsdtut3rTU3Hl09g"
          .obs;
  RxBool isRequesting = false.obs;

  DataController();

  Future<void> initApp() async {
    token.value = await _localData.initData().then((value) => value[0]);
    loadData();
  }

  Future<void> loadData() async {
    await _errorHandler(function: () async {
      await getProductList();
    });
  }

  Future<void> getProductList() async {
    await ApiServices.getProductList(token.value);
  }

  // Logout
  Future<void> logout() async {
    _localData.deleteUserData();
  }

  Future<ErrorType> _errorHandler({required Function function}) async {
    isRequesting.value = true;
    ErrorType errorType = await ErrorHandler.errorHandler(() async => function());
    if (errorType == ErrorType.invalidUser) logout();
    isRequesting.value = false;
    return errorType;
  }
}

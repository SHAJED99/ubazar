import 'package:get/get.dart';
import 'package:ubazar/src/controllers/data_controllers/data_controller.dart';
import 'package:ubazar/src/models/app_models/app_constants.dart';

class SplashScreenController extends GetxController {
  bool isInit = false;
  bool isDone = false;
  bool showWelcomeScreen = false;

  SplashScreenController() {
    init();
    flashScreenTimeOut();
  }

  init() async {
    final DataController dataController = Get.find();
    await dataController.initApp();
    showWelcomeScreen = dataController.showWelcomeScreen;
    isInit = true;
    update();
  }

  flashScreenTimeOut() async {
    await Future.delayed(const Duration(seconds: defaultSplashScreenWaitingTime));
    isDone = true;
    update();
  }
}

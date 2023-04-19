import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:ubazar/src/controllers/screen_controllers/splash_screen_controller.dart';
import 'package:ubazar/src/models/app_models/app_constants.dart';
import 'package:ubazar/src/views/screens/welcome_screens/welcome_screens_wrapper.dart';
import 'package:ubazar/src/views/screens/wrapped_screens/wrapper_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    final SplashScreenController splashScreenController = Get.put(SplashScreenController());
    // Go to Home Screen
    splashScreenController.addListener(() {
      if (splashScreenController.isDone && splashScreenController.isInit) Get.off(() => splashScreenController.showWelcomeScreen ? const WrapperScreen() : const WelcomePageWrapper());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: SafeArea(
        child: Center(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: defaultPadding * 2),
            constraints: const BoxConstraints(maxWidth: defaultMaxWidth),
            child: SvgPicture.asset(
              'lib/assets/svg/logo/logo_full.svg',
            ),
          ),
        ),
      ),
    );
  }
}

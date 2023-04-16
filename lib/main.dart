import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ubazar/src/models/app_models/app_constants.dart';
import 'package:ubazar/src/views/splash_screen.dart';
import 'package:ubazar/src/views/welcome_screens/welcome_screens_wrapper.dart';

void main(List<String> args) {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData(
        primarySwatch: defaultPrimarySwatch,
        colorScheme: ColorScheme.fromSwatch(primarySwatch: defaultPrimarySwatch).copyWith(
          error: defaultErrorColor,
        ),
      ),
      debugShowCheckedModeBanner: false,
      // initialBinding: InitializedBinding(),
      scrollBehavior: const MaterialScrollBehavior().copyWith(
        dragDevices: {
          PointerDeviceKind.mouse,
          PointerDeviceKind.touch,
        },
      ),
      // home: const SplashScreen(),
      home: const WelcomePageWrapper(),
    );
  }
}

class InitializedBinding extends Bindings {
  @override
  void dependencies() {
    // Add dependencies or controllers here
  }
}

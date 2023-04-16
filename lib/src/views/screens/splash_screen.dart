import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ubazar/src/models/app_models/app_constants.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: SafeArea(
        child: Center(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: defaultPadding * 2),
            constraints: const BoxConstraints(maxWidth: defaultMaxWidth),
            child: SvgPicture.asset('lib/assets/svg/logo/logo_full.svg'),
          ),
        ),
      ),
    );
  }
}

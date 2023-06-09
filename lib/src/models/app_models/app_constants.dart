import 'package:flutter/material.dart';

// App Information
const String appVersion = "1.0.0";

// Colors
const MaterialColor defaultPrimarySwatch = MaterialColor(
  0xFF019102,
  <int, Color>{
    50: Color(0xFFE7F7E7),
    100: Color(0xFFC0E6C0),
    200: Color(0xFF97D397),
    300: Color(0xFF6ECF6E),
    400: Color(0xFF46C946),
    500: Color(0xFF1EBA1E),
    600: Color(0xFF1AA71A),
    700: Color(0xFF178E17),
    800: Color(0xFF147414),
    900: Color(0xFF0C4A0C),
  },
);
const Color defaultBlackColor = Color(0xFF000000);
const Color defaultWhiteColor = Color(0xFFFAFAFA);
const Color defaultGreyColor = Color(0xFF707070);
const Color defaultShadowColor = Color.fromARGB(16, 0, 0, 0);
const Color defaultErrorColor = Colors.redAccent;

// // Duration
const defaultSplashScreenWaitingTime = 3;
const defaultDuration = 150;

// const int otpLength = 4;

// Box Size
const double defaultPadding = 16;
const double defaultMaxWidth = 400;
const double defaultNavBarHeight = 16 * 3.5;
const double defaultBoxHeight = 16 * 5;
const double defaultCarouselHeight = 16 * 11;

// // Box Shadow
List<BoxShadow> defaultBoxShadowUp = [
  const BoxShadow(
    color: defaultShadowColor,
    offset: Offset(0, -3),
    blurRadius: 6,
  )
];
const List<BoxShadow> defaultBoxShadowDown = [
  BoxShadow(
    color: defaultShadowColor,
    offset: Offset(0, 3),
    blurRadius: 6,
  )
];

// // Text
const TextStyle defaultHead1 = TextStyle(
  fontSize: 16,
  fontWeight: FontWeight.w500,
  color: defaultBlackColor,
);
const TextStyle defaultSubtitle1 = TextStyle(
  fontSize: 32,
  fontWeight: FontWeight.w300,
  color: defaultGreyColor,
);
const TextStyle defaultSubtitle2 = TextStyle(
  fontSize: 20,
  fontWeight: FontWeight.normal,
  color: defaultGreyColor,
);
const TextStyle defaultSubtitle3 = TextStyle(
  fontSize: 13,
  fontWeight: FontWeight.w300,
  color: Color(0XFF707070),
);

const TextStyle defaultCarouselTitle = TextStyle(
  fontSize: 22,
  fontWeight: FontWeight.bold,
  color: defaultWhiteColor,
  height: 1,
);
const TextStyle buttonText1 = TextStyle(
  fontSize: 16,
  height: 1,
  fontWeight: FontWeight.bold,
  color: defaultWhiteColor,
);

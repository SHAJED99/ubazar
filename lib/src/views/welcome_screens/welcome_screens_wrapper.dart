import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:ubazar/src/models/app_models/app_constants.dart';

class WelcomePageWrapper extends StatefulWidget {
  const WelcomePageWrapper({super.key});

  @override
  State<WelcomePageWrapper> createState() => _WelcomePageWrapperState();
}

class _WelcomePageWrapperState extends State<WelcomePageWrapper> {
  PageController _pageController = PageController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Welcome Pages
          PageView(
            controller: _pageController,
            children: [
              Container(
                color: Colors.amber,
              ),
              Container(
                color: Colors.red,
              ),
              Container(
                color: Colors.yellow,
              ),
            ],
          ),
          // Indicator Dot
          Positioned(
            bottom: 0,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: defaultPadding / 2),
              child: Row(
                children: [
                  SmoothPageIndicator(
                    controller: _pageController,
                    count: 3,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

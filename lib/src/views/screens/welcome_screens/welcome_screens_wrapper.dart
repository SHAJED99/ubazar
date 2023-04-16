import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:ubazar/src/models/app_models/app_constants.dart';
import 'package:ubazar/src/views/screens/welcome_screens/widgets/welcome_page_1.dart';
import 'package:ubazar/src/views/screens/welcome_screens/widgets/welcome_page_2.dart';
import 'package:ubazar/src/views/screens/welcome_screens/widgets/welcome_page_3.dart';
import 'package:ubazar/src/views/widgets/buttons/custom_text_button.dart';

class WelcomePageWrapper extends StatefulWidget {
  const WelcomePageWrapper({super.key});

  @override
  State<WelcomePageWrapper> createState() => _WelcomePageWrapperState();
}

class _WelcomePageWrapperState extends State<WelcomePageWrapper> {
  int currentIndex = 0;
  final PageController _pageController = PageController();
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            // Welcome Pages
            PageView(
              onPageChanged: (value) {
                if (mounted) setState(() => currentIndex = value);
              },
              controller: _pageController,
              children: const [
                WelcomePage1(),
                WelcomePage2(),
                WelcomePage3(),
              ],
            ),
            // Footer
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: defaultPadding, vertical: defaultPadding),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    AnimatedSize(
                      duration: const Duration(milliseconds: defaultDuration),
                      // Change the skip text to done
                      child: currentIndex != 2
                          // Skip text
                          ? CustomTextButton(
                              contentPadding: const EdgeInsets.symmetric(horizontal: defaultPadding / 2, vertical: defaultPadding / 2),
                              child: Text("Skip", style: defaultSubtitle2.copyWith(height: 1)),
                            )
                          : // Done text
                          CustomTextButton(
                              contentPadding: const EdgeInsets.symmetric(horizontal: defaultPadding / 2, vertical: defaultPadding / 2),
                              child: Text("Done", style: defaultSubtitle2.copyWith(height: 1, color: Theme.of(context).primaryColor)),
                            ),
                    ),
                    // Indicator Dot
                    Flexible(
                      child: SmoothPageIndicator(
                        controller: _pageController,
                        count: 3,
                        effect: ExpandingDotsEffect(
                          dotHeight: defaultPadding,
                          dotWidth: defaultPadding,
                          activeDotColor: Theme.of(context).primaryColor,
                          dotColor: defaultGreyColor,
                          expansionFactor: 2,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

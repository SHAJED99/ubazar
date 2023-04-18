import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ubazar/src/models/app_models/app_constants.dart';

class WelcomePage1 extends StatelessWidget {
  const WelcomePage1({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: defaultPadding, vertical: defaultPadding),
      constraints: const BoxConstraints(maxWidth: defaultMaxWidth),
      child: Stack(
        children: [
          // Artwork
          Center(
            child: SvgPicture.asset(
              "lib/assets/svg/cart.svg",
            ),
          ),
          // Text
          Positioned(
            child: FittedBox(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text("Welcome to", style: defaultSubtitle1),
                  Row(
                    children: [
                      SvgPicture.asset("lib/assets/svg/logo/logo_small.svg", height: defaultPadding * 2),
                      const Text(" Application", style: defaultSubtitle1),
                    ],
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

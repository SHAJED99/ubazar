import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ubazar/src/models/app_models/app_constants.dart';

class WelcomePage3 extends StatelessWidget {
  const WelcomePage3({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: defaultPadding, vertical: defaultPadding),
      constraints: const BoxConstraints(maxWidth: defaultMaxWidth),
      child: Stack(
        children: [
          // Artwork
          Center(
            child: SvgPicture.asset("lib/assets/svg/shopping.svg"),
          ),
          // Text
          Positioned(
            child: Align(
              heightFactor: 1,
              child: FittedBox(
                child: Column(
                  children: [
                    const Text("Best Quality", style: defaultSubtitle1),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Grocery", style: defaultSubtitle1.copyWith(color: Theme.of(context).primaryColor, fontWeight: FontWeight.w700)),
                        const Text(" Door to Door", style: defaultSubtitle1),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

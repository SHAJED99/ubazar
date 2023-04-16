import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ubazar/src/models/app_models/app_constants.dart';

class WelcomePage2 extends StatelessWidget {
  const WelcomePage2({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: defaultPadding, vertical: defaultPadding),
      constraints: const BoxConstraints(maxWidth: defaultMaxWidth),
      child: Stack(
        children: [
          // Artwork
          Center(
            child: SvgPicture.asset("lib/assets/svg/girl_with_bike.svg"),
          ),
          // Text
          Positioned(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Flexible(
                  child: FittedBox(
                    child: RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(
                        style: defaultSubtitle1,
                        children: <TextSpan>[
                          const TextSpan(text: 'Get\n'),
                          TextSpan(
                            text: 'Fast',
                            style: defaultSubtitle1.copyWith(
                              color: Theme.of(context).primaryColor,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          const TextSpan(text: ' Delivery Service'),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

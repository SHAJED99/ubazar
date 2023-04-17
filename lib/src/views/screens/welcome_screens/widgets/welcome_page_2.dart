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
      child: LayoutBuilder(builder: (context, boxConstraints) {
        return Stack(
          children: [
            // Artwork
            Center(
              child: SvgPicture.asset("lib/assets/svg/girl_with_bike.svg"),
            ),
            // Text
            Positioned(
              child: Align(
                heightFactor: 1,
                child: FittedBox(
                  child: Column(
                    children: [
                      const Text("Get", style: defaultSubtitle1),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Fast", style: defaultSubtitle1.copyWith(color: Theme.of(context).primaryColor, fontWeight: FontWeight.w700)),
                          const Text(" Delivery Service", style: defaultSubtitle1),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        );
      }),
    );
  }
}

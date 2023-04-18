import 'package:flutter/material.dart';
import 'package:ubazar/src/models/app_models/app_constants.dart';
import 'package:ubazar/src/views/screens/wrapped_screens/home/widgets/home_carousel_card.dart';
import 'package:ubazar/src/views/widgets/custom_carousel_widget.dart';

class HomeCarousel extends StatelessWidget {
  const HomeCarousel({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      heightFactor: 1,
      child: Container(
        constraints: const BoxConstraints(maxWidth: defaultMaxWidth),
        padding: const EdgeInsets.symmetric(vertical: defaultPadding / 4),
        child: CustomCarousel(
          aspectRatio: 2.6,
          productList: [
            HomeCarouselCard(child: Image.asset("lib/assets/images/carousel/image.png", fit: BoxFit.fitHeight)),
            HomeCarouselCard(child: Image.asset("lib/assets/images/carousel/image.png", fit: BoxFit.fitHeight)),
            HomeCarouselCard(child: Image.asset("lib/assets/images/carousel/image.png", fit: BoxFit.fitHeight)),
            HomeCarouselCard(child: Image.asset("lib/assets/images/carousel/image.png", fit: BoxFit.fitHeight)),
          ],
          onBuild: (element) {
            return Container(
              child: element.value,
            );
          },
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ubazar/src/controllers/data_controllers/data_controller.dart';
import 'package:ubazar/src/models/app_models/app_constants.dart';
import 'package:ubazar/src/views/screens/wrapped_screens/home/widgets/home_carousel.dart';
import 'package:ubazar/src/views/screens/wrapped_screens/home/widgets/home_category.dart';
import 'package:ubazar/src/views/widgets/custom_card_widget.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});
  final DataController dataController = Get.find();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: RefreshIndicator(
        onRefresh: () async {
          await dataController.loadData();
        },
        child: ListView.builder(
          itemBuilder: (context, index) {
            // Carousel
            if (index == 0) return const HomeCarousel();

            // Category
            if (index == 1) return HomeCategory();

            return CustomCard(
              onTap: () {},
              boxShadow: defaultBoxShadowDown,
              backgroundColor: Theme.of(context).canvasColor,
              borderRadius: BorderRadius.circular(0),
              padding: const EdgeInsets.all(0),
              margin: const EdgeInsets.symmetric(vertical: defaultPadding / 4),
              child: SizedBox(
                height: defaultBoxHeight,
                child: Row(
                  children: [
                    AspectRatio(
                      aspectRatio: 1,
                      child: FittedBox(
                        child: Image.asset("lib/assets/images/product/1.png"),
                      ),
                    ),
                    const SizedBox(width: defaultPadding / 4),
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Lorem Ipsum",
                            maxLines: 1,
                            style: defaultHead1,
                          ),
                          const SizedBox(height: defaultPadding / 4),
                          Text(
                            "+ MediaQuery.of(context).viewInsets.top+ MediaQuery.of(context).viewInsets.top+ MediaQuery.of(context).viewInsets.top",
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: defaultHead1.copyWith(
                              color: defaultGreyColor,
                              fontWeight: FontWeight.w300,
                            ),
                          ),
                        ],
                      ),
                    ),
                    // const Spacer(),
                    Icon(Icons.arrow_forward_ios, color: Theme.of(context).primaryColor),
                    const SizedBox(width: defaultPadding / 2),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

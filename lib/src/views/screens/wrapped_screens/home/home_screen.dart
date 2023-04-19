import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ubazar/src/controllers/data_controllers/data_controller.dart';
import 'package:ubazar/src/views/screens/wrapped_screens/home/widgets/home_carousel.dart';
import 'package:ubazar/src/views/screens/wrapped_screens/home/widgets/home_category.dart';
import 'package:ubazar/src/views/screens/wrapped_screens/home/widgets/home_product_list_card.dart';

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

            return const HomeProductListCard();
          },
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ubazar/src/controllers/data_controllers/data_controller.dart';
import 'package:ubazar/src/controllers/screen_controllers/main_screen_wrapper_controller.dart';
import 'package:ubazar/src/models/app_models/app_constants.dart';
import 'package:ubazar/src/models/pojo_classes/page_index.dart';
import 'package:ubazar/src/views/screens/product_details_screen/product_details_screen.dart';
import 'package:ubazar/src/views/screens/wrapped_screens/home/widgets/home_carousel.dart';
import 'package:ubazar/src/views/screens/wrapped_screens/home/widgets/home_category.dart';
import 'package:ubazar/src/views/screens/wrapped_screens/home/widgets/home_product_list_card.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});
  final DataController dataController = Get.find();
  // final MainScreenWrapperController mainScreenWrapperController = Get.find();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: RefreshIndicator(
        onRefresh: () async {
          await dataController.loadData();
        },
        child: Obx(
          // This can be done in several way. I just focus on the performance of the app 😁
          () => ListView.builder(
            itemCount: dataController.productList.length + 3,
            itemBuilder: (context, index) {
              // Carousel #1
              if (index == 0) return const HomeCarousel();

              // Category #2
              if (index == 1) return HomeCategory();

              // Show loading indicator #3
              if (dataController.productList.isEmpty && dataController.isRequesting.value) {
                return const CircularProgressIndicator();
              } else if (dataController.productList.isEmpty && !dataController.isRequesting.value) {
                return const Center(
                  child: Text(
                    "No data found. Check your login status. If you are not login then put your token in the left side drawer.",
                    textAlign: TextAlign.center,
                    style: defaultSubtitle1,
                  ),
                );
              }

              // Show products #3
              if (index - 2 >= 0 && index - 2 < dataController.productList.length) {
                return HomeProductListCard(
                  productListIndex: index - 2,
                );
              } else {
                return const SizedBox();
              }
            },
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ubazar/src/controllers/data_controllers/data_controller.dart';
import 'package:ubazar/src/controllers/screen_controllers/main_screen_wrapper_controller.dart';
import 'package:ubazar/src/models/app_models/app_constants.dart';
import 'package:ubazar/src/models/pojo_classes/page_index.dart';
import 'package:ubazar/src/views/screens/product_details_screen/product_details_screen.dart';
import 'package:ubazar/src/views/widgets/custom_card_widget.dart';

class HomeProductListCard extends StatelessWidget {
  final int productListIndex;
  HomeProductListCard({
    super.key,
    required this.productListIndex,
  });

  final DataController dataController = Get.find();
  final MainScreenWrapperController mainScreenWrapperController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Align(
      widthFactor: 1,
      child: Container(
        constraints: const BoxConstraints(maxWidth: defaultMaxWidth),
        child: CustomCard(
          onTap: () {
            mainScreenWrapperController.changeIndex(
              index: PageEnum.home,
              page: ProductDetailsScreen(
                productModel: dataController.productList[productListIndex],
              ),
            );
          },
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
                      // Headline
                      Text(
                        dataController.productList[productListIndex].name ?? "N/A",
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: defaultHead1,
                      ),
                      const SizedBox(height: defaultPadding / 4),
                      // Subtitle
                      Text(
                        dataController.productList[productListIndex].code ?? "N/A",
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
                Icon(Icons.arrow_forward_ios, color: Theme.of(context).primaryColor),
                const SizedBox(width: defaultPadding / 2),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

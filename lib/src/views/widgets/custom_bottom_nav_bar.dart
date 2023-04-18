import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ubazar/src/controllers/screen_controllers/main_screen_wrapper_controller.dart';
import 'package:ubazar/src/models/app_models/app_constants.dart';
import 'package:ubazar/src/models/pojo_classes/page_index.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  CustomBottomNavigationBar({
    super.key,
    this.fontStyle,
    this.selectedFontStyle,
  });
  final MainScreenWrapperController mainScreenWrapperController = Get.find();
  final TextStyle? fontStyle;
  final TextStyle? selectedFontStyle;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: defaultNavBarHeight,
      decoration: BoxDecoration(boxShadow: defaultBoxShadowUp),
      child: Material(
        child: Row(
          children: mainScreenWrapperController.pages
              .asMap()
              .entries
              .map(
                (e) => Expanded(
                  child: InkWell(
                    onTap: () {
                      mainScreenWrapperController.changeIndex(index: PageEnum.values.elementAt(e.key));
                    },
                    child: LayoutBuilder(builder: (context, boxConstraints) {
                      return Obx(
                        () => Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            // Icon
                            SizedBox(
                              height: boxConstraints.maxHeight * 0.5,
                              child: FittedBox(
                                child: Icon(
                                  e.value.iconData,
                                  color: e.key == mainScreenWrapperController.currentPage.value.pageIndex.index ? Theme.of(context).primaryColor : defaultGreyColor,
                                ),
                              ),
                            ),
                            // Name
                            FittedBox(
                              child: Text(
                                e.value.name,
                                style: e.key == mainScreenWrapperController.currentPage.value.pageIndex.index
                                    ? selectedFontStyle ??
                                        TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.normal,
                                          color: Theme.of(context).primaryColor,
                                        )
                                    : fontStyle ??
                                        TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.normal,
                                          color: Theme.of(context).shadowColor,
                                        ),
                              ),
                            )
                          ],
                        ),
                      );
                    }),
                  ),
                ),
              )
              .toList(),
        ),
      ),
    );
  }
}

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ubazar/src/models/pojo_classes/custom_page_model.dart';
import 'package:ubazar/src/models/pojo_classes/page_index.dart';
import 'package:ubazar/src/models/pojo_classes/wrapped_screen_state.dart';
import 'package:ubazar/src/views/screens/wrapped_screens/cart/cart_screen.dart';
import 'package:ubazar/src/views/screens/wrapped_screens/favourite/favourite_screen.dart';
import 'package:ubazar/src/views/screens/wrapped_screens/home/home_screen.dart';
import 'package:ubazar/src/views/screens/wrapped_screens/me/me_screen.dart';
import 'package:ubazar/src/views/widgets/custom_top_app_bar.dart';

class MainScreenWrapperController extends GetxController {
  final RxList<ScreenState> _previousPages = RxList<ScreenState>();
  final Rx<ScreenState> currentPage = ScreenState(pageIndex: PageEnum.home, page: HomeScreen()).obs;
  List<CustomPage> pages = [
    CustomPage(name: "Home", iconData: Icons.home_outlined, page: HomeScreen()),
    CustomPage(name: "Cart", iconData: Icons.shopping_cart_outlined, page: const CartScreen()),
    CustomPage(name: "Favourite", iconData: Icons.favorite_border, page: const FavouriteScreen()),
    CustomPage(name: "Me", iconData: Icons.person_outlined, page: const MeScreen()),
  ];

  changeIndex({required PageEnum index, PreferredSizeWidget? topNavBar, Widget? page}) {
    // Add previous page list
    _previousPages.add(currentPage.value);

    // Reset page list
    if (page == null) {
      _previousPages.value = [];
    }

    // Set current page
    currentPage.value = ScreenState(pageIndex: index, page: page ?? pages[index.index].page);
  }

  bool goBackPage() {
    if (kDebugMode) print(currentPage.value.pageIndex);
    if (kDebugMode) print(_previousPages.length);

    // Exit app
    if (currentPage.value.pageIndex == PageEnum.home && _previousPages.isEmpty) {
      return true;
    }

    // Go to home page / Reset page
    if (currentPage.value.pageIndex != PageEnum.home && _previousPages.isEmpty) {
      currentPage.value = ScreenState(pageIndex: PageEnum.home, page: HomeScreen());
      return false;
    }

    currentPage.value = _previousPages.last;
    _previousPages.removeLast();
    return false;
  }
}

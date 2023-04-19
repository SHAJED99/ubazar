import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ubazar/src/controllers/screen_controllers/main_screen_wrapper_controller.dart';
import 'package:ubazar/src/models/app_models/app_constants.dart';
import 'package:ubazar/src/views/widgets/custom_bottom_nav_bar.dart';
import 'package:ubazar/src/views/widgets/custom_top_app_bar.dart';
import 'package:ubazar/src/views/widgets/text_field_widget.dart';

class WrapperScreen extends StatefulWidget {
  const WrapperScreen({super.key});

  @override
  State<WrapperScreen> createState() => _WrapperScreenState();
}

class _WrapperScreenState extends State<WrapperScreen> {
  final MainScreenWrapperController pageController = Get.find();
  final scaffoldKey = GlobalKey<ScaffoldState>();
  double searchBarHeight = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).primaryColor,
      child: SafeArea(
        child: WillPopScope(
          onWillPop: () async {
            bool res = pageController.goBackPage();
            if (res) {
              showDialog(
                context: context,
                builder: (context) => Container(),
              );
            }
            return false;
          },
          child: Obx(
            () => Scaffold(
              key: scaffoldKey,
              appBar: CustomTopAppBar(
                onTapMenu: () => scaffoldKey.currentState?.openDrawer(),
                // Showing search bar
                onTapSearch: () => {if (mounted) setState(() => searchBarHeight == 0 ? searchBarHeight = defaultNavBarHeight : searchBarHeight = 0)},
              ),
              drawer: FractionallySizedBox(
                widthFactor: 0.8,
                child: Container(
                  color: Theme.of(context).primaryColor,
                ),
              ),
              body: Column(
                children: [
                  // Search bar
                  AnimatedSize(
                    duration: const Duration(milliseconds: defaultDuration),
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: defaultPadding / 2, horizontal: defaultPadding),
                      height: searchBarHeight,
                      child: searchBarHeight != 0
                          ? CustomTextFormField(
                              prefixIcon: const Icon(Icons.search),
                              onFieldSubmitted: (value) {
                                print(value);
                              },
                            )
                          : null,
                    ),
                  ),
                  // Main
                  Flexible(child: pageController.currentPage.value.page),
                ],
              ),
              bottomNavigationBar: CustomBottomNavigationBar(),
            ),
          ),
        ),
      ),
    );
  }
}

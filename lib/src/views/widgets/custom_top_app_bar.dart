import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:ubazar/src/controllers/data_controllers/data_controller.dart';
import 'package:ubazar/src/controllers/screen_controllers/main_screen_wrapper_controller.dart';
import 'package:ubazar/src/models/app_models/app_constants.dart';

class CustomTopAppBar extends StatelessWidget implements PreferredSizeWidget {
  CustomTopAppBar({
    super.key,
    this.onTapMenu,
    this.onTapSearch,
    this.onTapCart,
  });

  @override
  Size get preferredSize => const Size.fromHeight(defaultNavBarHeight);

  final DataController dataController = Get.find();
  final MainScreenWrapperController pageController = Get.find();
  final void Function()? onTapMenu;
  final void Function()? onTapSearch;
  final void Function()? onTapCart;

  @override
  Widget build(BuildContext context) {
    return Container(
      // alignment: Alignment.center,
      height: preferredSize.height,
      color: Theme.of(context).primaryColor,
      padding: const EdgeInsets.symmetric(vertical: defaultPadding / 1.5),
      child: Stack(
        children: [
          Positioned.fill(
            child: SvgPicture.asset(
              "lib/assets/svg/logo/logo_small.svg",
              color: Theme.of(context).canvasColor,
            ),
          ),
          FractionallySizedBox(
            heightFactor: 1,
            child: Align(
              alignment: Alignment.center,
              heightFactor: 1,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  NavBarRoundedButton(
                    icon: Icons.menu,
                    onTap: onTapMenu,
                  ),
                  Row(
                    children: [
                      NavBarRoundedButton(
                        icon: Icons.search,
                        onTap: onTapSearch,
                      ),
                      NavBarRoundedButton(
                        icon: Icons.shopping_cart_outlined,
                        onTap: onTapCart,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class NavBarRoundedButton extends StatelessWidget {
  final void Function()? onTap;
  final IconData? icon;
  final bool isActive;
  const NavBarRoundedButton({
    super.key,
    this.onTap,
    this.icon,
    this.isActive = false,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: defaultPadding / 4),
      child: AspectRatio(
        aspectRatio: 1,
        child: ClipOval(
          child: Material(
            color: Colors.transparent,
            child: InkWell(
              onTap: onTap,
              child: FittedBox(
                child: Padding(
                  padding: const EdgeInsets.all(defaultPadding / 2),
                  child: Icon(icon, color: Theme.of(context).canvasColor),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

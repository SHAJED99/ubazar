import 'package:flutter/material.dart';
import 'package:ubazar/src/models/app_models/app_constants.dart';

class HomeCarouselCard extends StatelessWidget {
  final void Function()? onTap;
  final Widget? child;
  final EdgeInsetsGeometry? padding;

  const HomeCarouselCard({
    super.key,
    this.onTap,
    this.child,
    this.padding,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: padding ?? const EdgeInsets.symmetric(horizontal: defaultPadding / 4),
        clipBehavior: Clip.antiAlias,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(defaultPadding / 2),
        ),
        child: child,
      ),
    );
  }
}

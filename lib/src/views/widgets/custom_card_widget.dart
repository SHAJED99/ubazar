import 'package:flutter/material.dart';

class CustomCard extends StatelessWidget {
  final EdgeInsetsGeometry margin;
  final EdgeInsetsGeometry padding;
  final BorderRadiusGeometry? borderRadius;
  final Color? backgroundColor;
  final Widget? child;
  // final AlignmentGeometry alignment;
  final List<BoxShadow>? boxShadow;
  final void Function()? onTap;
  final Clip clipBehavior;

  const CustomCard({
    super.key,
    this.margin = const EdgeInsets.all(8),
    this.padding = const EdgeInsets.all(8),
    this.child,
    this.backgroundColor,
    this.borderRadius,
    // this.alignment = Alignment.center,
    this.boxShadow,
    this.onTap,
    this.clipBehavior = Clip.antiAlias,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: clipBehavior,
      decoration: BoxDecoration(
        boxShadow: boxShadow,
        borderRadius: borderRadius ?? BorderRadius.circular(5),
        color: backgroundColor,
      ),
      margin: margin,
      child: Stack(
        children: [
          Container(
            padding: padding,
            child: child,
          ),
          if (onTap != null)
            Positioned.fill(
              child: Container(
                clipBehavior: Clip.antiAlias,
                decoration: BoxDecoration(
                  borderRadius: borderRadius ?? BorderRadius.circular(5),
                ),
                child: Material(
                  color: Colors.transparent,
                  child: InkWell(
                    onTap: onTap,
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}

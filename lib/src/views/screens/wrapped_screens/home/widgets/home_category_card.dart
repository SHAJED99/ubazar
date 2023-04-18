import 'package:flutter/material.dart';
import 'package:ubazar/src/models/app_models/app_constants.dart';
import 'package:ubazar/src/views/widgets/custom_card_widget.dart';

class HomeCategoryCard extends StatelessWidget {
  final void Function()? onTap;
  final Widget? child;
  final String? text;
  const HomeCategoryCard({
    super.key,
    this.onTap,
    this.child,
    this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: LayoutBuilder(builder: (context, BoxConstraints boxConstraints) {
        return CustomCard(
          onTap: onTap,
          clipBehavior: Clip.none,
          margin: const EdgeInsets.all(0),
          padding: const EdgeInsets.all(0),
          child: Column(
            children: [
              SizedBox(
                width: boxConstraints.maxWidth,
                child: AspectRatio(
                  aspectRatio: 1,
                  child: FittedBox(
                    child: CustomCard(
                      padding: const EdgeInsets.all(defaultPadding / 3),
                      margin: const EdgeInsets.only(bottom: defaultPadding / 3),
                      boxShadow: defaultBoxShadowDown,
                      backgroundColor: Theme.of(context).canvasColor,
                      child: child,
                    ),
                  ),
                ),
              ),
              if (text != null)
                Text(
                  text ?? "",
                  style: defaultSubtitle3,
                ),
            ],
          ),
        );
      }),
    );
  }
}

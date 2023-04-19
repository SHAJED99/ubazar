import 'package:flutter/material.dart';
import 'package:ubazar/src/models/app_models/app_constants.dart';
import 'package:ubazar/src/views/widgets/custom_card_widget.dart';

class HomeProductListCard extends StatelessWidget {
  const HomeProductListCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      widthFactor: 1,
      child: Container(
        constraints: const BoxConstraints(maxWidth: defaultMaxWidth),
        child: CustomCard(
          onTap: () {},
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
                      const Text(
                        "Lorem Ipsum",
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: defaultHead1,
                      ),
                      const SizedBox(height: defaultPadding / 4),
                      Text(
                        """In publishing and graphic design, Lorem ipsum is a placeholder text commonly used to 
                        demonstrate the visual form of a document or a typeface without relying on meaningful content. 
                        Lorem ipsum may be used as a placeholder before final copy is available.""",
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

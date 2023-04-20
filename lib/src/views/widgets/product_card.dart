import 'package:flutter/material.dart';
import 'package:ubazar/src/models/app_models/app_constants.dart';
import 'package:ubazar/src/models/pojo_classes/product_model.dart';
import 'package:ubazar/src/views/widgets/buttons/custom_elevated_button_widget.dart';
import 'package:ubazar/src/views/widgets/custom_card_widget.dart';

class ProductCard extends StatefulWidget {
  const ProductCard({super.key, required this.productModel});
  final ProductModel productModel;

  @override
  State<ProductCard> createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  int cartCount = 0;
  bool isFavorite = false;

  @override
  Widget build(BuildContext context) {
    return CustomCard(
      padding: const EdgeInsets.all(defaultPadding / 4),
      boxShadow: defaultBoxShadowDown,
      backgroundColor: Colors.white,
      child: Stack(
        children: [
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Dummy Image
              Container(
                padding: const EdgeInsets.only(bottom: defaultPadding / 2),
                height: 100,
                child: Image.asset("lib/assets/images/product/1.png", fit: BoxFit.contain),
              ),
              // Name
              Text(widget.productModel.name ?? "N/A", style: defaultHead1),
              const SizedBox(height: defaultPadding / 4),
              // Price
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    "\$${widget.productModel.price}",
                    style: defaultSubtitle3.copyWith(
                      color: Theme.of(context).primaryColor,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                  const SizedBox(width: defaultPadding / 2),
                  // show old price
                  if (widget.productModel.oldPrice != null && widget.productModel.oldPrice != 0.0)
                    Text(
                      "\$${widget.productModel.oldPrice}",
                      style: defaultSubtitle3.copyWith(
                        color: defaultGreyColor,
                        decoration: TextDecoration.lineThrough,
                      ),
                    ),
                ],
              ),
              const SizedBox(height: defaultPadding / 2),
              // Cart Value
              Container(
                height: defaultBoxHeight / 2,
                constraints: const BoxConstraints(maxWidth: defaultMaxWidth / 2),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    // Remove cart
                    ProductCardButton(
                      showItem: cartCount > 0,
                      onTap: () {
                        if (mounted) setState(() => cartCount -= 1);
                      },
                      backgroundColor: Theme.of(context).primaryColor,
                      child: Icon(Icons.remove, color: Theme.of(context).canvasColor),
                    ),
                    // Cart value number
                    ProductCardButton(
                      showItem: cartCount > 0,
                      child: Text(
                        "$cartCount",
                        style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold, height: 1),
                      ),
                    ),
                    // Add cart
                    ProductCardButton(
                      onTap: () {
                        if (mounted) setState(() => cartCount += 1);
                      },
                      backgroundColor: Theme.of(context).primaryColor,
                      child: cartCount > 0 ? Icon(Icons.add, color: Theme.of(context).canvasColor) : const Text("Add to cart", style: buttonText1),
                    ),
                  ],
                ),
              )
            ],
          ),
          Positioned(
            right: 0,
            child: CustomElevatedButton(
              onTap: () {
                if (mounted) setState(() => isFavorite = !isFavorite);
                return null;
              },
              borderRadius: BorderRadius.circular(100),
              height: null,
              contentPadding: const EdgeInsets.all(defaultPadding / 2),
              backgroundColor: Colors.transparent,
              child: Icon(isFavorite ? Icons.favorite : Icons.favorite_border, color: Theme.of(context).primaryColor),
            ),
          )
        ],
      ),
    );
  }
}

class ProductCardButton extends StatelessWidget {
  const ProductCardButton({
    super.key,
    this.onTap,
    this.child,
    this.backgroundColor,
    this.showItem = true,
  });
  final void Function()? onTap;
  final Widget? child;
  final Color? backgroundColor;
  final bool showItem;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: showItem ? 1 : 0,
      child: AnimatedSize(
          duration: const Duration(milliseconds: defaultDuration),
          child: CustomCard(
            margin: EdgeInsets.zero,
            padding: EdgeInsets.zero,
            backgroundColor: backgroundColor,
            onTap: onTap,
            child: AnimatedSize(
              duration: const Duration(milliseconds: defaultDuration),
              child: showItem
                  ? Center(
                      child: FittedBox(
                        child: child,
                      ),
                    )
                  : Container(),
            ),
          )),
    );
  }
}

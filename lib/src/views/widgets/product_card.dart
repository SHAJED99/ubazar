import 'package:flutter/material.dart';
import 'package:ubazar/src/models/app_models/app_constants.dart';
import 'package:ubazar/src/models/pojo_classes/product_model.dart';
import 'package:ubazar/src/views/widgets/custom_card_widget.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({super.key, required this.productModel});
  final ProductModel productModel;

  @override
  Widget build(BuildContext context) {
    return CustomCard(
      boxShadow: defaultBoxShadowDown,
      child: SizedBox(
        height: 100,
        width: 100,
      ),
    );
  }
}

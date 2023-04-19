import 'package:flutter/material.dart';
import 'package:ubazar/src/models/pojo_classes/product_model.dart';
import 'package:ubazar/src/views/widgets/product_card.dart';

class ProductDetailsScreen extends StatelessWidget {
  const ProductDetailsScreen({super.key, required this.productModel});
  final ProductModel productModel;

  @override
  Widget build(BuildContext context) {
    return ProductCard(productModel: productModel);
  }
}

// This file can be replaced with api documentation

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ubazar/src/models/app_models/app_constants.dart';
import 'package:ubazar/src/models/pojo_classes/category_model.dart';
import 'package:ubazar/src/views/screens/wrapped_screens/home/widgets/home_category_card.dart';

class HomeCategory extends StatelessWidget {
  HomeCategory({super.key});

  final List<CategoryModel> categoryList = [
    CategoryModel(image: SvgPicture.asset("lib/assets/images/category/all.svg"), name: "All"),
    CategoryModel(image: SvgPicture.asset("lib/assets/images/category/fruit.svg"), name: "Fruits"),
    CategoryModel(image: SvgPicture.asset("lib/assets/images/category/vegetable.svg"), name: "Vegetables"),
    CategoryModel(image: SvgPicture.asset("lib/assets/images/category/fish.svg"), name: "Fish"),
  ];

  @override
  Widget build(BuildContext context) {
    return Align(
      widthFactor: 1,
      child: Container(
        constraints: const BoxConstraints(maxWidth: defaultMaxWidth),
        padding: const EdgeInsets.all(defaultPadding / 4),
        child: Row(
          children: categoryList
              .map((e) => HomeCategoryCard(
                    onTap: () {},
                    text: e.name,
                    child: e.image,
                  ))
              .toList(),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class CategoryModel {
  final Widget image;
  final void Function()? onTap;
  final String name;

  CategoryModel({
    required this.image,
    this.onTap,
    required this.name,
  });
}

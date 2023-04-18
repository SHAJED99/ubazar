import 'package:flutter/material.dart';
import 'package:ubazar/src/models/pojo_classes/page_index.dart';

class ScreenState {
  final PageEnum pageIndex;

  final Widget page;

  ScreenState({
    required this.page,
    required this.pageIndex,
  });
}

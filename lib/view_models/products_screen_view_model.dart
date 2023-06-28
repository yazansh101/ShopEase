import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';

class ProductsScreenViewModel extends GetxController {
  final scrollController = ScrollController();
  RxBool isTitleVisibleOnBar = false.obs;

  @override
  void onInit() {
    scrollController.addListener(_onScroll);
    log('onScroll');
    super.onInit();
  }

  void _onScroll() {
    if (scrollController.position.userScrollDirection ==
        ScrollDirection.reverse) {
      isTitleVisibleOnBar.value = true;
      update();
    } else if (scrollController.position.userScrollDirection ==
        ScrollDirection.forward) {
      isTitleVisibleOnBar.value = false;
      update();
    }
  }
}

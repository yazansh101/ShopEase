import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'categories_view_model.dart';
import 'products_view_model.dart';

class HomeViewModel extends GetxController {
  final ProductsViewModel _productsViewModel;
  final CategoriesViewModel _categoriesViewModel;
  HomeViewModel(this._productsViewModel, this._categoriesViewModel);
  RxInt currentIndexForBottomNavigationBar = 0.obs;
  int indexforPageOfBanner = 0;
  bool isLoading = false;

  @override
  void onInit() {
    initData();
    super.onInit();
  }

  final PageController pageController = PageController(initialPage: 0);
  onBannerPagedChanged(int index){
    indexforPageOfBanner=index;
    update();
  }
  onHomePageChanged(int index) {
    if (index - currentIndexForBottomNavigationBar.value > 1 ||
        currentIndexForBottomNavigationBar.value - index > 1) {
      pageController.jumpToPage(index);
    } else {
      pageController.animateToPage(index,
          duration: const Duration(milliseconds: 500), curve: Curves.ease);
    }

    currentIndexForBottomNavigationBar.value = index;
  }

  initData() async {
    isLoading = true;
    await _categoriesViewModel.initListOfCategories();
    await _productsViewModel.initListOfPRoducts();
    isLoading = false;
    update();
  }
}

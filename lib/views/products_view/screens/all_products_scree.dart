import 'package:chat_app_max/views/products_view/widgets/item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:get/get.dart';

import '../../../core/widgets/custom_text.dart';
import '../../../view_models/categories_view_model.dart';
import '../../../view_models/products_screen_view_model.dart';
import '../../../view_models/products_view_model.dart';
import '../../item_details/screens/item_details_screen.dart';

class AllProducts extends StatelessWidget {
  String categoryName;
  AllProducts({super.key, required this.categoryName});

  final productsViewModel = Get.find<ProductsViewModel>();
  final categoriesViewModel = Get.find<CategoriesViewModel>();
  final productsScreenViewModel = Get.find<ProductsScreenViewModel>();

  @override
  Widget build(BuildContext context) {
    double cardWidth = MediaQuery.of(context).size.width / 3.0;
    double cardHeight = MediaQuery.of(context).size.height / 3.9;
    return Scaffold(
      appBar: _buildAppBar(),
      body: _buildBody(cardWidth, cardHeight),
    );
  }

  Padding _buildBody(double cardWidth, double cardHeight) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (!productsScreenViewModel.isTitleVisibleOnBar.value)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: _buildTextHeader(),
            ),
          const SizedBox(height: 5),
          _buildListOfItems(cardWidth, cardHeight),
        ],
      ),
    );
  }

  Expanded _buildListOfItems(double cardWidth, double cardHeight) {
    return Expanded(
      child: AnimationLimiter(
        child: GridView.count(
          controller: productsScreenViewModel.scrollController,
          childAspectRatio: cardWidth / cardHeight,
          crossAxisCount: 2,
          children: List.generate(
            productsViewModel.getListOfSelectedCategory(categoryName).length,
            (int index) {
              return AnimationConfiguration.staggeredGrid(
                key: ValueKey(
                  productsViewModel
                      .getListOfSelectedCategory(categoryName)[index]
                      .id,
                ),
                position: index,
                duration: const Duration(milliseconds: 600),
                columnCount: 2,
                child: ScaleAnimation(
                  child: FadeInAnimation(
                    child: GestureDetector(
                      onTap: () {
                        Get.to(
                          () => DetailScreen(
                            productModel: productsViewModel
                                .getListOfSelectedCategory(categoryName)[index],
                          ),
                        );
                      },
                      child: Item(
                        key: ValueKey(
                          productsViewModel
                              .getListOfSelectedCategory(categoryName)[index]
                              .id,
                        ),
                        productModel: productsViewModel
                            .getListOfSelectedCategory(categoryName)[index],
                        getCategoryPlaceHolder:
                            productsViewModel.getPlaceHolderImage,
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      elevation: 0,
      backgroundColor: Colors.white,
      centerTitle: true,
      title: GetBuilder<ProductsScreenViewModel>(
        builder: (controller) => AnimatedOpacity(
          duration: const Duration(milliseconds: 300),
          opacity: controller.isTitleVisibleOnBar.value ? 1.0 : 0.0,
          child: Center(
            child: CustomText(
              text: categoriesViewModel.getCategorySelected() == ''
                  ? 'All Products'
                  : categoriesViewModel.getCategorySelected(),
              color: Colors.grey,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }

  GetBuilder<ProductsScreenViewModel> _buildTextHeader() {
    return GetBuilder<ProductsScreenViewModel>(
      builder: (controller) => AnimatedOpacity(
        duration: const Duration(milliseconds: 300),
        opacity: controller.isTitleVisibleOnBar.value ? 0.0 : 1.0,
        child: CustomText(
          text: categoriesViewModel.getCategorySelected() == ''
              ? ' Here you are for all Products'
              : ' ${categoriesViewModel.getCategorySelected()}',
          fontSize: 24,
          color: Colors.grey,
          // fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}

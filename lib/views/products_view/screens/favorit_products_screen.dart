import 'package:chat_app_max/core/utils/constants.dart';
import 'package:chat_app_max/core/utils/size_config.dart';
import 'package:chat_app_max/views/products_view/widgets/item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

import '../../../core/widgets/animated_text.dart';
import '../../../view_models/products_view_model.dart';
import '../../item_details/screens/item_details_screen.dart';

class FavoritProductsScreen extends StatelessWidget {
  FavoritProductsScreen({super.key});
  final productsViewModel = Get.find<ProductsViewModel>();
  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    double cardWidth = SizeConfig.screenWidth / 3.0;
    double cardHeight =SizeConfig.screenHeight / 3.9;
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                SizedBox(
                  height: 15,
                ),
                AnimatedText(
                  'Your Favorite products',
                  fontSize: 18,
                  color: primaryColor,
                  fontWeight: FontWeight.bold,
                  seconds: 2,
                ),
              ],
            ),
          ),
          productsViewModel.listOfFavoriteProducts().isEmpty
              ? Lottie.asset('assets/lottiefiles/123936-empty-ghost.json',
                  onLoaded: (_) {})
              : Expanded(
                  child: AnimationLimiter(
                    child: GridView.count(
                      childAspectRatio: cardWidth / cardHeight,
                      crossAxisCount: 2,
                      children: List.generate(
                        productsViewModel.listOfFavoriteProducts().length,
                        (int index) {
                          return AnimationConfiguration.staggeredGrid(
                            position: index,
                            duration: const Duration(milliseconds: 600),
                            columnCount: 2,
                            child: ScaleAnimation(
                              child: FadeInAnimation(
                                child: GestureDetector(
                                  onTap: () {
                                    Get.to(
                                      DetailScreen(
                                        productModel:
                                            productsViewModel.products[index],
                                      ),
                                    );
                                  },
                                  child: Item(
                                    key: ValueKey(productsViewModel
                                        .listOfFavoriteProducts()[index]
                                        .id),
                                    productModel: productsViewModel
                                        .listOfFavoriteProducts()[index],
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
                ),
        ],
      ),
    );
  }
}

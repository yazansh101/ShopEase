// ignore_for_file: unnecessary_brace_in_string_interps, use_key_in_widget_constructors, prefer_const_constructors_in_immutables

import 'package:chat_app_max/core/utils/constants.dart';
import 'package:chat_app_max/view_models/products_view_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/widgets/custom_favorite_button.dart';
import '../../../core/widgets/custom_text.dart';
import '../../../models/product_model.dart';

class Item extends StatelessWidget {
  Product? productModel;
  @override
  Key? key;
  String Function(String) getCategoryPlaceHolder;
  bool setFavoriteIcon;

  Item({
    required this.productModel,
    required this.key,
    required this.getCategoryPlaceHolder,
    this.setFavoriteIcon = true,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 10,
        bottom: 10,
        left: 10,
        right: 10,
      ),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            padding: const EdgeInsets.only(
              top: 0,
              bottom: 8,
              left: 0,
              right: 4,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.5,
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      border: Border.all(
                        color: Colors.grey,
                        width: 1,
                      ),
                    ),
                    child: Hero(
                      tag: productModel!.id,
                      child: FadeInImage(
                        placeholder: AssetImage(
                          getCategoryPlaceHolder(
                            productModel!.category,
                          ),
                        ),
                        image: NetworkImage(
                          productModel!.image,
                        ),
                        // fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 2,
                ),
                CustomText(
                  text: productModel!.title.length > 25
                      ? '${productModel!.title.substring(0, 25)}.'
                      : productModel!.title,
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  maxLines: 1,
                ),
                const SizedBox(
                  height: 2,
                ),
                CustomText(
                  text: productModel!.category,
                  fontSize: 15,
                  maxLines: 1,
                ),
                const SizedBox(
                  height: 2,
                ),
                CustomText(
                  text: "\$${productModel!.price}",
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  color: primaryColor,
                ),
              ],
            ),
          ),
          if (setFavoriteIcon)
            Container(
              child: Positioned(
                height: 34,
                width: 34,
                top: -10,
                right: -10,
                child: GetBuilder<ProductsViewModel>(
                  builder: (controller) => CustomFavoriteButton(
                    size: 18,
                    backgroundColor: Colors.grey.shade200,
                    iconColor: Colors.grey,
                    isFavorite: productModel!.isFavorite,
                    onTap: () {
                      controller.toggleIsFavorite(productModel!);
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

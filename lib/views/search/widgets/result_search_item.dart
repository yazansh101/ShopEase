

import 'package:chat_app_max/view_models/products_view_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/utils/constants.dart';
import '../../../core/widgets/custom_text.dart';

class ResultSearchItem extends StatelessWidget {
  int id;
  String image;
  String category;
  double price;
  ResultSearchItem({
    Key? key,
    required this.id,
    required this.image,
    required this.category,
    required this.price,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ProductsViewModel productsViewModel=Get.find();
    return Row(children: [
      SizedBox(
        height: 80,
        width: 80,
        child: Hero(
          tag: id,
          child: FadeInImage(
            placeholder: AssetImage(productsViewModel.getPlaceHolderImage(category)),
            image: NetworkImage(
              image,
            //  fit: BoxFit.contain,
            ),
          ),
        ),
      ),
      const SizedBox(
        width: 15,
      ),
      SizedBox(
        width: MediaQuery.of(context).size.width * 0.6,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomText(
              text: category,
              fontSize: 16,
              textOverflow: TextOverflow.ellipsis,
            ),
            const SizedBox(
              height: 5,
            ),
            CustomText(
              text: '\$${price.toString()}',
              fontSize: 12,
              color: primaryColor,
              fontWeight: FontWeight.bold,
            ),
          ],
        ),
      ),
    ]);
  }
}

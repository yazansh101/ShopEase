// ignore_for_file: public_member_api_docs, sort_constructors_first
// ignore_for_file: unnecessary_null_comparison

import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:get/get.dart';

import '../../../models/product_model.dart';
import '../../../view_models/products_view_model.dart';
import '../../item_details/screens/item_details_screen.dart';
import 'item.dart';

class ProductsList extends StatelessWidget {
  List<Product> productsList;
  ProductsList({
    Key? key,
    required this.productsList,
  }) : super(key: key);
  final productsController = Get.find<ProductsViewModel>();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProductsViewModel>(
      init: Get.find<ProductsViewModel>(),
      builder: (controller) => Expanded(
        child: AnimationLimiter(
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: productsList.length,
            itemBuilder: (BuildContext context, int index) {
              return AnimationConfiguration.staggeredList(
                  position: index,
                  duration: const Duration(milliseconds: 375),
                  child: SlideAnimation(
                    verticalOffset: 50.0,
                    child: FadeInAnimation(
                      child: GestureDetector(
                        onTap: () {
                          Get.to(
                            () => DetailScreen(
                              productModel: productsList[index],
                            ),
                          );
                        },
                        child: Item(
                          key: ValueKey(productsList[index].id),
                          productModel: productsList[index],
                          getCategoryPlaceHolder:
                              productsController.getPlaceHolderImage,
                        ),
                      ),
                    ),
                  ));
            },
          ),
        ),
        //   ListView(
        //     scrollDirection: Axis.horizontal,
        //     children:
        //     List.generate( 5,(index) =>
        //      GestureDetector(
        //       onTap: () {
        //         Get.to(()=>
        //         DetailScreen(
        //         productModel: productsList[index],
        //         ),
        //         );
        //       },
        //       child: Item(
        //         key: ValueKey(productsList[index].id),
        //         productModel:productsList[index] ,
        //       getCategoryPlaceHolder: productsController.getPlaceHolderImage,
        //       ),
        //     ),

        //   //  itemCount: controller.listOfBestSellingProducts().length,
        //   //  itemBuilder: (context, index) =>

        //   ),
        // )
      ),
    );
  }
}

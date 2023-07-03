
import 'package:chat_app_max/core/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../core/widgets/custom_favorite_button.dart';
import '../../../core/widgets/custom_text.dart';
//import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import '../../../core/widgets/custom_text_bottun.dart';
import '../../../models/product_model.dart';
import '../../../view_models/products_view_model.dart';
import '../../orders/cart_view_model.dart';


class DetailScreen extends StatelessWidget {
  Product? productModel;
  DetailScreen({super.key, this.productModel});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: _buildAppBar(),
        body: myBody(size));
  }

  AppBar _buildAppBar() {
    return AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Get.back();
          },
        ),
        actions: [
          Container(
            //         margin: const EdgeInsets.all(3),
            child: GetBuilder<ProductsViewModel>(
                builder: (controller) => Container(
                      margin: const EdgeInsets.all(15),
                      child: CustomFavoriteButton(
                        isFavorite: productModel!.isFavorite,
                        onTap: () {
                          controller.toggleIsFavorite(productModel!);
                        },
                      ),
                    )),
          ),
        ],
      );
  }

  Padding myBody(Size size) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Column(
        children: [
           _buildImage(size),
          _buildProductInfo(size),
          _buildAddToCartSection(size),
        ],
      ),
    );
  }

  Expanded _buildProductInfo(Size size) {
    return Expanded(
          child: SingleChildScrollView(
            child: AnimationLimiter(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: AnimationConfiguration.toStaggeredList(
                  duration: const Duration(milliseconds: 375),
                  childAnimationBuilder: (widget) => SlideAnimation(
                    horizontalOffset: 50.0,
                    child: FadeInAnimation(
                      child: widget,
                    ),
                  ),
                  children: [
                   
                    SizedBox(
                      height: size.height * 0.01,
                    ),
                    CustomText(
                      text: productModel!.title,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                      maxLines: 1,
                      textOverflow: TextOverflow.clip,
                    ),
                    SizedBox(
                      height: size.height * 0.01,
                    ),
                    const StarRatingItem(),
                    SizedBox(
                      height: size.height * 0.01,
                    ),
                    CustomText(
                      text: 'Description',
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey,
                    ),
                    SizedBox(
                      height: size.height * 0.01,
                    ),
                    CustomText(
                      text: productModel!.description,
                      fontSize: 15,
                      heightBetweenLines: 2.5,
                      color: Colors.grey,
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
  }

  Hero _buildImage(Size size) {
    return Hero(
      
      tag: productModel!.id,
      child: SizedBox(
        width: size.width,
        height: size.height * .4,
        child: Image.network(
          productModel!.image,
        ),
      ),
    );
  }

  Container _buildAddToCartSection(Size size) {
    return Container(
      padding: const EdgeInsets.all(15.0),
      height: 80,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            offset: const Offset(0, -15),
            blurRadius: 20,
            color: const Color(0xFFDADADA).withOpacity(0.15),
          ),
        ],
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
        color: Colors.white,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            width: size.width * 0.3,
            child: Column(
              children: [
                CustomText(
                  text: 'Price',
                  fontSize: 15,
                ),
                CustomText(
                  text: '\$${productModel!.price}',
                  fontSize: 18,
                  color: Colors.green,
                  fontWeight: FontWeight.bold,
                ),
              ],
            ),
          ),
          Row(
            children: [
              SvgPicture.asset('assets/icons/Cart Icon.svg',color: Colors.white,),
              GetBuilder<CartViewModel>(
                init: CartViewModel(),
                builder: (controller) => CustomTextButton(
                  text: 'Add to Cart',
                  onPressed: () {
                    controller.addItemToCart(productModel!);
                    Get.showSnackbar(
                      GetSnackBar(
                        backgroundColor: Colors.white,
                      dismissDirection: DismissDirection.vertical,
                      duration: const Duration(milliseconds: 1200),
                      messageText:
                          Row(
                            children: [
                              const Icon(Icons.done),
                              const SizedBox(height: 5,),
                              CustomText(text: 'One Item added to Cart', fontSize: 12,color: 
                              primaryColor,),
                            ],
                          ),
                    ));
                  },
                  width: size.width * 0.4,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class StarRatingItem extends StatelessWidget {
  const StarRatingItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.grey,
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(5),
          bottomRight: Radius.circular(5),
        ),
      ),
      height: 30,
      width: 60,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(
            Icons.star,
            color: Colors.amber,
          ),
          const SizedBox(
            width: 5,
          ),
          CustomText(
            text: '4.8',
            fontSize: 15,
            alignment: Alignment.center,
            color: Colors.white,
          )
        ],
      ),
    );
  }
}

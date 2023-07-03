// ignore_for_file: avoid_unnecessary_containers

import 'package:chat_app_max/core/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/widgets/custom_botton.dart';
import '../../../core/widgets/custom_text.dart';
import '../../../models/cart_model.dart';
import '../../orders/cart_view_model.dart';



class CartItemWidget extends StatelessWidget {
  CartItem  cartItem;
  CartItemWidget({super.key, 
    required this.cartItem,
  });

  @override
  Widget build(BuildContext context) {
    CartViewModel cartController= Get.find();
    return Dismissible(
        key: Key(cartItem.product.id.toString()),
        background: Container(
          decoration: BoxDecoration(
            color: Colors.redAccent.shade200,
          ),
          child: Row(
            children: const [
              Spacer(),
              Icon(
                Icons.remove_circle,
                size: 40,
              ),
            ],
          ),
        ),
        direction: DismissDirection.endToStart,
        onDismissed: (_) {
          cartController.removeItem(cartItem.product.id.toString());
        },
        child: Padding(
          padding: const EdgeInsets.only(
            top: 8,
            left: 8,
            right: 8,
          ),
          child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                  width: 2,
                  color: Colors.grey.shade100,
                )),
            child: Row(children: [
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                ),
                height: 150,
                width: MediaQuery.of(context).size.width * 0.28,
                child: Hero(
                  tag: cartItem.product.id,
                  child: Image.network(
                    cartItem.product.image,
                    scale: 1.1,
                    fit: BoxFit.contain,
                  ),
                ),
              ),
              const SizedBox(
                width: 15,
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.6,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomText(
                      text: cartItem.product.title,
                      fontSize: 18,
                      textOverflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    CustomText(
                      text: '\$${cartItem.product.price.toString()}',
                      fontSize: 14,
                      color: primaryColor,
                      fontWeight: FontWeight.bold,
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    Row(
                     mainAxisAlignment: MainAxisAlignment.start,
                     children: [
                       CustomButton(
                         borderColor: primaryColor,
                         color: Colors.grey.shade300,
                         onPressed: () {
                           cartController.addItemToCart(cartItem.product);
                         },
                         child: const Icon(
                           Icons.add,
                           size: 20,
                           color: Colors.grey,
                         ),
                       ),
                       const SizedBox(
                         width: 10,
                       ),
                      GetBuilder<CartViewModel>(
                      builder: (cartViewModel) =>  CustomText(
                           text: cartViewModel.items[cartItem.product.id.toString()]!.quantity
                               .toString(),
                           fontSize: 15,
                           fontWeight: FontWeight.bold,
                         ),
                       ),
                       const SizedBox(
                         width: 10,
                       ),
                       CustomButton(
                         borderColor: Colors.grey,
                         color: Colors.grey.shade300,
                         onPressed: () {
                           cartController.removeSingleItem(cartItem.product.id.toString());
                         },
                         child: Container(
                           margin: const EdgeInsets.only(bottom: 20),
                           child: const Icon(
                             Icons.minimize,
                             size: 20,
                             color: Colors.grey,
                           ),
                         ),
                       ),
                     ],
                      ),
                  ],
                ),
              ),
            ]),
          ),
        ),
      );
  }
}

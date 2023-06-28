import 'package:chat_app_max/core/utils/constants.dart';
import 'package:chat_app_max/core/utils/size_config.dart';
import 'package:chat_app_max/views/cart/widgets/cart_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

import '../../../core/widgets/custom_text_bottun.dart';
import '../../cheack_out/screens/check_out.dart';
import '../../orders/cart_view_model.dart';

class CartScreen extends StatelessWidget {
  CartScreen({super.key});
  final cartViewModel = Get.find<CartViewModel>();
  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    return Scaffold(
      appBar: _buildAppBar('Your Items \n', ''),
      body: _buildBody(),
      bottomNavigationBar: _buildButtomBar(),
    );
  }

  Container _buildButtomBar() {
    return Container(
      padding: const EdgeInsets.all(15),
      height: setHeight(12),
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
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          const SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GetBuilder<CartViewModel>(
                builder:(cartViewModel) =>  Text.rich(
                  TextSpan(
                    children: [
                      const TextSpan(text: 'Total:\n'),
                      TextSpan(
                         text: '\$${cartViewModel.totalAmount.roundToDouble()}',
                          style: const TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color: Colors.green)),
                    ],
                  ),
                ),
              ),
              CustomTextButton(
                text: 'Check Out',
                onPressed: () {
                  if (cartViewModel.itemCount == 0) {
                    return;
                  } else {
                    Get.to(() => const CheckoutPage(),transition: Transition.downToUp);
                  }
                },
                height: 50,
                width: 150,
                color: primaryColor,
              ),
            ],
          ),
        ],
      ),
    );
  }

  AppBar _buildAppBar(String title, String secondTitle) {
    return AppBar(
      title: GetBuilder<CartViewModel>(
        init: CartViewModel(),
        builder: (controller) => Text.rich(
            textAlign: TextAlign.center,
            TextSpan(
              text: title,
              style: const TextStyle(
                fontSize: 18,
                color: Colors.black,
              ),
              children: [
                TextSpan(
                  text: controller.items.length >= 2
                      ? '${controller.items.length} items'
                      : '${controller.items.length} item',
                  style: const TextStyle(
                    fontSize: 12,
                    color: Colors.grey,
                  ),
                ),
              ],
            )),
      ),
      elevation: 0,
      backgroundColor: Colors.white,
      centerTitle: true,
    );
  }

  Padding _buildBody() {
    return Padding(
      padding: const EdgeInsets.only(
        top: 20,
        left: 0,
      ),
      child: Column(
        children: [
          Expanded(
            child: GetBuilder<CartViewModel>(
              init: CartViewModel(),
              builder: (cartController) => cartController.items.values.isEmpty
                  ? Lottie.asset('assets/lottiefiles/123725-box-empty.json')
                  : AnimationLimiter(
                      child: _buildListOfCartItems(cartController),
                    ),
            ),
          ),
        ],
      ),
    );
  }

  ListView _buildListOfCartItems(CartViewModel cartController) {
    return ListView.builder(
      itemCount: cartController.items.values.length,
      itemBuilder: (BuildContext context, int index) {
        return AnimationConfiguration.staggeredList(
          position: index,
          duration: const Duration(milliseconds: 800),
          child: SlideAnimation(
            verticalOffset: 50.0,
            child: FadeInAnimation(
              child: CartItemWidget(
                cartItem: cartController.items.values.toList()[index],
              ),
            ),
          ),
        );
      },
    );
  }
}

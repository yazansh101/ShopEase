import 'package:chat_app_max/views/home/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

import '../../../core/utils/size_config.dart';
import '../../../core/widgets/custom_text_bottun.dart';
import '../../orders/cart_view_model.dart';

class FinishingScreen extends StatelessWidget {
   FinishingScreen({super.key});
  
var cartViewModel=Get.find<CartViewModel>();
  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    return Scaffold(
        body: Center(
            child: Column(
      children: [
       // SizedBox(height: SizeConfig.screenHeight * 0.06),
        Lottie.asset('assets/lottiefiles/success.json', repeat: false,
            onLoaded: (_) {
        }),
       // SizedBox(height:  SizeConfig.screenHeight * 0.1),
        const Text(
          "Thank you for your purchase!\n Your order has been successfully processed \n and will be shipped shortly.",
         textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 16,
          //  fontWeight: FontWeight.bold,
            color: Colors.grey,
          ),
        ),
        const Spacer(),
        SizedBox(
          width: SizeConfig.screenWidth * 0.6,
          child: CustomTextButton(
            text: "Back to home",
            onPressed: () {
              cartViewModel.clear();
              Get.offAll(() =>  const HomeScreen());
            },
          ),
        ),
        const Spacer(),
      ],
    )));
  }
}

import 'package:chat_app_max/views/home/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

import '../../../core/utils/size_config.dart';
import '../../../core/widgets/custom_text_bottun.dart';

class LoginSuccessScreen extends StatelessWidget {
  bool onLoad = false;
  static String routeName = "/login_success";

  LoginSuccessScreen({super.key});
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
        body: Column(
      children: [
        SizedBox(height: size.height * 0.06),
        Lottie.asset('assets/lottiefiles/success.json', repeat: false,
            onLoaded: (_) {
          print('fd');
        }),
        SizedBox(height: size.height * 0.08),
        AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          child: const Text(
            "Login Success",
            style: TextStyle(
              fontSize: 27,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
        ),
        const Spacer(),
        SizedBox(
          width: SizeConfig.screenWidth * 0.6,
          child: CustomTextButton(
            text: "Back to home",
            onPressed: () {
              Get.off(() => const HomeScreen());
            },
          ),
        ),
        const Spacer(),
      ],
    ));
  }
}

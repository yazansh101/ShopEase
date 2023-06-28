import 'package:flutter/animation.dart';
import 'package:get/get.dart';

class SplashScreenViewModel extends GetxController
    with GetSingleTickerProviderStateMixin {
  double fontSize = 2;
  double containerSize = 1.5;
  double textOpacity = 0.0;
  double containerOpacity = 0.0;

  late AnimationController controller;
  late Animation<double> animation1;

  @override
  void onInit() {
    super.onInit();
    controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 3));
    animation1 = Tween<double>(begin: 40, end: 20).animate(CurvedAnimation(
        parent: controller, curve: Curves.fastLinearToSlowEaseIn))
      ..addListener(() {
        textOpacity = 1.0;
        update();
      });
    controller.forward();
    
    Future.delayed(const Duration(seconds: 2), () {
      fontSize = 1.06;
      update();
    });
    Future.delayed(const Duration(seconds: 2), () {
      containerSize = 2;
      containerOpacity = 1;
      update();
    });
    // Future.delayed(const Duration(seconds: 4), () {
    //   Get.off(() => const HomeScreen());
    // });
  }

  @override
  void onClose() {
    controller.dispose();
    super.onClose();
  }
}

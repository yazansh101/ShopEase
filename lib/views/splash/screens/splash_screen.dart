import 'dart:async';

import 'package:chat_app_max/core/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/utils/size_config.dart';
import '../../home/screens/home_screen.dart';

class SplashScreenView extends StatefulWidget {
  const SplashScreenView({super.key});

  @override
  _SplashScreenViewState createState() => _SplashScreenViewState();
}

class _SplashScreenViewState extends State<SplashScreenView>
    with TickerProviderStateMixin {
  double _fontSize = 2;
  double _containerSize = 1.5;
  double _textOpacity = 0.0;
  double _containerOpacity = 0.0;

  late AnimationController _controller;
  late Animation<double> animation1;
  @override
  void initState() {
    super.initState();

    _controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 3));

    animation1 = Tween<double>(begin: 40, end: 20).animate(CurvedAnimation(
        parent: _controller, curve: Curves.fastLinearToSlowEaseIn))
      ..addListener(() {
        if (mounted) {     
          setState(() {
            _textOpacity = 1.0;
          });
        }
      });

    _controller.forward();
    Future.delayed(const Duration(seconds: 2), () {
      if (mounted) {
        setState(() {
          _fontSize = 1.06;
        });
      }
    });
    Future.delayed(const Duration(seconds: 2), () {
      if (mounted) {
        setState(() {
          _containerSize = 2;
          _containerOpacity = 1;
        });
      }
    });
    Future.delayed(const Duration(seconds: 4), () {
      if (mounted) {
        Get.off(() => const HomeScreen());
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    double width = SizeConfig.screenWidth;
    double height = SizeConfig.screenHeight;

    return Scaffold(
      backgroundColor: primaryColor,
      body: Stack(
        children: [
          Column(
            children: [
              AnimatedContainer(
                  duration: const Duration(milliseconds: 2000),
                  curve: Curves.fastLinearToSlowEaseIn,
                  height: height / _fontSize),
              AnimatedOpacity(
                duration: const Duration(milliseconds: 1000),
                opacity: _textOpacity,
                child: Text(
                  'ShopEase',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: animation1.value,
                  ),
                ),
              ),
            ],
          ),
          Center(
            child: AnimatedOpacity(
              duration: const Duration(milliseconds: 2000),
              curve: Curves.fastLinearToSlowEaseIn,
              opacity: _containerOpacity,
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 2000),
                curve: Curves.fastLinearToSlowEaseIn,
                height: width / _containerSize,
                width: width / _containerSize,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(30),
                ),
                // child: Image.asset('assets/images/file_name.png')
                child: const Text(
                  'YOUR APP\'S LOGO',
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// import 'dart:developer';

// import 'package:flutter/material.dart';
// import 'package:get/get.dart';

// import '../../../core/utils/constants.dart';
// import '../../../core/utils/size_config.dart';
// import '../../../view_models/splash_view_model.dart';

// class SplashScreenView extends StatelessWidget {
//   const SplashScreenView({super.key});
//   @override
//   Widget build(BuildContext context) {
//     SplashScreenViewModel splashScreenViewModel =
//         Get.find<SplashScreenViewModel>();

//     log(splashScreenViewModel.textOpacity.toString());
//     SizeConfig.init(context);
//     double width = SizeConfig.screenWidth;
//     double height = SizeConfig.screenHeight;

//     return Scaffold(
//       backgroundColor: primaryColor,
//       body: Stack(
//         children: [
//           Column(
//             children: [
//               GetBuilder<SplashScreenViewModel>(
//                 builder: (splashScreenViewModel) => AnimatedContainer(
//                     duration: const Duration(milliseconds: 2000),
//                     curve: Curves.fastLinearToSlowEaseIn,
//                     height: height / splashScreenViewModel.fontSize),
//               ),
//               GetBuilder<SplashScreenViewModel>(
//                 builder: (splashScreenViewModel) => AnimatedOpacity(
//                   duration: const Duration(milliseconds: 1000),
//                   opacity: splashScreenViewModel.textOpacity,
//                   child: Text(
//                     'ShopEase',
//                     style: TextStyle(
//                       color: Colors.white,
//                       fontWeight: FontWeight.bold,
//                       fontSize: splashScreenViewModel.animation1.value,
//                     ),
//                   ),
//                 ),
//               ),
//             ],
//           ),
//           Center(
//             child: GetBuilder<SplashScreenViewModel>(
//               builder: (splashScreenViewModel) => AnimatedOpacity(
//                 duration: const Duration(milliseconds: 2000),
//                 curve: Curves.fastLinearToSlowEaseIn,
//                 opacity: splashScreenViewModel.containerOpacity,
//                 child: AnimatedContainer(
//                   duration: const Duration(milliseconds: 2000),
//                   curve: Curves.fastLinearToSlowEaseIn,
//                   height: width / splashScreenViewModel.containerSize,
//                   width: width / splashScreenViewModel.containerSize,
//                   alignment: Alignment.center,
//                   decoration: BoxDecoration(
//                     color: Colors.white,
//                     borderRadius: BorderRadius.circular(30),
//                   ),
//                   // child: Image.asset('assets/images/file_name.png')
//                   child: const Text(
//                     'YOUR APP\'S LOGO',
//                   ),
//                 ),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

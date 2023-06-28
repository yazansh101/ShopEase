
import 'package:flutter/material.dart';

import '../../../core/widgets/custom_text.dart';





class SayWelcome extends StatelessWidget {
  const SayWelcome({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomText(
          text: 'Welcome Back!',
          fontSize: 30,
          color: Colors.black,
          alignment: Alignment.center,
        ),
        const SizedBox(
          height: 5,
        ),
        CustomText(
          text: 'Sign in with your email and password',
          fontSize: 15,
          color: Colors.black,
          alignment: Alignment.center,
        ),
        CustomText(
          text: 'or continue with social media',
          fontSize: 15,
          color: Colors.black,
          alignment: Alignment.center,
        ),
      ],
    );
  }
}

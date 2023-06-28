import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/utils/constants.dart';
import '../screens/sign_up.dart';


class NoAccountText extends StatelessWidget {
  const NoAccountText({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          "Don’t have an account? ",
          style: TextStyle(fontSize: 15),
        ),
        GestureDetector(
         onTap: () =>  Get.offAll(() => SignUpScreen(),
              transition: Transition.rightToLeft),
          child: const Text(
            "Sign Up",
            style: TextStyle(
                fontSize: 18,
                color: primaryColor),
          ),
        ),
      ],
    );
  }
}

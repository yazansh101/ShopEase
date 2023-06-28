import 'package:chat_app_max/core/utils/constants.dart';
import 'package:flutter/material.dart';

import 'custom_text.dart';

class CustomTextButton extends StatelessWidget {
  final String text;
  final Color textColor;
  final Function onPressed;
  final double height;
  final double width;
  final double borderRadius;
  final Color color;


  const CustomTextButton({super.key, 
    required this.text,
    required this.onPressed,
     this.textColor=Colors.white,
     this.width=double.infinity,
     this.height=50,
     this.color=primaryColor,
     this.borderRadius=10,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(borderRadius),
      ),
      child: TextButton(
        onPressed:  () => onPressed(),
        child: CustomText(
          text: text,
          fontSize: 17,
          alignment: Alignment.center,
          color: textColor,
        ),
      ),
    );
  }
}

  
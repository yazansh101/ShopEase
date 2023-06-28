import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  VoidCallback? onPressed;
  Widget? child;
  Color? color;
  Color? borderColor;
  double? elevation;
  AlignmentGeometry? alignment;
  double? borderRadius;
  double? borderWidth;
  double? spaceBetweenBorderAndButton;
  double? width;
  double? height;

  CustomButton({
    super.key,
    this.onPressed,
    this.child,
    this.elevation =0,
    this.alignment = Alignment.center,
    this.color,
    this.borderColor = Colors.green,
    this.borderRadius = 20,
    this.borderWidth = 1,
    this.spaceBetweenBorderAndButton = 0,
    this.height = 5,
    this.width = 5,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
      //  padding: EdgeInsets.all(0),
      padding: const EdgeInsets.symmetric(horizontal: 0),
        fixedSize: const Size(30, 30),
        minimumSize: const Size(5, 5),
        maximumSize: const Size(400, 400),
        side: BorderSide(
          color: borderColor!,
          width: borderWidth!,
          strokeAlign: spaceBetweenBorderAndButton!,
        ),
        backgroundColor: Colors.white,
        elevation: elevation!,
        alignment: alignment,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius!)),
      ),
      onPressed: onPressed,
      child: child,
      autofocus: false,
    );
  }
}

import 'package:flutter/material.dart';

class CustomFavoriteButton extends StatelessWidget {
  CustomFavoriteButton({
    super.key,
    required this.onTap,
    required this.isFavorite,
    this.iconColor = Colors.black,
    this.backgroundColor = Colors.white,
    this.size = 25,
  });

  final bool? isFavorite;
  VoidCallback onTap;
  Color? iconColor;
  Color? backgroundColor;
  double? size;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: InkWell(
        borderRadius: BorderRadius.circular(40),
        onTap: onTap,
        child: isFavorite == true
            ? Icon(
                Icons.favorite_sharp,
                color: iconColor,
                size: size,
              )
            : Icon(
                Icons.favorite_border,
                color: iconColor,
                size: size,
              ),
      ),
    );
  }
}

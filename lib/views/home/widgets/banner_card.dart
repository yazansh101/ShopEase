import 'package:flutter/material.dart';

class BannerCard extends StatelessWidget {
  const BannerCard({
    Key? key,
    required this.cardColor,
    required this.discountTitle,
  }) : super(key: key);

  final Color cardColor;
  final String discountTitle;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 160,
      width: MediaQuery.of(context).size.width - 90,
      margin: const EdgeInsets.only(bottom: 5),
      decoration: BoxDecoration(
        color: cardColor,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Stack(
        children: [
          Positioned(
            top: 50,
            left: 10,
            child: Text(
              discountTitle,
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

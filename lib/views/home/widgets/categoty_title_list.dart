import 'package:flutter/material.dart';

import '../../../core/widgets/custom_text.dart';



Widget CategoryTitleList(
    BuildContext ctx, {
    required int index,
    required int initialSelected,
    required String text,
    VoidCallback? onTap,
    Color selectedTextColor = Colors.white,
    Color unSelectedTextColor = Colors.grey,
    Color lineColor = Colors.red,
    Color unSelectedlineColor = Colors.grey,
  }) {
    // int initialSelected=0;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0),
      child: GestureDetector(
        onTap: onTap,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomText(
              text: text,
              color: initialSelected == index
                  ? selectedTextColor
                  : unSelectedTextColor,
              fontSize: 20,
              fontWeight: initialSelected == index
                  ? FontWeight.bold
                  : FontWeight.normal,
            ),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 8),
              width: 20,
              height: 3,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color:
                    initialSelected == index ? lineColor : unSelectedlineColor,
              ),
            )
          ],
        ),
      ),
    );
  }


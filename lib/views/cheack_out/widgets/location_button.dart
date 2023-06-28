
import 'package:flutter/material.dart';

import '../../../core/widgets/custom_text.dart';



class LocationButton extends StatelessWidget {
  final Icon icon;
  final String text;
  final void Function() onTap;
  const LocationButton({
    super.key,
    required this.icon,
    required this.onTap,
    this.text = '',
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SizedBox(
          height: 20,
          width: 130,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            // crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              icon,
              CustomText(
                text: text,
              )
            ],
          ),
        ),
      ),
    );
  }
}

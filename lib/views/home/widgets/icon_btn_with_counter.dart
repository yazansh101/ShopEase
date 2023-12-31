
import 'package:chat_app_max/core/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../core/utils/size_config.dart';

class IconBtnWithCounter extends StatelessWidget {
  const IconBtnWithCounter({
    Key? key,
    required this.svgSrc,
    required this.numOfitem,
    required this.onTap,
  }) : super(key: key);

  final String svgSrc;
  final int numOfitem;
  final GestureTapCallback onTap;

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    return InkWell(
      onTap: onTap,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            padding: EdgeInsets.all(setHeight(1)),
            height: setHeight(5.6),
            width: setHeight(5.6),
            decoration: BoxDecoration(
              border:  Border.fromBorderSide(BorderSide(color: Colors.black.withOpacity(0.2))),
              borderRadius: BorderRadius.circular(
               10,
              ),
              color: Colors.grey.shade200,
            ), 
            child: SvgPicture.asset(svgSrc),
          ),
          if (numOfitem != 0)
            Positioned(
              top: -4,
              right: 12,
              child: Container(
                height: setHeight(3),
                width: setWidth(3),
                decoration: const BoxDecoration(
                  color:primaryColor,
                  shape: BoxShape.circle,
                ),
                child: Center(
                  child: Text(
                    "$numOfitem",
                    style: const TextStyle(
                      fontSize:8,
                      height: 1,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            )
        ],
      ),
    );
  }
}

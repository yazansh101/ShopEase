
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../core/utils/constants.dart';

class RoundedNavigationBar extends StatefulWidget {
  final int currentIndex;
  final Function(int) onTap;

  const RoundedNavigationBar({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  @override
  RoundedNavigationBarState createState() => RoundedNavigationBarState();
}

class RoundedNavigationBarState extends State<RoundedNavigationBar> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
      height: size.height * size.height * .00009,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(.15),
            blurRadius: 30,
            offset: const Offset(0, 10),
          ),
        ],
        borderRadius: BorderRadius.circular(50),
      ),
      child: Center(
        child: ListView.separated(
          separatorBuilder: (context, index) =>  SizedBox(
            width: size.width*0.01,
          ),
          itemCount: listOfIcons.length,
          scrollDirection: Axis.horizontal,
          padding: const EdgeInsets.symmetric(horizontal: 5),
          itemBuilder: (context, index) => InkWell(
            onTap: () => widget.onTap(index),
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AnimatedContainer(
                  duration: const Duration(milliseconds: 1500),
                  curve: Curves.fastLinearToSlowEaseIn,
                  margin: EdgeInsets.only(
                    bottom:
                        index == widget.currentIndex ? 0 : size.width * .029,
                    right: size.width * .0422,
                    left: size.width * .0422,
                  ),
                  width: size.width * .128,
                  height: index == widget.currentIndex ? size.width * .015 : 0,
                  decoration: const BoxDecoration(
                    color: primaryColor,
                    borderRadius: BorderRadius.vertical(
                      bottom: Radius.circular(10),
                    ),
                  ),
                ),

                SvgPicture.asset(
                  listOfIcons[index],
                  color: index == widget.currentIndex
                      ? primaryColor
                      : Colors.black38,
                  height: size.width * .05,
                ),
                // Icon(
                //   listOfIcons[index],
                //   size: size.width * .065,
                //   color: index ==
                //          widget.currentIndex
                //       ? primaryColor
                //       : Colors.black38,
                // ),
                SizedBox(height: size.width * .03),
              ],
            ),
          ),
        ),
      ),
    );
  }

  List<String> listOfIcons = [
    'assets/icons/Shop Icon.svg',
    'assets/icons/Search Icon.svg',
    'assets/icons/Heart Icon_2.svg',
    'assets/icons/User.svg',

  ];
}

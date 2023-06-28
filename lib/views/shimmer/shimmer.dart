import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerWidget extends StatelessWidget {
  final double width;
  final double height;
   final ShapeBorder shapeBorder;

   ShimmerWidget.rectangular({super.key, 
    this.width = double.infinity, 
    this.shapeBorder= const RoundedRectangleBorder(),
    required this.height,

  });

     ShimmerWidget.circular({super.key, 
    required this.width, 
    required this.height,
    this.shapeBorder=const CircleBorder()
  });

  @override
  Widget build(BuildContext context) {
    return  Shimmer.fromColors(
      period: const Duration(seconds: 2),
      baseColor: Colors.grey[400]!, 
      highlightColor:Colors.grey[300]! ,
      child: Container(
        height: height,
        width: width,
        decoration: ShapeDecoration(
          shape: shapeBorder,
        color: Colors.grey,
        ),
      ),
    );  
  }
}

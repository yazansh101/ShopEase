import 'package:flutter/material.dart';




class SizeConfig {
  static late MediaQueryData mediaQueryData;
  static late double screenWidth;
  static late double screenHeight;
  static double? defaultSize;
  static Orientation? orientation;

  static void init(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    screenWidth = mediaQueryData.size.width;
    screenHeight = mediaQueryData.size.height;
    orientation = mediaQueryData.orientation;
  }

}
 SizedBox setVerticalSpace(height){
    return SizedBox(height:SizeConfig.screenHeight*height/100,);
  }

 double setHeight(height){
    return SizeConfig.screenHeight*height/100;
  }
  
 double setWidth(width){
    return SizeConfig.screenWidth*width/100;
  }
  SizedBox setHorizentalSpace(width){
    return SizedBox(width:SizeConfig.screenWidth*width/100,);
  }

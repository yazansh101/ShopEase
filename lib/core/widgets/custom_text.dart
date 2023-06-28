import 'package:chat_app_max/core/utils/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomText extends StatelessWidget {
  final String text;
  final Color color;
  final double fontSize;
  final FontWeight fontWeight;
  final Alignment alignment;
  final int? maxLines;
  final TextOverflow? textOverflow;
  final double? heightBetweenLines;
  TextAlign? textAlign;
  
    CustomText({super.key, 

      required this.text,
      this.fontSize=12,
      this.color=textColor,
      this.fontWeight=FontWeight.normal,
      this.alignment=Alignment.centerLeft,
      this.textAlign=TextAlign.left,
      this.maxLines,
      this.textOverflow,
      this.heightBetweenLines,

      

  });

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment:alignment,
      child: Text(
        
     text,
     textDirection: TextDirection.ltr,
     textAlign: textAlign,
        style:GoogleFonts.poppins(
          color:color,
          fontSize: fontSize,
          fontWeight: fontWeight,
          height: heightBetweenLines,
        
        ),
      maxLines: maxLines,
      overflow: textOverflow,
      ),
    );
  }
}

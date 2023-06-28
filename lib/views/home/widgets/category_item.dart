// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

import '../../../core/widgets/custom_text.dart';



class CategoryItem extends StatelessWidget {
   final String categoryTitle;
   final String categoryIcon;
   void Function()? onTap;


   CategoryItem({super.key, 

    required this.categoryTitle,
    required this.categoryIcon,
    required this.onTap,
    });

   
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        children: [
          InkWell(
            onTap:onTap,
            child: Container(
              padding: EdgeInsets.all(10),
              margin:  EdgeInsets.symmetric(horizontal:8),
             height: 60,
             width: 60,
              decoration: BoxDecoration(
              color: Colors.grey,
                borderRadius: BorderRadius.circular(10),
            
              ),
               child: 
               Image.asset(
              categoryIcon,
              fit: BoxFit.fill,
              color: Colors.white,
              ),
             
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          CustomText(
            text: 
           categoryTitle,
            fontSize: 13,
          )
        ],
      ),
    );
  }
}

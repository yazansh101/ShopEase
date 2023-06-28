import 'dart:convert';

import 'package:chat_app_max/core/utils/constants.dart';
import 'package:chat_app_max/views/cart/screens/view_cart_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class CategoryRepository {
  final apiUrl = Uri.parse('https://fakestoreapi.com/products/categories');
  Future<List> fetchCategories() async {
    try {
      final response = await http.get(apiUrl);
      final categoriesJson = json.decode(response.body);
      return categoriesJson;
    } catch (e) {
 Get.dialog(
        AlertDialog(
          title: const Text('Error'),
          content: const Text('Check your internet connection and try again'),
          actions: [
            MaterialButton(
              child: const Text('Try Again',style: TextStyle( color: primaryColor,)),
              onPressed: ()  {
              Get.to(()=>  CartScreen(),);
             
              },
            ),
            MaterialButton(
              child: const Text('OK'),
              onPressed: () {
                Get.back();
              },
            ),
          ],
        ),
      );
         rethrow;
    }
  }
}

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../models/product_model.dart';

class ProductRepository{

 final  apiUrl = Uri.parse('https://fakestoreapi.com/products');
  Future<List<Product>> fetchProducts() async {
try{
    final response = await http.get(apiUrl);
 final List<dynamic> productsJson = json.decode(response.body);
      return productsJson
          .map((json) => Product.fromJson(json))
          .toList();
}
catch(e){
 Get.dialog(
        AlertDialog(
          title: const Text('Error'),
          content: const Text('Failed to load Categories'),
          actions: [
            MaterialButton(
              child: const Text('Try Again'),
              onPressed: () async {
                Get.back();
               
              },
            ),
            MaterialButton(
              child: const Text('OK'),
              onPressed: () {
                Get.back(); // close the dialog
              },
            ),
          ],
        ),
      );
         rethrow;

  
  }

  
  }}
 import 'package:hive_flutter/hive_flutter.dart';

part  'product_model.g.dart';

@HiveType(typeId: 2)

class Product {
   @HiveField(0)
  late final int id;
   @HiveField(1)

  late final String title;
   @HiveField(2)

  late final double price;
   @HiveField(3)

  late final String category;
   @HiveField(4)

  late final String description;
   @HiveField(5)

  late final String image;
   @HiveField(6)

  bool isFavorite;
   @HiveField(7)

  late final Map<dynamic, dynamic> rating;

  Product({
    required this.id,
    required this.title,
    required this.price,
    required this.category,
    required this.description,
    required this.image,
    required this.rating,
    this.isFavorite=false
  });
  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
        id: json['id'],
        title: json['title'],
        price: double.parse(json['price'].toString()),
        category: json['category'],
        description: json['description'],
        image: json['image'],
        rating: {
          "rate": json['rating']['rate'],
          "count": json['rating']['count'],
        });
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    data['price'] = price;
    data['category'] = category;
    data['description'] = description;
    data['image'] = image;
    data['isFavorite'] = isFavorite;
    data['rating'] = rating;
    return data;
  }
}

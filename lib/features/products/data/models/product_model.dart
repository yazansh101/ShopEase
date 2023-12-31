import 'package:chat_app_max/features/products/domain/entities/product.dart';

class ProductModel extends Product {
  ProductModel({
    required id,
    required title,
    required price,
    required category,
    required description,
    required image,
    required rating,
  }) : super(
            id: id,
            title: title,
            category: category,
            description: description,
            image: image,
            price: price,
            rating: rating);
  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
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

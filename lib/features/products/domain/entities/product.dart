import 'package:equatable/equatable.dart';

class Product extends Equatable {
  late final int id;

  late final String title;

  late final double price;

  late final String category;

  late final String description;

  late final String image;

  bool isFavorite;
  late final Map<dynamic, dynamic> rating;

  Product(
      {required this.id,
      required this.title,
      required this.price,
      required this.category,
      required this.description,
      required this.image,
      required this.rating,
      this.isFavorite = false});

  @override
   List<Object?> get props => [
        id,
        title,
        price,
        category,
        description,
        image,
        rating,
      ];
}

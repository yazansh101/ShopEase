import 'package:hive_flutter/hive_flutter.dart';

import 'product_model.dart';

part 'cart_item.g.dart';

@HiveType(typeId: 1)
class CartItem {
   @HiveField(0)
  final Product product;
   @HiveField(1)
  final int quantity;

  CartItem({
    required this.product,
    required this.quantity,
  });
}
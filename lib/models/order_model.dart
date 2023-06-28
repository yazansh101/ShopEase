


import 'package:hive_flutter/hive_flutter.dart';

import 'cart_model.dart';

part 'order_model.g.dart';

@HiveType(typeId: 0)
class Order {
 @HiveField(0)
  final String id;
 @HiveField(1)

  final double amount;
 @HiveField(2)

  final List<CartItem> products;
 @HiveField(3)

  final DateTime dateTime;

  Order({
    required this.id,
    required this.amount,
    required this.products,
    required this.dateTime,
  });
}
// ignore_for_file: use_rethrow_when_possible

import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../../models/cart_model.dart';
import '../../models/order_model.dart';



class OrderViewModel extends GetxController {
  var orders = <Order>[];
  var isLoading = true;

   String?  authToken;
   String? userId;


@override
  void onInit() {
   // fetchOrders();
    super.onInit();
  }
  //Orders( requiredthis._authToken,this._orders,this.userId){}
 

  Future<void> addOrder(List<CartItem> cartProducts, double total) async {
    isLoading=true;
  Order newOrder= Order(
          id: DateTime.now().toString(),
          amount: total,
          dateTime: DateTime.now(),
          products: cartProducts,
        );
    try {
      orders.insert(
        0,
      newOrder
      );
      isLoading=false;
      Hive.box('orders').add(newOrder);
    } catch (error) {
      isLoading=false;
      throw error;
    }
  }

  // Future<void> fetchOrders() async {
  //   isLoading(true);

  //   final url = Uri.parse(
  //       'https://flutter-1011-default-rtdb.firebaseio.com/orders.json?auth=$authToken&orderBy="creatorId"&equalTo="$userId"');
  //   final List<Order> fetchedOrders = [];

  //   try {
  //     final response = await http.get(url);

  //     final extractedOrders =
  //         json.decode(response.body) as Map<String, dynamic>?;

  //     if (extractedOrders == null) {
  //       return;
  //     }

  //     extractedOrders.forEach((orderId, orderData) {
  //       fetchedOrders.add(
  //         Order(
  //           id: orderId,
  //           amount: orderData['amount'],
  //           dateTime: DateTime.parse(orderData['dateTime']),
  //           products: (orderData['products'] as List<dynamic>)
  //               .map((e) => CartItem(
  //                     id: e['id'],
  //                     title: e['title'],
  //                     quantity: e['quantity'],
  //                     price: e['price'],
  //                   ))
  //               .toList(),
  //         ),
  //       );
  //     });
  //     orders.assignAll(fetchedOrders);
  //     isLoading(false);
  //   } catch (error) {
  //     isLoading(false);
  //     throw error;
  //   }
  // }

}

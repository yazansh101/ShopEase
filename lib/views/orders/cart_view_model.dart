import 'dart:developer';

import 'package:get/get.dart';

import '../../models/cart_model.dart';
import '../../models/product_model.dart';

class CartViewModel extends GetxController {
  final RxMap _items = <String, CartItem>{}.obs;
  
  Map<String, CartItem> get items => Map<String, CartItem>.from(_items);

  int get itemCount => _items.length;

  getQuantity(cartItemId){

  }

  RxDouble  get totalAmount {
  final RxDouble totalAmount=0.0.obs;

    _items.forEach((key, cart) {
      totalAmount.value += cart.product.price * cart.quantity;
    });
    return totalAmount;
  }

  void addItemToCart(Product product) {
    if (_items.containsKey(product.id.toString())) {
      // change quantity...
      _items.update(
        product.id.toString(),
        (existingCartItem) => CartItem(
          product: existingCartItem.product,
          quantity: existingCartItem.quantity + 1,
        ),
      );
      log('containsKey');
    } else {
      _items.putIfAbsent(
        product.id.toString(),
        () => CartItem(
        product:product ,
        quantity: 1,
        ),
      );
      log('ifAbsent');

    }
        update();

  }

  void removeItem(String productId) {
    _items.remove(productId);
           update();

  }

  void removeSingleItem(String productId) {
    if (!_items.containsKey(productId)) {
      return;
    }
    if (_items[productId]!.quantity > 1) {
      _items.update(
          productId,
          (existingCartItem) => CartItem(
               product:existingCartItem.product ,
                quantity: existingCartItem.quantity - 1,
              ));
      log('update');

        update();

    } else {
      _items.remove(productId);
      log('remove');
      update();
    }
  }

  void clear() {
    _items.clear();
    totalAmount.value=0;

  }
}

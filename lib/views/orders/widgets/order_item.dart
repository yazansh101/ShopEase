import 'dart:math';

import 'package:chat_app_max/core/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../models/order_model.dart';


class OrderDetails extends StatefulWidget {
  final Order order;

  const OrderDetails(this.order, {super.key});

  @override
  _OrderDetailsState createState() => _OrderDetailsState();
}

class _OrderDetailsState extends State<OrderDetails> {
  var _expanded = false;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(10),
      child: Column(
        children: <Widget>[
          ListTile(
            title: Text('\$${widget.order.amount}'),
            subtitle: Text(
              DateFormat('dd/MM/yyyy hh:mm').format(widget.order.dateTime),
            ),
            trailing: IconButton(
              icon: Icon(_expanded ? Icons.expand_less : Icons.expand_more),
              color: primaryColor,
              onPressed: () {
                setState(() {
                  _expanded = !_expanded;
                  
                });
              },
            ),
          ),
          if (_expanded)
            AnimatedContainer(
                           duration: const Duration(milliseconds: 300),
             curve: Curves.easeInCirc,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 4),
                height: min(widget.order.products.length * 20.0 + 10, 100),
                child: ListView(
                  children: widget.order.products
                      .map(
                        (cartItem) => Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                const Text(
                                  'cartItem.product.title,',
                                  style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  '${cartItem.quantity}x \$${ cartItem.product.price}',
                                  style: const TextStyle(
                                    fontSize: 14,
                                    color: primaryColor,
                                  ),
                                )
                              ],
                            ),
                      )
                      .toList(),
                ),
              ),
            )
        ],
      ),
    );
  }
}

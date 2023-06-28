import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_paypal_checkout/flutter_paypal_checkout.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

import '../../../core/utils/constants.dart';
import '../../../core/widgets/custom_text.dart';
import '../../../view_models/location_view_model.dart';
import '../../orders/cart_view_model.dart';

class MySummary extends StatelessWidget {
  MySummary({super.key});
  final cartViewModel = Get.find<CartViewModel>();
  final locationViewModel = Get.find<LocationViewModel>();

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ..._buildProductsSummry(),
        const Divider(),
        ..._buildAddressSummry(),
        const Divider(),
        ..._buildPaymentMethod(context),
        const Divider(),
      ],
    );
  }

 _buildProductsSummry() {
    return <Widget>[
      CustomText(
        text: "Your Products",
        fontSize: 18,
      ),
      const SizedBox(
        height: 20,
      ),
      SizedBox(
        height: 120,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: cartViewModel.items.length,
          itemBuilder: (context, index) => Container(
            padding: const EdgeInsets.only(
              top: 0,
              bottom: 8,
              left: 0,
              right: 12,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.15,
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      border: Border.all(
                        color: Colors.grey,
                        width: 1,
                      ),
                    ),
                    child: FadeInImage(
                      placeholder: const AssetImage(
                          'assets/images/product-placeholder.png'),
                      image: NetworkImage(
                        cartViewModel.items.values
                            .toList()[index]
                            .product
                            .image,
                      ),
                      // fit: BoxFit.cover,
                    ),
                  ),
                ),
                // const SizedBox(
                //   height: 5,
                //),
                // CustomText(
                //   text: cartViewModel.items.values
                //               .toList()[index]
                //               .product
                //               .title
                //               .length >
                //           20
                //       ? '${cartViewModel.items.values.toList()[index].product.title.substring(0, 20)}.'
                //       : cartViewModel.items.values
                //           .toList()[index]
                //           .product
                //           .title,
                //   fontSize: 15,
                //   fontWeight: FontWeight.bold,
                //   maxLines: 1,
                // ),
                // const SizedBox(
                //   height: 5,
                // ),
                // CustomText(
                //   text:
                //       "\$${cartViewModel.items.values.toList()[index].product.price}",
                //   fontSize: 15,
                //   fontWeight: FontWeight.bold,
                //   color: primaryColor,
                // ),
                const SizedBox(
                  height: 5,
                ),
                const Divider(),
              ],
            ),
          ),
        ),
      ),
    ];
  }

  _buildAddressSummry() {
    return [
      CustomText(
        text: "Your Address",
        fontSize: 15,
        fontWeight: FontWeight.bold,
      ),
      const SizedBox(
        height: 5,
      ),
      CustomText(
        text: "${locationViewModel.address}",
        fontSize: 15,
        fontWeight: FontWeight.bold,
        color: primaryColor,
      ),
    ];
  }

  _buildPaymentMethod(context) {
    return [
CustomText(
          text: "Payment Method",
          fontSize: 15,
          fontWeight: FontWeight.bold,
        ),
        const SizedBox(height: 8),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Icon(
              FontAwesomeIcons.paypal,
              color: Colors.grey,
            ),
            IconButton(
              icon: const Icon(
                FontAwesomeIcons.amazonPay,
              ),
              onPressed: () {
                pay(context);
              },
              color: Colors.grey,
            ),
          ],
        ),
    ];
  }
 
  void pay(context) {
    Navigator.of(context).push(MaterialPageRoute(
      builder: (BuildContext context) => PaypalCheckout(
        sandboxMode: true,
        clientId:
            "ASSEfO0PUK4VakLiw3xdAO8tTRNFcDqbJTwRu5dXnRhhluRkb7bIpMoCeV_PLRn2auuFzvEAT7CFQ5YA",
        secretKey:
            "ELb4ZCrlOJDOKv5yYvJ9JXr3w2f1Ke7_4GudgeGAm7R9HchOdhziJ1JOOzXUDYkMOlpFQ6QkcIlvGTDS",
        returnURL: "success.snippetcoder.com",
        cancelURL: "cancel.snippetcoder.com",
        transactions: const [
          {
            "amount": {
              "total": '70',
              "currency": "USD",
              "details": {
                "subtotal": '70',
                "shipping": '0',
                "shipping_discount": 0
              }
            },
            "description": "The payment transaction description.",
            // "payment_options": {
            //   "allowed_payment_method":
            //       "INSTANT_FUNDING_SOURCE"
            // },
            "item_list": {
              "items": [
                {
                  "name": "Apple",
                  "quantity": 4,
                  "price": '5',
                  "currency": "USD"
                },
                {
                  "name": "Pineapple",
                  "quantity": 5,
                  "price": '10',
                  "currency": "USD"
                }
              ],

              // shipping address is not required though
              //   "shipping_address": {
              //     "recipient_name": "Raman Singh",
              //     "line1": "Delhi",
              //     "line2": "",
              //     "city": "Delhi",
              //     "country_code": "IN",
              //     "postal_code": "11001",
              //     "phone": "+00000000",
              //     "state": "Texas"
              //  },
            }
          }
        ],
        note: "Contact us for any questions on your order.",
        onSuccess: (Map params) async {
          log("onSuccess: $params");
        },
        onError: (error) {
          log("onError: $error");
          Navigator.pop(context);
        },
        onCancel: () {
          log('cancelled:');
        },
      ),
    ));
  }
}

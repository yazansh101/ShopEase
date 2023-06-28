import 'package:chat_app_max/core/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:hive_flutter/adapters.dart';

import '../../../models/order_model.dart';
import '../widgets/order_item.dart';

class OrdersScreen extends StatelessWidget {
  OrdersScreen({super.key});

  var isInit = true;

  @override
  Widget build(BuildContext context) {
    //final orderViewModel=Get.find<OrderViewModel>();

    return Scaffold(
      appBar: AppBar(
        title: CustomText(
          text: 'Orders',
          color: Colors.black,
          fontSize: 16,
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: FutureBuilder(
          future: Hive.openBox('orders'),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const CircularProgressIndicator();
            } else if (!snapshot.hasData) {
              return Center(
                  child: CustomText(
                text: 'No Orders yet',
              ));
            } else if (snapshot.hasError) {
              return Center(
                  child: CustomText(
                text: snapshot.error.toString(),
              ));
            } else {
              final ordersBox = Hive.box('orders');

              return AnimationLimiter(
                child: ListView.builder(
                  scrollDirection: Axis.vertical,
                  itemCount: ordersBox.length,
                  itemBuilder: (BuildContext context, int index) {
                    final order = ordersBox.get(index) as Order;
                    return AnimationConfiguration.staggeredList(
                        position: index,
                        duration: const Duration(milliseconds: 375),
                        child: SlideAnimation(
                          verticalOffset: 50.0,
                          child: FadeInAnimation(child: OrderDetails(order)),
                        ));
                  },
                ),
              );

              //      ListView.builder(

              //   itemCount: ordersBox.length,
              //   itemBuilder: (ctx, i) {
              //   final order =ordersBox.get(i) as Order;

              //    return  OrderDetails(order);
              //   }
              // )
            }
          }),
    );
  }
}

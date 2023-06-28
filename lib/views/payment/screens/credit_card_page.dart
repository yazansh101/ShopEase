// import 'dart:developer';

// import 'package:chat_app_max/views/payment/widgets/uidata.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_masked_text/flutter_masked_text.dart';
// import 'package:flutter_paypal_checkout/flutter_paypal_checkout.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';

// import '../logic/credit_card_bloc.dart';
// import '../widgets/credit_card_entries.dart';
// import '../widgets/profile_tile.dart';

// class CreditCardPage extends StatelessWidget {
//   BuildContext? _context;
//   CreditCardBloc? cardBloc;
//   MaskedTextController ccMask =
//       MaskedTextController(mask: "0000 0000 0000 0000");
//   MaskedTextController expMask = MaskedTextController(mask: "00/00");

//   CreditCardPage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     _context = context;
//     cardBloc = CreditCardBloc();
//     return Scaffold(
//       resizeToAvoidBottomInset: true,
//       appBar: AppBar(
//         centerTitle: false,
//         title: const Text("Credit Card"),
//       ),
//       body: _buildBody(),
//       floatingActionButton: _buildFloatingBar(context),
//       floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
//     );
//   }

//   Widget _buildBody() => SingleChildScrollView(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.start,
//           children: [
//             creditCardWidget(),
//             fillEntries(),
//           ],
//         ),
//       );


//   Widget creditCardWidget() {
//     var deviceSize = MediaQuery.of(_context!).size;
//     return Container(
//       height: deviceSize.height * 0.3,
//       color: Colors.grey.shade300,
//       child: Padding(
//         padding: const EdgeInsets.all(8.0),
//         child: Card(
//           clipBehavior: Clip.antiAlias,
//           elevation: 3.0,
//           child: Stack(
//             fit: StackFit.expand,
//             children: <Widget>[
//               Container(
//                 decoration: BoxDecoration(
//                     gradient: LinearGradient(colors: UIData.kitGradients)),
//               ),
//               Opacity(
//                 opacity: 0.1,
//                 child: Image.asset(
//                   "assets/images/map.png",
//                   fit: BoxFit.cover,
//                 ),
//               ),
//               MediaQuery.of(_context!).orientation == Orientation.portrait
//                   ? cardEntries()
//                   : FittedBox(
//                       child: cardEntries(),
//                     ),
//               const Positioned(
//                 right: 10.0,
//                 top: 10.0,
//                 child: Icon(
//                   FontAwesomeIcons.paypal,
//                   size: 30.0,
//                   color: Colors.white,
//                 ),
//               ),
//               Positioned(
//                 right: 10.0,
//                 bottom: 10.0,
//                 child: StreamBuilder<String>(
//                   stream: cardBloc!.nameOutputStream,
//                   initialData: "Your Name",
//                   builder: (context, snapshot) => Text(
//                     snapshot.data!.isNotEmpty ? snapshot.data! : "Your Name",
//                     style: const TextStyle(
//                         color: Colors.white,
//                         fontFamily: UIData.ralewayFont,
//                         fontSize: 20.0),
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   Widget cardEntries() => Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.spaceAround,
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: <Widget>[

//             StreamBuilder<String>(
//                 stream: cardBloc!.ccOutputStream,
//                 initialData: "**** **** **** ****",
//                 builder: (context, snapshot) {
//                   if (snapshot.data!.isEmpty) {
//                     return const Text(
//                       '**** **** **** ****',
//                       style: TextStyle(color: Colors.white, fontSize: 22.0),
//                     );
//                   } else {
//                     ccMask.updateText(snapshot.data);

//                     return Text(
//                       snapshot.data.toString(),
//                       style:
//                           const TextStyle(color: Colors.white, fontSize: 22.0),
//                     );
//                   }
//                 }),

//             Row(
//               mainAxisAlignment: MainAxisAlignment.start,
//               children: <Widget>[
//                 StreamBuilder<String>(
//                     stream: cardBloc!.expOutputStream,
//                     initialData: "MM/YY",
//                     builder: (context, snapshot) {
//                       snapshot.data!.isNotEmpty
//                           ? expMask.updateText(snapshot.data)
//                           : null;
//                       return ProfileTile(
//                         textColor: Colors.white,
//                         title: "Expiry",
//                         subtitle:
//                             snapshot.data!.isNotEmpty ? snapshot.data : "MM/YY",
//                       );
//                     }),
//                 const SizedBox(
//                   width: 30.0,
//                 ),
//                 StreamBuilder<String>(
//                     stream: cardBloc!.cvvOutputStream,
//                     initialData: "***",
//                     builder: (context, snapshot) => ProfileTile(
//                           textColor: Colors.white,
//                           title: "CVV",
//                           subtitle:
//                               snapshot.data!.isNotEmpty ? snapshot.data : "***",
//                         )),
//               ],
//             ),
//           ],
//         ),
//       );

//   Widget fillEntries() => Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: CreditCardEntries(ccMask: ccMask, cardBloc: cardBloc, expMask: expMask),
//       );

//   Widget _buildFloatingBar(context) => Ink(
//         decoration: ShapeDecoration(
//             shape: const StadiumBorder(),
//             gradient: LinearGradient(colors: UIData.kitGradients)),
//         child: FloatingActionButton.extended(
//         onPressed: () async {
//             Navigator.of(context).push(MaterialPageRoute(
//               builder: (BuildContext context) => PaypalCheckout(
//                 sandboxMode: true,
//                 clientId: "ASSEfO0PUK4VakLiw3xdAO8tTRNFcDqbJTwRu5dXnRhhluRkb7bIpMoCeV_PLRn2auuFzvEAT7CFQ5YA",
//                 secretKey: "ELb4ZCrlOJDOKv5yYvJ9JXr3w2f1Ke7_4GudgeGAm7R9HchOdhziJ1JOOzXUDYkMOlpFQ6QkcIlvGTDS",
//                 returnURL: "success.snippetcoder.com",
//                 cancelURL: "cancel.snippetcoder.com",
//                 transactions: const [
//                   {
//                     "amount": {
//                       "total": '70',
//                       "currency": "USD",
//                       "details": {
//                         "subtotal": '70',
//                         "shipping": '0',
//                         "shipping_discount": 0
//                       }
//                     },
//                     "description": "The payment transaction description.",
//                     // "payment_options": {
//                     //   "allowed_payment_method":
//                     //       "INSTANT_FUNDING_SOURCE"
//                     // },
//                     "item_list": {
//                       "items": [
//                         {
//                           "name": "Apple",
//                           "quantity": 4,
//                           "price": '5',
//                           "currency": "USD"
//                         },
//                         {
//                           "name": "Pineapple",
//                           "quantity": 5,
//                           "price": '10',
//                           "currency": "USD"
//                         }
//                       ],

//                       // shipping address is not required though
//                       //   "shipping_address": {
//                       //     "recipient_name": "Raman Singh",
//                       //     "line1": "Delhi",
//                       //     "line2": "",
//                       //     "city": "Delhi",
//                       //     "country_code": "IN",
//                       //     "postal_code": "11001",
//                       //     "phone": "+00000000",
//                       //     "state": "Texas"
//                       //  },
//                     }
//                   }
//                 ],
//                 note: "Contact us for any questions on your order.",
//                 onSuccess: (Map params) async {
//                   log("onSuccess: $params");
//                 },
//                 onError: (error) {
//                   log("onError: $error");
//                   Navigator.pop(context);
//                 },
//                 onCancel: () {
//                   log('cancelled:');
//                 },
//               ),
//             ));
//           },
//           backgroundColor: Colors.transparent,
//           icon: const Icon(
//             FontAwesomeIcons.amazonPay,
//             color: Colors.white,
//           ),
//           label: const Text(
//             "Continue",
//             style: TextStyle(color: Colors.white),
//           ),
//         ),
//       );
// }

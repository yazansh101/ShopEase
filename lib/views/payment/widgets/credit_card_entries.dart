
// import 'package:chat_app_max/views/payment/widgets/uidata.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_masked_text/flutter_masked_text.dart';

// import '../logic/credit_card_bloc.dart';

// class CreditCardEntries extends StatelessWidget {
//   const CreditCardEntries({
//     super.key,
//     required this.ccMask,
//     required this.cardBloc,
//     required this.expMask,
//   });

//   final MaskedTextController ccMask;
//   final CreditCardBloc? cardBloc;
//   final MaskedTextController expMask;

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       mainAxisSize: MainAxisSize.min,
//       children: <Widget>[
//         TextFormField(
//           controller: ccMask,
//           keyboardType: TextInputType.number,
//           maxLength: 19,
//           style: const TextStyle(
//               fontFamily: UIData.ralewayFont, color: Colors.black),
//           onChanged: (out) => cardBloc!.ccInputSink.add(ccMask.text),
//           decoration: const InputDecoration(
//               labelText: "Credit Card Number",
//               labelStyle: TextStyle(fontWeight: FontWeight.bold),
//               border: OutlineInputBorder()),
//         ),
//         TextFormField(
//           controller: expMask,
//           keyboardType: TextInputType.number,
//           maxLength: 5,
//           style: const TextStyle(
//               fontFamily: UIData.ralewayFont, color: Colors.black),
//           onChanged: (out) => cardBloc!.expInputSink.add(expMask.text),
//           decoration: const InputDecoration(
//               labelStyle: TextStyle(
//                 fontWeight: FontWeight.bold,
//               ),
//               labelText: "MM/YY",
//               border: OutlineInputBorder()),
//         ),
//         TextFormField(
//           keyboardType: TextInputType.number,
//           maxLength: 3,
//           style: const TextStyle(
//               fontFamily: UIData.ralewayFont, color: Colors.black),
//           onChanged: (out) => cardBloc!.cvvInputSink.add(out),
//           decoration: const InputDecoration(
//               labelStyle: TextStyle(fontWeight: FontWeight.bold),
//               labelText: "CVV",
//               border: OutlineInputBorder()),
//         ),
//         TextFormField(
//           keyboardType: TextInputType.text,
//           maxLength: 20,
//           style: const TextStyle(
//               fontFamily: UIData.ralewayFont, color: Colors.black),
//           onChanged: (out) => cardBloc!.nameInputSink.add(out),
//           decoration: const InputDecoration(
//               labelStyle: TextStyle(
//                 fontWeight: FontWeight.bold,
//               ),
//               labelText: "Name on card",
//               border: OutlineInputBorder()),
//         ),
//       ],
//     );
//   }
// }

// import 'dart:async';

// import 'package:flutter/material.dart';

// import '../../../core/utils/constants.dart';
// import '../widgets/common_scaffold.dart';
// import '../widgets/summry_payment_info.dart';

// class PaymentSuccessPage extends StatefulWidget {
//   const PaymentSuccessPage({super.key});

//   @override
//   PaymentSuccessPageState createState() {
//     return PaymentSuccessPageState();
//   }
// }

// class PaymentSuccessPageState extends State<PaymentSuccessPage> {
//   bool isDataAvailable = true;


//   @override
//   Widget build(BuildContext context) {
//     return CommonScaffold(
//       appTitle: "Payment Success",
//       actionFirstIcon: null,
//       bodyData: bodyData(),
//     );
//   }
//     Widget bodyData() => Center(
//         child: isDataAvailable
//             ? MaterialButton(
//                 shape: const StadiumBorder(),
//                 onPressed: () => showSuccessDialog(),
//                 color: primaryColor,
//                 child: const Text("Process Payment"),
//               )
//             : const CircularProgressIndicator(),
//       );

//   void showSuccessDialog() {
//     setState(() {
//       isDataAvailable = false;
//       Future.delayed(const Duration(seconds: 3)).then((_) => goToDialog());
//     });
//   }

//   goToDialog() {
//     setState(() {
//       isDataAvailable = true;
//     });
//     showDialog(
//         context: context,
//         barrierDismissible: true,
//         builder: (context) => Center(
//               child: SingleChildScrollView(
//                 child: Column(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: <Widget>[
//                     successTicket(),
//                     const SizedBox(
//                       height: 10.0,
//                     ),
//                     FloatingActionButton(
//                       backgroundColor: Colors.black,
//                       child: const Icon(
//                         Icons.clear,
//                         color: Colors.white,
//                       ),
//                       onPressed: () {
//                         Navigator.pop(context);
//                       },
//                     )
//                   ],
//                 ),
//               ),
//             ));
//   }

//   successTicket() => const SummaryPaymentInfo();
// }



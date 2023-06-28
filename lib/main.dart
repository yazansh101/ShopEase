import 'package:chat_app_max/models/cart_model.dart';
import 'package:chat_app_max/views/splash/screens/splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:path_provider/path_provider.dart' as path_provider;

import 'core/helper/bindings.dart';
import 'core/services/firebase_options.dart';
import 'core/utils/theme.dart';
import 'models/order_model.dart';
import 'models/product_model.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  initHiveDataBase();
  runApp(const MyApp());
}

initHiveDataBase() async {
  var appDocumentDirectory =
      await path_provider.getApplicationDocumentsDirectory();

  Hive
    ..init(appDocumentDirectory.path)
    ..registerAdapter(OrderAdapter());
  Hive.registerAdapter(CartItemAdapter());
  Hive.registerAdapter(ProductAdapter());
  Hive.openBox('orders');
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.white,
      statusBarIconBrightness: Brightness.dark,
      statusBarBrightness: Brightness.light,
    ));
    return GetMaterialApp(
      initialBinding: Binding(),
      theme: theme(),
      home: const SplashScreenView(),
      debugShowCheckedModeBanner: false,
    );
  }
}

import 'package:chat_app_max/core/utils/constants.dart';
import 'package:flutter/material.dart';

ThemeData theme() {
  return ThemeData(
    // appBarTheme: AppBarTheme(
    //   elevation: 0
    // ),
    primarySwatch: Colors.grey,
    scaffoldBackgroundColor: Colors.white,
    fontFamily: "Muli",
    // appBarTheme: appBarTheme(),
    // textTheme: textTheme(),
    inputDecorationTheme: inputDecorationTheme(),
    // visualDensity: VisualDensity.adaptivePlatformDensity,
  );
}

InputDecorationTheme inputDecorationTheme() {
  OutlineInputBorder outlineInputBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(
      10,
    ),
  );
  return InputDecorationTheme(
    contentPadding: const EdgeInsets.symmetric(horizontal: 5, vertical: 15),
    enabledBorder: outlineInputBorder,
    focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: const BorderSide(color: primaryColor)
        // gapPadding: 30
        ),
    hintStyle: const TextStyle(
      color: Colors.grey,
    ),
    border: outlineInputBorder,

    // If  you are using latest version of flutter then lable text and hint text shown like this
    // if you r using flutter less then 1.20.* then maybe this is not working properly
    // if we are define our floatingLabelBehavior in our theme then it's not applayed
  );
}

TextTheme textTheme() {
  return const TextTheme(
    headlineLarge: TextStyle(),
    headlineMedium: TextStyle(),
    headlineSmall: TextStyle(),
  );
}

// AppBarTheme appBarTheme() {
//   return AppBarTheme(
//     color: Colors.white,
//     elevation: 0,
//     brightness: Brightness.light,
//     iconTheme: IconThemeData(color: Colors.black),
//     textTheme: TextTheme(
//       headline6: TextStyle(color: Color(0XFF8B8B8B), fontSize: 18),
//     ),
//   );
// }

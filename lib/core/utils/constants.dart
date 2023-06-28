
import 'package:flutter/material.dart';

const primaryColor = Colors.deepPurple;
const primaryLightColor = Color(0xFFFFECDF);
const primaryGradientColor = LinearGradient(
  begin: Alignment.topLeft,
  end: Alignment.bottomRight,
  colors: [Color(0xFFFFA53E), Color(0xFFFF7643)],
);
const secondaryColor = Color(0xFF979797);
const textColor = Color(0xFF757575);


const animationDuration = Duration(milliseconds: 200);
const defaultDuration = Duration(milliseconds: 250);

// Form Error
final RegExp emailValidatorRegExp =
    RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
const String kEmailNullError = "Please Enter your email";
const String kInvalidEmailError = "Please Enter Valid Email";
const String kPassNullError = "Please Enter your password";
const String kShortPassError = "Password is too short";
const String kMatchPassError = "Passwords don't match";
const String kNamelNullError = "Please Enter your name";
const String kPhoneNumberNullError = "Please Enter your phone number";
const String kAddressNullError = "Please Enter your address";


const kTileHeight = 50.0;
const inProgressColor = Colors.black87;
const todoColor = Color(0xffd1d2d7);

enum Pages {
  deliveryTime,
  addAddress,
  summary,
}
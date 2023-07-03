import 'package:chat_app_max/view_models/auth_view_model.dart';
import 'package:chat_app_max/views/orders/screens/orders_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../core/utils/constants.dart';
import '../screens/help_center.dart';

class MenuItems extends StatelessWidget {

  const MenuItems({super.key});

  @override
  Widget build(BuildContext context) {
  final authController = Get.find<AuthViewModel>();

    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: SingleChildScrollView(
        child: Column(
          children: [
            ProfileMenu(
              text: "My Orders",
              icon: "assets/icons/Check mark rounde.svg",
              press: () => {
                  Get.to(()=> OrdersScreen())
              },
              
            ),
            ProfileMenu(
              text: "Notifications",
              icon: "assets/icons/Bell.svg",
              press: () {},
            ),
            ProfileMenu(
              text: "Settings",
              icon: "assets/icons/Settings.svg",
              press: () {},
            ),
            ProfileMenu(
              text: "Help Center",
              icon: "assets/icons/Question mark.svg",
              press: () {
                Get.to(()=>const HelpCenterScreen());
              },
            ),
            ProfileMenu(
              text: "Log Out",
              icon: "assets/icons/Log out.svg",
              press: () {
                authController.signOut();
              },
            ),
          ],
        ),
      ),
    );
  }
}

class ProfileMenu extends StatelessWidget {
  const ProfileMenu({
    Key? key,
    required this.text,
    required this.icon,
    this.press,
  }) : super(key: key);

  final String text, icon;
  final VoidCallback? press;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: TextButton(
        style: TextButton.styleFrom(
          //foregroundColor: primaryColor,
          padding: const EdgeInsets.all(20),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          backgroundColor: const Color(0xFFF5F6F9),
        ),
        onPressed: press,
        //  (){
        //   Get.showSnackbar(const GetSnackBar(
        //     message:'This Feature will be added soon' ,
        //     duration: Duration(milliseconds: 1000),
        //  //   titleText: CustomText(text: ,),
        //   ));
        // },
        child: Row(
          children: [
            SvgPicture.asset(
              icon,
              color: primaryColor,
              width: 22,
            ),
            const SizedBox(width: 20),
            Expanded(child: Text(text)),
            const Icon(
              Icons.arrow_forward_ios,
              size: 20,
            ),
          ],
        ),
      ),
    );
  }
}

// ignore_for_file: must_be_immutable

import 'package:chat_app_max/view_models/auth_view_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/utils/constants.dart';
import '../../../core/utils/size_config.dart';
import '../../../core/widgets/show_dialog.dart';
import '../widgets/no_account_text.dart';
import '../widgets/say_welcome.dart';
import '../widgets/sign_form.dart';
import '../widgets/socal_card.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});
  AuthViewModel authController = Get.find();

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: size.height * 0.08),
              const SayWelcome(),
              SizedBox(height: size.height * 0.06),
              const SignForm(),
              SizedBox(height: size.height * 0.04),
              _signWithSocialMedia(context, size),
              SizedBox(height: size.height * 0.02),
              const NoAccountText(),
              SizedBox(height: size.height * 0.04),
            ],
          ),
        ),
      ),
    );
  }

  Column _signWithSocialMedia(context, Size size) {
    SizeConfig.init(context);
    return Column(
      children: [
        const Divider(),
        SizedBox(height: size.height * 0.04),
        Row(
         // mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            const Spacer(),
            GetBuilder<AuthViewModel>(
              builder: (controller) => controller.isLoading
                  ? const CircularProgressIndicator(
                      color: primaryColor,
                    )
                  : SocalCard(
                      icon: "assets/icons/google-icon.svg",
                      press: () async {
                        try {
                          await authController.signInWithGoogle();
                          
                        } catch (e) {
                          controller.toggleIsLoading();
                          ShowDialog.showMyDialog(
                            context,
                            title: 'Failed!',
                            discription:
                                'failed to Sign in with Google, please check your internet connection and try again',
                            choiceTrue: 'Got it',
                            onChoiceTrue: () {},
                          );
                        }
                      },
                    ),
            ),
            const Spacer(),
            
            SocalCard(
              icon: "assets/icons/facebook-2.svg",
              press: () {},
            ),
            const Spacer(),

          ],
        ),
      ],
    );
  }
}

import 'dart:developer';

import 'package:chat_app_max/view_models/auth_view_model.dart';
import 'package:chat_app_max/views/auth/screens/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/widgets/custom_text.dart';
import '../../../core/widgets/custom_text_bottun.dart';
import '../../../core/widgets/show_dialog.dart';
import '../widgets/no_account_text.dart';

class FogrotPasswordScreen extends StatelessWidget {
  FogrotPasswordScreen({super.key});

  final _form1 = GlobalKey<FormState>();
  void _saveForm() {
    _form1.currentState?.save();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.white,
        leading: BackButton(
          onPressed: () => Get.offAll(() => LoginScreen(),
              transition: Transition.leftToRight),
          
        ),
      ),
      body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: size.height * 0.035),
                const SayWelcome(),
                SizedBox(height: size.height * 0.06),
                const SignUpForm(),
                SizedBox(height: size.height * 0.02),
              ],
            ),
          )),
    );
  }
}

class SignUpForm extends StatefulWidget {
  const SignUpForm({super.key});

  @override
  State<SignUpForm> createState() => _SignFormState();
}

class _SignFormState extends State<SignUpForm> {
  AuthViewModel authController = Get.find();
  final _form = GlobalKey<FormState>();
  void _saveForm() {
    _form.currentState?.save();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Form(
      key: _form,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(height: size.height * 0.02),
          TextFormField(
            decoration: InputDecoration(
              label: const Text('Email'),
              hintText: 'example@gmail.com',
              floatingLabelBehavior: FloatingLabelBehavior.always,
              prefixIcon: Icon(
                Icons.email,
                size: size.height * size.width * 0.00008,
              ),
            ),
            onFieldSubmitted: (value) {},
            onSaved: (value) {
              authController.userInfo['email'] = value!;
            },
          ),
          SizedBox(height: size.height * 0.03),
          CustomTextButton(
            onPressed: () async {
              _saveForm();
              try {
                authController.signInWithEmailAndPassword();
              } catch (e) {
                log('$e');
                ShowDialog.showMyDialog(context,
                    title: 'Failed!',
                    discription:
                        'failed to Sign in, please check your internet connection and try again',
                    choiceTrue: 'Got it',
                    onChoiceTrue: () {},
                    height: 30);
              }
            },
            text: 'Continue',
          ),
          SizedBox(height: size.height * 0.015),
          const NoAccountText(),
        ],
      ),
    );
  }
}

class SayWelcome extends StatelessWidget {
  const SayWelcome({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children:  [
        CustomText(
          text: 'Forgot Password!',
          fontSize: 30,
          color: Colors.black,
          alignment: Alignment.center,
        ),
        const SizedBox(
          height: 5,
        ),
        CustomText(
          text: 'Enter your email and we will send ',
          fontSize: 15,
          color: Colors.black,
          alignment: Alignment.center,
        ),
        CustomText(
          text: 'a link to return to your account',
          fontSize: 15,
          color: Colors.black,
          alignment: Alignment.center,
        ),
      ],
    );
  }
}

import 'package:chat_app_max/view_models/auth_view_model.dart';
import 'package:chat_app_max/views/auth/screens/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/utils/constants.dart';
import '../../../core/widgets/custom_text.dart';
import '../../../core/widgets/custom_text_bottun.dart';
import '../../../core/widgets/show_dialog.dart';


class SignUpScreen extends StatelessWidget {
  SignUpScreen({super.key});
  AuthViewModel controller = Get.find();
  final FocusNode passwordFoucasNode = FocusNode();
  final FocusNode emailFoucasNode = FocusNode();
  final FocusNode nameFocusNode = FocusNode();
  final _form1 = GlobalKey<FormState>();

  void _saveForm() {
    _form1.currentState?.save();
    print('save() called now ');
    print(controller.userInfo['name']);
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
          // Icons.arrow_back,color: Colors.black,
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
      //Padding(
      //   padding: const EdgeInsets.all(15.0),
      //   child: Form(
      //     key: _form1,
      //     child: ListView(
      //       children: [
      //         CustomText(
      //           text: 'Sign Up',
      //           fontSize: 30,
      //           //       fontWeight: FontWeight.bold,
      //           color: Colors.black,
      //         ),
      //         const SizedBox(
      //           height: 30,
      //         ),
      //
      //
      //         TextFormField(
      //           decoration: const InputDecoration(
      //             hintText: 'name',
      //             hintStyle: TextStyle(
      //               color: Colors.grey,
      //             ),
      //           ),
      //
      //           //    controller: nameController,
      //         ),
      //         const SizedBox(
      //           height: 10,
      //         ),
      //         CustomText(
      //           text: 'Email',
      //           fontSize: 15,
      //           fontWeight: FontWeight.bold,
      //         ),
      //         TextFormField(
      //           decoration: const InputDecoration(
      //             hintText: '@example@gmail.com',
      //             hintStyle: TextStyle(
      //               color: Colors.grey,
      //             ),
      //           ),
      //           focusNode: emailFoucasNode,
      //           onFieldSubmitted: (value) {
      //             FocusScope.of(context).requestFocus(passwordFoucasNode);
      //           },
      //           onSaved: (value) {
      //             controller.userInfo['email'] = value!;
      //           },
      //           //    controller: emailController,
      //         ),
      //         const SizedBox(
      //           height: 10,
      //         ),
      //         CustomText(
      //           text: 'Password',
      //           fontSize: 15,
      //           fontWeight: FontWeight.bold,
      //         ),
      //         TextFormField(
      //           decoration: const InputDecoration(
      //             hintText: '*******',
      //             hintStyle: TextStyle(
      //               color: Colors.grey,
      //             ),
      //           ),
      //           focusNode: passwordFoucasNode,
      //           onFieldSubmitted: (_) {
      //             _saveForm();
      //             controller.signInWitheEmailAndPassword();
      //           },
      //           onSaved: (value) {
      //             controller.userInfo['password'] = value!;
      //           },

      //         ),
      //         const SizedBox(
      //           height: 40,
      //         ),
      //         CustomTextButton(
      //           onPressed: () {
      //             print('is presse');
      //             _saveForm();
      //             if (_form1.currentState!.validate()) {
      //               print(_form1.currentState?.validate());
      //             }
      //               controller.signUpWitheEmailAndPassword();
      //           },
      //           text: 'Sign Up',
      //         ),
      //       ],
      //     ),
      //   ),
      // ),
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
  final FocusNode emailFoucasNode = FocusNode();
  final FocusNode passwordFoucasNode = FocusNode();
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
          TextFormField(
            onFieldSubmitted: (_) {
              FocusScope.of(context).requestFocus(emailFoucasNode);
            },
            onSaved: (value) {
              authController.userInfo['name'] = value!;
            },
            decoration: InputDecoration(
              hintText: 'name',
              floatingLabelBehavior: FloatingLabelBehavior.always,
              prefixIcon: Icon(
                Icons.person,
                size: size.height * size.width * 0.00008,
              ),
            ),
          ),
          SizedBox(height: size.height * 0.02),
          TextFormField(
            decoration: InputDecoration(
              hintText: 'example@gmail.com',
              floatingLabelBehavior: FloatingLabelBehavior.always,
              prefixIcon: Icon(
                Icons.email,
                size: size.height * size.width * 0.00008,
              ),
            ),
            focusNode: emailFoucasNode,
            onFieldSubmitted: (value) =>
                {FocusScope.of(context).requestFocus(passwordFoucasNode)},
            onSaved: (value) {
              authController.userInfo['email'] = value!;
            },
          ),
          SizedBox(height: size.height * 0.02),
          TextFormField(
            decoration: InputDecoration(
              hintText: '********',
              floatingLabelBehavior: FloatingLabelBehavior.always,
              prefixIcon: Icon(
                Icons.lock,
                size: size.height * size.width * 0.00008,
              ),
            ),
            focusNode: passwordFoucasNode,
            onSaved: (value) {
              authController.userInfo['password'] = value!;
            },
            onFieldSubmitted: (value) {
              _saveForm();
            },
          ),
          SizedBox(height: size.height * 0.015),
          SizedBox(height: size.height * 0.015),
             GetBuilder<AuthViewModel>(
            builder: (controller) => controller.isLoading
                ? const CircularProgressIndicator(
                    color: primaryColor,
                  )
                : CustomTextButton(
            onPressed: () async {
              _saveForm();
              try {
              controller.toggleIsLoading();

                await authController.createUserWithEmailAndPassword();
              controller.toggleIsLoading();

              } catch (e) {
              controller.toggleIsLoading();
                ShowDialog.showMyDialog(context,
                    title: 'Failed!',
                    discription:
                        'failed to Sign up , please check your internet connection and try again',
                    choiceTrue: 'Got it',
                    onChoiceTrue: () {},
                    height: 30);
              }
            },
            text: 'Sign Up',
          ),
          ),
          
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
          text: 'Sign Up!',
          fontSize: 30,
          color: Colors.black,
          alignment: Alignment.center,
        ),
        const SizedBox(
          height: 5,
        ),
        CustomText(
          text: 'Sign up with your email and password',
          fontSize: 15,
          color: Colors.black,
          alignment: Alignment.center,
        ),
        CustomText(
          text: 'to create a new account',
          fontSize: 15,
          color: Colors.black,
          alignment: Alignment.center,
        ),
      ],
    );
  }
}

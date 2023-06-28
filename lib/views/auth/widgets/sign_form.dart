import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/utils/constants.dart';
import '../../../core/widgets/custom_text.dart';
import '../../../core/widgets/custom_text_bottun.dart';
import '../../../core/widgets/show_dialog.dart';
import '../../../view_models/auth_view_model.dart';
import '../screens/forgot_password_screen.dart';

class SignForm extends StatefulWidget {
  const SignForm({super.key});

  @override
  State<SignForm> createState() => _SignFormState();
}

class _SignFormState extends State<SignForm> {
  AuthViewModel authViewModel = Get.find();
  final FocusNode emailFoucasNode = FocusNode();
  final FocusNode passwordFoucasNode = FocusNode();
  bool isobscure = true;
  final _form = GlobalKey<FormState>();

  void _saveForm() {
    final isvalid = _form.currentState!.validate();
    if (!isvalid) {
      return;
    }
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
          _buildEmailFeild(size, context),
          SizedBox(height: size.height * 0.025),
          _buildPasswordFeild(size),
          SizedBox(height: size.height * 0.015),
          _buildForgetPasswordButton(),
          SizedBox(height: size.height * 0.015),
          _buildSignInButtom(context),
        ],
      ),
    );
  }

  GetBuilder<AuthViewModel> _buildSignInButtom(BuildContext context) {
    return GetBuilder<AuthViewModel>(
          builder: (controller) => controller.isLoading
              ? const CircularProgressIndicator(
                  color: primaryColor,
                )
              : CustomTextButton(
                  onPressed: () async {
                    final isvalid = _form.currentState!.validate();
                    if (!isvalid) {
                      return;
                    } else {
                      _form.currentState?.save();
                      try {
                       
                        await controller.signInWithEmailAndPassword();
                       
                      } catch (e) {
                        controller.toggleIsLoading();
                        ShowDialog.showMyDialog(
                          context,
                          title: 'Failed!',
                          discription:
                              'failed to Sign up , please check your internet connection and try again',
                          choiceTrue: 'Got it',
                          onChoiceTrue: () {},
                        );
                      }
                    }
                  },
                  text: 'Sign In',
                ),
        );
  }

  InkWell _buildForgetPasswordButton() {
    return InkWell(
          onTap: () {
            Get.to(() => FogrotPasswordScreen());
          },
          child: CustomText(
            text: 'Forget Password?',
            fontSize: 14,
            alignment: Alignment.bottomRight,
            fontWeight: FontWeight.bold,
            color: Colors.grey,
          ),
        );
  }

  TextFormField _buildPasswordFeild(Size size) {
    return TextFormField(
          decoration: InputDecoration(
            suffixIcon: IconButton(
              icon: Icon(
                isobscure ? Icons.remove_red_eye : Icons.visibility_off,
                size: 20,
              ),
              onPressed: () {
                setState(() {
                  isobscure = !isobscure;
                });
              },
            ),
            hintText: '********',
            floatingLabelBehavior: FloatingLabelBehavior.always,
            prefixIcon: Icon(
              Icons.lock,
              size: size.height * size.width * 0.000065,
            ),
          ),
          focusNode: passwordFoucasNode,
          obscureText: isobscure,
          onSaved: (value) {
            authViewModel.userInfo['password'] = value!;
          },
          onFieldSubmitted: (value) {
            _saveForm();
          },
          onTap: () => setState(() {}),
          validator: (value) {
            if (value!.isEmpty) {
              return kPassNullError;
            } else if (value.length < 8) {
              return kShortPassError;
            } else {
              return null;
            }
          },
        );
  }

  TextFormField _buildEmailFeild(Size size, BuildContext context) {
    return TextFormField(
          decoration: InputDecoration(
            hintText: 'example@gmail.com',
            floatingLabelBehavior: FloatingLabelBehavior.always,
            prefixIcon: Icon(
              Icons.email,
              size: size.height * size.width * 0.000065,
            ),
          ),
          focusNode: emailFoucasNode,
          onFieldSubmitted: (value) {
              FocusScope.of(context).requestFocus(passwordFoucasNode);
          },
          onSaved: (value) {
            authViewModel.userInfo['email'] = value!;
          },
          validator: (value) {
            if (value!.isEmpty) {
              return kEmailNullError;
            } else if (!emailValidatorRegExp.hasMatch(value)) {
              return kInvalidEmailError;
            } else {
              return null;
            }
          },
          onChanged: (value) {},
        );
  }
}

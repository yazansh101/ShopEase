import 'package:chat_app_max/views/cheack_out/widgets/address.dart';
import 'package:chat_app_max/views/cheack_out/widgets/deleviry.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/utils/constants.dart';
import '../../../core/widgets/custom_text.dart';
import '../../../view_models/stepper_view_model.dart';
import '../../orders/cart_view_model.dart';
import '../../orders/orders_view_model.dart';
import '../widgets/stepper_controller.dart';
import '../widgets/summry.dart';

class CheckoutPage extends StatefulWidget {
  const CheckoutPage({Key? key}) : super(key: key);
  @override
  State<CheckoutPage> createState() => _CheckoutPageState();
}

class _CheckoutPageState extends State<CheckoutPage> {
  var orderViewModel = Get.find<OrderViewModel>();
  var cartViewModel = Get.find<CartViewModel>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0.0,
        title: const Text(
          "Check out",
          style: TextStyle(
            color: Colors.black,
          ),
        ),
      ),
      backgroundColor: Colors.white,
      body: Theme(
        data: ThemeData(
            colorScheme: const ColorScheme.light(primary: primaryColor)),
        child: GetBuilder(
          init: StepperViewModel(),
          builder: (stepperViewModel) => Stepper(
            controlsBuilder: (context, details) => StepperControlBuilder(
              currentStep: stepperViewModel.currentStep,
              onCancel: stepperViewModel.cancelStep,
              onNext: () {
                stepperViewModel.nextStep();
                if (stepperViewModel.currentStep >= 2) {
                  orderViewModel.addOrder(cartViewModel.items.values.toList(),
                      cartViewModel.totalAmount.value.roundToDouble());
                }
              },
            ),
            currentStep: stepperViewModel.currentStep,
            elevation: 0,
            type: StepperType.horizontal,
            steps: getSteps(stepperViewModel.currentStep),
            onStepTapped: (value) {
              stepperViewModel.setCurrentStep(value);
            },
          ),
        ),
      ),
    );
  }

  List<Step> getSteps(currentStep) => [
        Step(
            state: currentStep >= 1 ? StepState.complete : StepState.indexed,
            isActive: currentStep >= 0,
            title: CustomText(
              text: 'Deleviry',
            ),
            content: const DeliveryTime()),
        Step(
            state: currentStep >= 2 ? StepState.complete : StepState.indexed,
            isActive: currentStep >= 1,
            title: CustomText(
              text: 'Address',
            ),
            content: AddAddress()),
        Step(
            isActive: currentStep >= 2,
            title: CustomText(
              text: 'Summary',
            ),
            content: MySummary()),
      ];
}


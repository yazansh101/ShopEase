import 'package:flutter/material.dart';

import '../../../core/widgets/custom_text_bottun.dart';

class StepperControlBuilder extends StatelessWidget {
  StepperControlBuilder({
    super.key,
    required this.currentStep,
    required this.onCancel,
    required this.onNext,
  });

  int currentStep;
  Function onCancel;
  Function onNext;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 50),
      child: Row(
        children: [
          CustomTextButton(
              text: 'Cancel',
              onPressed: onCancel,
              width: 100,
              color: Colors.white,
              textColor: Colors.grey.shade400),
          const SizedBox(
            width: 5,
          ),
          CustomTextButton(
            borderRadius: 5,
            text: currentStep > 1 ? 'Confirm' : 'Next',
            onPressed: onNext,
            width: 100,
            height: 41,
            

          ),
        ],
      ),
    );
  }
}

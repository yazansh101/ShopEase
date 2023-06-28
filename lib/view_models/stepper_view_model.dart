import 'package:get/get.dart';

import '../views/cheack_out/screens/thank_you_screen.dart';

class StepperViewModel extends GetxController {
  int currentStep = 0;
  setCurrentStep(value) {
    currentStep = value;
  }

  nextStep( ) {
    currentStep += 1;
   if(currentStep>2) {
    Get.to( FinishingScreen());
    currentStep=0;
    
    
   } 
    update();
  }



  cancelStep() {
    currentStep -= 1;
    update();
  }

  
}

import 'package:get/get.dart';

import '../../views/auth/screens/login_screen.dart';
import '../../views/auth/screens/success_screen.dart';
import '../../views/splash/screens/splash_screen.dart';

abstract class NavigationService {
  void goToSuccessScreen();
  void goToHomeScreen();
  void goToLoginScreen();

}

class GetNavigationService implements NavigationService {
  @override
  void goToSuccessScreen() {
    Get.offAll(() =>  LoginSuccessScreen());
  }

  @override
  void goToHomeScreen() {
    Get.offAll(() =>  const SplashScreenView());
  }

  @override
  void goToLoginScreen() {
    Get.offAll(() => LoginScreen());
  }
}
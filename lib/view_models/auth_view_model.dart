// ignore_for_file: unnecessary_null_comparison

import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

import '../core/services/firebase_auth_service.dart';
import '../core/services/navigator_service.dart';

class AuthViewModel extends GetxController {
  final AuthService _authService;
  final NavigationService _navigationService;
  User? currentUser;
  bool _isLoading = false;

  bool get isLoading => _isLoading;

  void toggleIsLoading() {
    _isLoading = !_isLoading;
    update();
  }

  final Map<String, String> userInfo = {
    'name': '',
    'email': '',
    'password': ''
  };

  late final Rx<User?> _user;

  AuthViewModel(
      {required AuthService authService,
      required NavigationService navigationService})
      : _authService = authService,
        _navigationService = navigationService;

  @override
  void onInit() {
    super.onInit();
    initCurrentUser();
    _user = Rx<User?>(currentUser);
    _user.bindStream(_authService.onAuthStateChanged);
    ever(_user, (_) => _setInitialScreen());
  }

  void _setInitialScreen() {
    _user == null
        ? _navigationService.goToLoginScreen()
        : _navigationService.goToHomeScreen();
  }

  void initCurrentUser() async {
    currentUser = await _authService.getCurrentUser();
  }

  Future<void> signInWithEmailAndPassword() async {
    toggleIsLoading();
    await _authService.signInWithEmailAndPassword(
        email: userInfo['email']!, password: userInfo['password']!);
    toggleIsLoading();
    _navigationService.goToSuccessScreen();
  }

  Future<void> createUserWithEmailAndPassword() async {
    toggleIsLoading();
    await _authService.createUserWithEmailAndPassword(
        email: userInfo['email']!, password: userInfo['password']!);

    toggleIsLoading();
    _navigationService.goToSuccessScreen();
  }

  void signOut() async {
    await _authService.signOut();
    _navigationService.goToLoginScreen();
  }

  Future<void> signInWithGoogle() async {
    toggleIsLoading();
    await _authService.signInWithGoogle();
    toggleIsLoading();
    _navigationService.goToSuccessScreen();
  }
}

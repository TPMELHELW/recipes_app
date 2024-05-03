import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:recipes_app/features/authentication/screens/login_screen/login_screen.dart';
import 'package:recipes_app/features/authentication/screens/on_boarding_screen/on_boarding_screen.dart';
import 'package:recipes_app/features/authentication/screens/signup_screen/verify_screen.dart';
import 'package:recipes_app/features/recipes/view/home_screen/screen/home_screen.dart';
import 'package:recipes_app/utils/exception/firebase_auth_exceptions.dart';
import 'package:recipes_app/utils/function/snack_bar.dart';

class AuthRepository extends GetxController {
  final FirebaseAuth _auth;
  AuthRepository(this._auth);

  static AuthRepository get instance => Get.find();
  final storage = GetStorage();

  void screenRedirect() {
    if (_auth.currentUser != null) {
      if (_auth.currentUser?.emailVerified ?? false) {
        Get.offAll(() => const HomeScreen());
      } else {
        Get.offAll(() => VerifyScreen(
              email: _auth.currentUser!.email!,
            ));
      }
    } else {
      storage.writeIfNull("isFirstTime", true);
      storage.read("isFirstTime")
          ? Get.offAll(() => const OnBoardingScreen())
          : Get.offAll(() => const LoginScreen());
    }
  }

  Future<UserCredential> signUpWithEmailAndPassword(
      String email, String password) async {
    try {
      final UserCredential user = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      return user;
    } on FirebaseAuthException catch (e) {
      final error = AuthError.from(e);
      showSnackbar(error.dialogTitle, error.dialogText);
      throw FirebaseAuthException(code: e.code);
    }
  }

  Future sendEmailVerification() async {
    try {
      await _auth.currentUser!.sendEmailVerification();
    } on FirebaseAuthException catch (e) {
      final error = AuthError.from(e);
      showSnackbar(error.dialogTitle, error.dialogText);
    }
  }

  Future<UserCredential> logInWithEmailAndPassword(
      String email, String password) async {
    try {
      return await _auth.signInWithEmailAndPassword(
          email: email, password: password);
    } on FirebaseAuthException catch (e) {
      final error = AuthError.from(e);
      showSnackbar(error.dialogTitle, error.dialogText);
      throw Exception(e);
    }
  }

  @override
  void onReady() {
    FlutterNativeSplash.remove();
    screenRedirect();
    super.onReady();
  }
}

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:recipes_app/data/auth_repository.dart';
import 'package:recipes_app/features/authentication/screens/signup_screen/verify_screen.dart';
import 'package:recipes_app/utils/constants/enums.dart';
import 'package:recipes_app/utils/function/check_internet.dart';

class SignUpController extends GetxController {
  static SignUpController get instance => Get.find();

  final Rx<bool> isHide = true.obs;
  late TextEditingController firstName;
  late TextEditingController lastName;
  late TextEditingController email;
  late TextEditingController password;
  late TextEditingController phone;
  late TextEditingController userName;
  GlobalKey<FormState> formState = GlobalKey();
  late Rx<StatusRequest> statusRequest;
  Future<void> signUp() async {
    try {
      //Check Internet
      if (!await checkInternet()) {
        statusRequest.value = StatusRequest.offline;
        update();
        return;
      }
      //Field Validation
      if (!formState.currentState!.validate()) return;
      //Loading
      statusRequest.value = StatusRequest.loading;
      update();
      //Create Account
      await AuthRepository.instance
          .signUpWithEmailAndPassword(email.text.trim(), password.text.trim());

      Get.to(
        () => VerifyScreen(
          email: email.text,
        ),
      );
      statusRequest.value = StatusRequest.success;
      update();
    } on FirebaseAuthException catch (_) {
      statusRequest.value = StatusRequest.serverFailure;
      update();
    }
  }

  @override
  void onInit() {
    firstName = TextEditingController();
    lastName = TextEditingController();
    email = TextEditingController();
    password = TextEditingController();
    phone = TextEditingController();
    userName = TextEditingController();
    statusRequest = StatusRequest.none.obs;
    super.onInit();
  }
}

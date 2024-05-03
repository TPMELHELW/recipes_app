import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:recipes_app/common/success_screen.dart';
import 'package:recipes_app/data/auth_repository.dart';

class VerificationController extends GetxController {
  @override
  void onInit() {
    sendEmailVerification();
    autoDirect();
    super.onInit();
  }

  final FirebaseAuth _auth = FirebaseAuth.instance;
  Future<void> sendEmailVerification() async {
    try {
      await AuthRepository(FirebaseAuth.instance).sendEmailVerification();
    } on FirebaseAuthException catch (e) {
      print(e);
    }
  }

  Future<void> autoDirect() async {
    Timer.periodic(const Duration(seconds: 2), (timer) async {
      await _auth.currentUser!.reload();
      if (_auth.currentUser!.emailVerified) {
        timer.cancel();
        Get.off(() => const SuccessScreen());
      }
    });
  }

  Future<void> checkEmailVerification() async {
    if (_auth.currentUser != null && _auth.currentUser!.emailVerified) {
      Get.off(() => const SuccessScreen());
    }
  }
}

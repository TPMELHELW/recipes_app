import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:recipes_app/data/auth_repository.dart';
import 'package:recipes_app/utils/constants/enums.dart';
import 'package:recipes_app/utils/function/check_internet.dart';

class LogInController extends GetxController {
  static LogInController get instance => Get.find();

  late TextEditingController email;
  late TextEditingController password;
  GlobalKey<FormState> formState = GlobalKey();
  Rx<bool> isHide = true.obs;
  Rx<bool> isCheck = false.obs;
  final GetStorage storage = GetStorage();
  late StatusRequest statusRequest;

  Future<void> signInWithEmailAndPassword() async {
    try {
      if (!await checkInternet()) {
        statusRequest = StatusRequest.offline;
        update();
        return;
      }
      if (!formState.currentState!.validate()) return;
      if (isCheck.value) {
        storage.write('Email', email.text.trim());
        storage.write('Password', password.text.trim());
      }
      statusRequest = StatusRequest.loading;
      update();
      await AuthRepository.instance
          .logInWithEmailAndPassword(email.text.trim(), password.text.trim());

      AuthRepository.instance.screenRedirect();
    } catch (_) {
      statusRequest = StatusRequest.serverFailure;
      update();
    }
  }

  @override
  void onInit() {
    email = TextEditingController();
    password = TextEditingController();
    email.text = storage.read('Email') ?? '';
    password.text = storage.read('Password') ?? '';
    statusRequest = StatusRequest.none;
    super.onInit();
  }
}

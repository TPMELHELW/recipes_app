// import 'dart:html';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:recipes_app/features/authentication/models/on_boarding/on_boarding_data.dart';
import 'package:recipes_app/features/authentication/screens/login_screen/login_screen.dart';

class OnBoardingController extends GetxController {
  final PageController pageController = PageController();
  int currentPage = 0;
  final storage = GetStorage();
  void onChangeIndex(int index) {
    currentPage = index;
  }

  void nextPage() {
    if (onBoardingData.length == currentPage + 1) {
      storage.write('isFirstTime', false);
      Get.delete<OnBoardingController>();
      Get.offAll(() => const LoginScreen());
    } else {
      pageController.animateToPage(currentPage + 1,
          duration: const Duration(milliseconds: 400), curve: Curves.easeInOut);
    }
  }

  void skipPages() {
    pageController.animateToPage(onBoardingData.length - 1,
        duration: const Duration(milliseconds: 300), curve: Curves.easeInOut);
  }
}

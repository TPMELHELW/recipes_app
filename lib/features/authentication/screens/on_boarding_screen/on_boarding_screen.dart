import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:recipes_app/features/authentication/controllers/on_boarding_controller.dart';
import 'package:recipes_app/features/authentication/screens/on_boarding_screen/widgets/bottom_view_on_boarding_widget.dart';
import 'package:recipes_app/features/authentication/screens/on_boarding_screen/widgets/on_boarding_widget.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final OnBoardingController controller = Get.put(OnBoardingController());
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 8,
            vertical: 8,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Align(
                alignment: Alignment.topRight,
                child: TextButton(
                  onPressed: controller.skipPages,
                  child: const Text('Skip'),
                ),
              ),
              OnBoardingWidget(controller: controller),
              BottomViewOnBoardingWidget(controller: controller),
            ],
          ),
        ),
      ),
    );
  }
}

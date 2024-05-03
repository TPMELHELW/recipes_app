import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:recipes_app/common/button_widget.dart';
import 'package:recipes_app/features/authentication/screens/login_screen/login_screen.dart';
import 'package:recipes_app/utils/constants/image_strings.dart';
import 'package:recipes_app/utils/constants/text_strings.dart';

class SuccessScreen extends StatelessWidget {
  const SuccessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 30),
          children: [
            Image.asset(
              AppImages.staticSuccessIllustration,
              height: 200,
            ),
            const SizedBox(
              height: 25,
            ),
            Text(
              AppTexts.yourAccountCreatedTitle,
              style: Theme.of(context).textTheme.headlineMedium,
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              AppTexts.yourAccountCreatedSubTitle,
              style: Theme.of(context).textTheme.labelMedium,
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 25,
            ),
            ButtonWidget(
              onPress: () => Get.offAll(() => const LoginScreen()),
              text: AppTexts.tContinue,
            )
          ],
        ),
      ),
    );
  }
}

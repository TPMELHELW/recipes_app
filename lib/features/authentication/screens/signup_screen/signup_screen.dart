import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:recipes_app/features/authentication/controllers/signup_controller.dart';
import 'package:recipes_app/features/authentication/screens/signup_screen/widget/signup_form_widget.dart';
import 'package:recipes_app/utils/constants/text_strings.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(SignUpController());
    return Scaffold(
      appBar: AppBar(),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        children: [
          Text(
            AppTexts.signupTitle,
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          const SizedBox(
            height: 30,
          ),
          const SignupFormWidget(),
        ],
      ),
    );
  }
}

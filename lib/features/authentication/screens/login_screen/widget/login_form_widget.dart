import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:recipes_app/common/button_widget.dart';
import 'package:recipes_app/common/custom_text_field_widget.dart';
import 'package:recipes_app/features/authentication/controllers/log_in_controller.dart';
import 'package:recipes_app/features/authentication/screens/signup_screen/signup_screen.dart';
import 'package:recipes_app/utils/constants/colors.dart';
import 'package:recipes_app/utils/constants/text_strings.dart';
import 'package:recipes_app/utils/validators/validation.dart';

class LoginFormWidget extends StatelessWidget {
  const LoginFormWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final LogInController controller = LogInController.instance;
    return Form(
      key: controller.formState,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          CustomTextFieldWidget(
            validator: (value) => AppFieldValidator.validateEmail(value),
            controller: controller.email,
            icon: Iconsax.direct_right,
            labelText: AppTexts.email,
          ),
          const SizedBox(
            height: 10,
          ),
          Obx(
            () => TextFormField(
              validator: (value) => AppFieldValidator.validatePassword(value),
              obscureText: controller.isHide.value,
              controller: controller.password,
              decoration: InputDecoration(
                border: const OutlineInputBorder(borderSide: BorderSide.none),
                fillColor: AppColors.grey,
                filled: true,
                prefixIcon: const Icon(Iconsax.password_check),
                labelText: AppTexts.password,
                suffixIcon: IconButton(
                  onPressed: () =>
                      controller.isHide.value = !controller.isHide.value,
                  icon: Icon(controller.isHide.value
                      ? Iconsax.eye
                      : Iconsax.eye_slash),
                ),
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Obx(
                    () => Checkbox(
                      value: controller.isCheck.value,
                      onChanged: (val) => controller.isCheck.value = val!,
                    ),
                  ),
                  const Text(AppTexts.rememberMe),
                ],
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          ButtonWidget(
              statusRequest: controller.statusRequest,
              text: AppTexts.signIn,
              onPress: () async =>
                  await controller.signInWithEmailAndPassword()),
          const SizedBox(
            height: 10,
          ),
          TextButton(
            onPressed: () {
              Get.to(() => const SignupScreen());
            },
            child: const Text(
              AppTexts.createAccount,
            ),
          )
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:recipes_app/common/button_widget.dart';
import 'package:recipes_app/common/custom_text_field_widget.dart';
import 'package:recipes_app/features/authentication/controllers/signup_controller.dart';
import 'package:recipes_app/utils/constants/colors.dart';
import 'package:recipes_app/utils/constants/text_strings.dart';
import 'package:recipes_app/utils/validators/validation.dart';

class SignupFormWidget extends StatelessWidget {
  const SignupFormWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = SignUpController.instance;
    return Form(
      key: controller.formState,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            children: [
              Expanded(
                  child: CustomTextFieldWidget(
                validator: (value) =>
                    AppFieldValidator.validateEmpty(value, AppTexts.firstName),
                controller: controller.firstName,
                icon: Iconsax.user,
                labelText: AppTexts.firstName,
              )),
              const SizedBox(
                width: 10,
              ),
              Expanded(
                child: CustomTextFieldWidget(
                  validator: (value) =>
                      AppFieldValidator.validateEmpty(value, AppTexts.lastName),
                  controller: controller.lastName,
                  icon: Iconsax.user,
                  labelText: AppTexts.lastName,
                ),
              )
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          CustomTextFieldWidget(
            validator: (value) =>
                AppFieldValidator.validateEmpty(value, AppTexts.firstName),
            controller: controller.userName,
            icon: Iconsax.user_edit,
            labelText: AppTexts.username,
          ),
          const SizedBox(
            height: 10,
          ),
          CustomTextFieldWidget(
            validator: (value) => AppFieldValidator.validateEmail(value),
            controller: controller.email,
            icon: Iconsax.direct_right,
            labelText: AppTexts.email,
          ),
          const SizedBox(
            height: 10,
          ),
          CustomTextFieldWidget(
            validator: (value) => AppFieldValidator.validatePhoneNumber(value),
            controller: controller.phone,
            icon: Iconsax.call,
            labelText: AppTexts.phoneNo,
          ),
          const SizedBox(
            height: 10,
          ),
          Obx(
            () => TextFormField(
              obscureText: controller.isHide.value,
              validator: (value) => AppFieldValidator.validatePassword(value),
              controller: controller.password,
              decoration: InputDecoration(
                filled: true,
                fillColor: AppColors.grey,
                border: const OutlineInputBorder(borderSide: BorderSide.none),
                prefixIcon: const Icon(Iconsax.password_check),
                labelText: AppTexts.password,
                suffixIcon: IconButton(
                  icon: Icon(controller.isHide.value
                      ? Iconsax.eye_slash
                      : Iconsax.eye),
                  onPressed: () =>
                      controller.isHide.value = !controller.isHide.value,
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          Obx(
            () => ButtonWidget(
              statusRequest: controller.statusRequest.value,
              onPress: () async => await controller.signUp(),
              text: AppTexts.createAccount,
            ),
          ),
        ],
      ),
    );
  }
}

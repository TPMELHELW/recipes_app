import 'package:flutter/material.dart';
import 'package:recipes_app/utils/constants/image_strings.dart';
import 'package:recipes_app/utils/constants/text_strings.dart';

class LoginHeaderWidget extends StatelessWidget {
  const LoginHeaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Image.asset(
          height: 150,
          AppImages.appLogo,
        ),
        Text(
          AppTexts.loginTitle,
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        const SizedBox(
          height: 8,
        ),
        Text(
          AppTexts.loginSubTitle,
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.bodyMedium,
        )
      ],
    );
  }
}

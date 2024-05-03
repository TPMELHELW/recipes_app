import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:recipes_app/features/authentication/controllers/on_boarding_controller.dart';
import 'package:recipes_app/features/authentication/models/on_boarding/on_boarding_data.dart';
import 'package:recipes_app/utils/constants/colors.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class BottomViewOnBoardingWidget extends StatelessWidget {
  final OnBoardingController controller;
  const BottomViewOnBoardingWidget({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: SmoothPageIndicator(
            controller: controller.pageController,
            count: onBoardingData.length,
            effect: const ExpandingDotsEffect(
                dotHeight: 6, activeDotColor: AppColors.dark),
          ),
        ),
        ElevatedButton(
          onPressed: controller.nextPage,
          child: const Icon(Iconsax.arrow_right_3),
        )
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:recipes_app/features/authentication/controllers/on_boarding_controller.dart';
import 'package:recipes_app/features/authentication/models/on_boarding/on_boarding_data.dart';

class OnBoardingWidget extends StatelessWidget {
  final OnBoardingController controller;
  const OnBoardingWidget({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: PageView.builder(
        onPageChanged: controller.onChangeIndex,
        controller: controller.pageController,
        itemCount: onBoardingData.length,
        itemBuilder: (context, index) {
          return Column(
            children: [
              Image.asset(onBoardingData[index].imagePath),
              Text(
                onBoardingData[index].title,
                style: Theme.of(context).textTheme.headlineMedium,
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 8,
              ),
              Text(
                onBoardingData[index].subtitle,
                style: Theme.of(context).textTheme.bodyMedium,
                textAlign: TextAlign.center,
              ),
            ],
          );
        },
      ),
    );
  }
}

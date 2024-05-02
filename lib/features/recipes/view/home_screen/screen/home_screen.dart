import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:recipes_app/features/recipes/controller/home_screen_controller.dart';
import 'package:recipes_app/features/recipes/view/home_screen/widget/custom_container_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<HomeScreenController>(
          init: HomeScreenController(),
          builder: (controller) {
            return ListView.builder(
                itemCount: controller.recipes.length,
                itemBuilder: (context, index) {
                  return CustomContainerWidget(
                    recipes: controller.recipes[index],
                  );
                });
          }),
    );
  }
}

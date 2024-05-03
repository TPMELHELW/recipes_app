import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:recipes_app/features/recipes/controller/home_screen_controller.dart';
import 'package:recipes_app/features/recipes/view/detail_screen/screen/detail_screen.dart';
import 'package:recipes_app/features/recipes/view/home_screen/widget/custom_container_widget.dart';

class HomeScreen extends StatelessWidget {
  final bool isFav;
  const HomeScreen({super.key, this.isFav = false});

  @override
  Widget build(BuildContext context) {
    HomeScreenController controller = HomeScreenController.instance;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        title: const Text('Welcome to Recipes Application'),
        leading: IconButton(
            onPressed: () => controller.signOut(),
            icon: const Icon(Iconsax.close_circle)),
      ),
      body: GetBuilder<HomeScreenController>(builder: (controller) {
        return ListView.builder(
            itemCount: isFav
                ? controller.favRecipes.length
                : controller.recipes.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  Get.to(
                    () => DetailScreen(
                      recipe: isFav
                          ? controller.favRecipes[index]
                          : controller.recipes[index],
                    ),
                  );
                },
                child: CustomContainerWidget(
                  isFav: isFav,
                  recipes: isFav
                      ? controller.favRecipes[index]
                      : controller.recipes[index],
                ),
              );
            });
      }),
    );
  }
}

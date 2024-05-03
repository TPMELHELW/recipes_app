import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:recipes_app/features/recipes/controller/detail_controller.dart';
import 'package:recipes_app/features/recipes/models/recipes_model.dart';
import 'package:recipes_app/features/recipes/view/detail_screen/widget/custom_sliver_bar.dart';
import 'package:recipes_app/features/recipes/view/detail_screen/widget/custom_tab_bar_widget.dart';

class DetailScreen extends StatelessWidget {
  final RecipesModel recipe;
  const DetailScreen({super.key, required this.recipe});

  @override
  Widget build(BuildContext context) {
    DetailController controller = Get.put(DetailController());
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          CustomSliverBar(
            controller: controller,
            recipe: recipe,
          ),
          CustomTabBarView(
            controller: controller,
            recipe: recipe,
          )
        ],
      ),
    );
  }
}

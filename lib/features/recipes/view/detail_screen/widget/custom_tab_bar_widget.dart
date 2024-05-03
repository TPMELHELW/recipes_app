import 'package:flutter/material.dart';
import 'package:recipes_app/features/recipes/controller/detail_controller.dart';
import 'package:recipes_app/features/recipes/models/recipes_model.dart';
import 'package:recipes_app/features/recipes/view/detail_screen/widget/ingredients_view.dart';
import 'package:recipes_app/features/recipes/view/detail_screen/widget/nutritional_value_widget.dart';

class CustomTabBarView extends StatelessWidget {
  final DetailController controller;
  final RecipesModel recipe;
  const CustomTabBarView(
      {super.key, required this.controller, required this.recipe});

  @override
  Widget build(BuildContext context) {
    return SliverFillRemaining(
      child: TabBarView(
        controller: controller.controller,
        children: [
          IngredientsWidget(recipe: recipe),
          NutritionalValueWidget(recipe: recipe)
        ],
      ),
    );
  }
}

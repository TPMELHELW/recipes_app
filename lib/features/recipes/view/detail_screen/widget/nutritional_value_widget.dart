import 'package:flutter/material.dart';
import 'package:recipes_app/features/recipes/models/recipes_model.dart';

class NutritionalValueWidget extends StatelessWidget {
  final RecipesModel recipe;
  const NutritionalValueWidget({super.key, required this.recipe});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Calories: ${recipe.calories}'),
          Text('Fats: ${recipe.fats}'),
          Text('Fibers: ${recipe.fibers}'),
          Text('Carbos: ${recipe.carbos}'),
          Text('Proteins: ${recipe.proteins}'),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:recipes_app/features/recipes/models/recipes_model.dart';

class IngredientsWidget extends StatelessWidget {
  final RecipesModel recipe;
  const IngredientsWidget({super.key, required this.recipe});

  @override
  Widget build(BuildContext context) {
    return ListView(
        physics: const NeverScrollableScrollPhysics(),
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        children: [
          ...List.generate(
              recipe.ingredients.length,
              (index) => Text(
                    recipe.ingredients[index],
                    style: Theme.of(context).textTheme.bodyLarge,
                  )),
          const SizedBox(
            height: 10,
          ),
          const Divider(
            thickness: 3,
          ),
          Text(
            recipe.description,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.bodyLarge,
          )
        ]);
  }
}

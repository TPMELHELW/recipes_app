import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:recipes_app/features/recipes/controller/home_screen_controller.dart';
import 'package:recipes_app/features/recipes/models/recipes_model.dart';
import 'package:recipes_app/utils/constants/colors.dart';

class CustomContainerWidget extends StatelessWidget {
  final RecipesModel recipes;
  final bool isFav;
  const CustomContainerWidget(
      {super.key, required this.recipes, required this.isFav});

  @override
  Widget build(BuildContext context) {
    final HomeScreenController controller = HomeScreenController.instance;
    bool isFavo = controller.favRecipes.contains(recipes);
    return Container(
      margin: const EdgeInsets.all(10),
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * 0.2,
      decoration: BoxDecoration(
        color: Colors.transparent,
        boxShadow: const [
          BoxShadow(
            color: Colors.black,
            spreadRadius: 0.2,
            offset: Offset(0, 0),
            blurRadius: 15,
            blurStyle: BlurStyle.outer,
          )
        ],
        borderRadius: BorderRadius.circular(20),
        image: DecorationImage(
          colorFilter:
              ColorFilter.mode(Colors.black.withOpacity(0.4), BlendMode.darken),
          fit: BoxFit.cover,
          image: NetworkImage(
            recipes.image,
          ),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            children: [
              IconButton(
                onPressed: () => isFavo
                    ? controller.deleteFavourite(recipes)
                    : controller.addFavourite(recipes),
                icon: Icon(
                  isFavo ? Iconsax.heart5 : Iconsax.heart,
                  color: AppColors.light,
                ),
              ),
            ],
          ),
          Text(
            recipes.name,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                  color: AppColors.light,
                ),
          ),
          Text(
            recipes.headline,
            textAlign: TextAlign.center,
            style: Theme.of(context)
                .textTheme
                .labelLarge!
                .copyWith(color: AppColors.lightGrey),
          ),
        ],
      ),
    );
  }
}

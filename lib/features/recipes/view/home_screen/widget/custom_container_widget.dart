import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:recipes_app/features/recipes/models/recipes_model.dart';
import 'package:recipes_app/utils/constants/colors.dart';

class CustomContainerWidget extends StatelessWidget {
  final RecipesModel recipes;
  const CustomContainerWidget({super.key, required this.recipes});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * 0.2,
      decoration: BoxDecoration(
        boxShadow: const [
          BoxShadow(
            color: Colors.black,
            spreadRadius: 0.2,
            offset: Offset(2, 4),
            blurRadius: 15,
            blurStyle: BlurStyle.outer,
          )
        ],
        borderRadius: BorderRadius.circular(20),
        image: DecorationImage(
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
                onPressed: () {},
                icon: const Icon(
                  Iconsax.heart,
                  color: AppColors.dark,
                ),
              ),
            ],
          ),
          Text(
            recipes.name,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          Text(
            recipes.headline,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.labelLarge,
          ),
        ],
      ),
    );
  }
}

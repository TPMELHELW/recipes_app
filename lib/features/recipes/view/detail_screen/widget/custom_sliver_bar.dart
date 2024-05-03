import 'package:flutter/material.dart';
import 'package:recipes_app/features/recipes/controller/detail_controller.dart';
import 'package:recipes_app/features/recipes/models/recipes_model.dart';

class CustomSliverBar extends StatelessWidget {
  final DetailController controller;
  final RecipesModel recipe;
  const CustomSliverBar(
      {super.key, required this.controller, required this.recipe});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      floating: true,
      pinned: true,
      backgroundColor: Colors.white,
      expandedHeight: 300,
      bottom: PreferredSize(
          preferredSize: const Size.fromHeight(70),
          child: Container(
            padding: const EdgeInsets.all(10),
            width: double.infinity,
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              ),
            ),
            child: TabBar(controller: controller.controller, tabs: const [
              Tab(
                text: 'Ingredients',
              ),
              Tab(
                text: 'Nutritional value',
              ),
            ]),
          )),
      flexibleSpace: FlexibleSpaceBar(
        background: Image.network(
          recipe.image,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}

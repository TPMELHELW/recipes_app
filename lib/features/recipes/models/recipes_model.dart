class RecipesModel {
  final String id;
  final String fats;
  final String name;
  final String image;
  final String carbos;
  final String fibers;
  final String calories;
  final String headline;
  final String proteins;
  final int difficulty;
  final String description;
  final bool highlighted;
  final List<String> ingredients;

  RecipesModel({
    required this.id,
    required this.fats,
    required this.name,
    required this.image,
    required this.carbos,
    required this.fibers,
    required this.calories,
    required this.headline,
    required this.proteins,
    required this.difficulty,
    required this.description,
    required this.highlighted,
    required this.ingredients,
  });

  factory RecipesModel.fromJson(Map<String, dynamic> json) {
    return RecipesModel(
        id: json['id'],
        fats: json['fats'],
        name: json['name'],
        image: json['image'],
        carbos: json['carbos'],
        fibers: json['fibers'],
        calories: json['calories'],
        headline: json['headline'],
        proteins: json['proteins'],
        difficulty: json['difficulty'],
        description: json['description'],
        highlighted: json['highlighted'],
        ingredients: json['ingredients'].cast<String>());
  }
  // id = json['id'];
  // fats = json['fats'];
  // name = json['name'];
  // image = json['image'];
  // carbos = json['carbos'];
  // fibers = json['fibers'];

  // calories = json['calories'];
  // headline = json['headline'];

  // proteins = json['proteins'];
  // difficulty = json['difficulty'];
  // description = json['description'];
  // highlighted = json['highlighted'];
  // ingredients = json['ingredients'].cast<String>();
  // Map<String, dynamic> toJson() {
  //   final Map<String, dynamic> data = new Map<String, dynamic>();
  //   data['id'] = this.id;
  //   data['fats'] = this.fats;
  //   data['name'] = this.name;
  //   data['image'] = this.image;
  //   data['carbos'] = this.carbos;
  //   data['fibers'] = this.fibers;

  //   data['calories'] = this.calories;
  //   data['headline'] = this.headline;

  //   data['proteins'] = this.proteins;
  //   data['difficulty'] = this.difficulty;
  //   data['description'] = this.description;
  //   data['highlighted'] = this.highlighted;
  //   data['ingredients'] = this.ingredients;

  //   return data;
  // }
}

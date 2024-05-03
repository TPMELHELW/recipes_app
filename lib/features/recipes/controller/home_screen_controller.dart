import 'package:get/get.dart';
import 'package:http/http.dart';
import 'package:recipes_app/data/auth_repository.dart';
import 'package:recipes_app/data/sql_crud.dart';
import 'package:recipes_app/features/recipes/models/recipes_model.dart';
import 'package:recipes_app/features/recipes/view/home_screen/screen/home_screen.dart';
import 'package:recipes_app/utils/function/snack_bar.dart';
import 'package:recipes_app/utils/http/http_client.dart';

class HomeScreenController extends GetxController {
  static HomeScreenController get instance => Get.find<HomeScreenController>();
  List<RecipesModel> recipes = [];
  List<Map> favRecipesId = [];
  final Rx<int> currentIndex = 0.obs;
  List<RecipesModel> favRecipes = [];
  final Crud _crud = Crud();
  final screens = [
    const HomeScreen(
      isFav: false,
    ),
    const HomeScreen(
      isFav: true,
    )
  ];

  final AuthRepository _auth = AuthRepository.instance;

  Future<void> signOut() async {
    await _auth.signOut();
    try {} catch (e) {
      showSnackbar('Error', e.toString());
    }
  }

  void onSelect(index) {
    currentIndex.value = index;
  }

  Future addFavourite(RecipesModel recipe) async {
    await _crud.insertData('''
INSERT INTO `recipes` (id) VALUES ('${recipe.id}');
''');
    favRecipes.add(recipe);
    update();
  }

  Future deleteFavourite(RecipesModel recipe) async {
    await _crud.deleteData('''
DELETE FROM recipes WHERE `id` = '${recipe.id}';
''');
    favRecipes.removeWhere((element) => element.id == recipe.id);
    update();
  }

  Future getData() async {
    try {
      final response = await HttpHelper(client: Client()).get();
      recipes.addAll(response);
      var favResponse = await _crud.readData('''
SELECT * FROM recipes;
''');
      for (Map recipe in favResponse) {
        var result = response.where((element) => element.id == recipe['id']);
        favRecipes.addAll(result);
      }
      update();
    } catch (e) {
      showSnackbar('Error', e.toString());
    }
    update();
  }

  @override
  void onInit() async {
    super.onInit();
    await getData();
  }
}

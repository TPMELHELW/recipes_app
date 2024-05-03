import 'package:get/get.dart';
import 'package:http/http.dart';
import 'package:recipes_app/features/recipes/models/recipes_model.dart';
import 'package:recipes_app/utils/function/snack_bar.dart';
import 'package:recipes_app/utils/http/http_client.dart';

class HomeScreenController extends GetxController {
  static HomeScreenController get instance => Get.find<HomeScreenController>();
  List<RecipesModel> recipes = [];

  @override
  void onInit() async {
    super.onInit();
    await getData();
  }

  Future getData() async {
    try {
      // print('s');
      final response = await HttpHelper(client: Client()).get();
      recipes.addAll(response);
      update();
      // print(recipes[0]);
    } catch (e) {
      // print(e);
      showSnackbar('Error', e.toString());
    }
    update();
  }
}

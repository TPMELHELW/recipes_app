import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:recipes_app/features/recipes/models/recipes_model.dart';
import 'package:recipes_app/utils/constants/api_constants.dart';

class HttpHelper {
  final http.Client client;

  HttpHelper({required this.client});

  Future<List<RecipesModel>> get() async {
    final response = await client.get(Uri.parse(recipesApi));
    if (response.statusCode == 200 || response.statusCode == 304) {
      List<dynamic> data = await json.decode(response.body);
      return data.map((data) => RecipesModel.fromJson(data)).toList();
    } else {
      throw Exception('Failed to load data: ${response.statusCode}');
    }
  }

  // static List<RecipesModel> _handleResponse(http.Response response) {

  // }
}

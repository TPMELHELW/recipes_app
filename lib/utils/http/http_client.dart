import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:recipes_app/utils/constants/api_constants.dart';

class HttpHelper {
  static Future<Map<String, dynamic>> get(String endpoint) async {
    final response = await http.get(Uri.parse(recipesApi));
    return _handleResponse(response);
  }

  static Map<String, dynamic> _handleResponse(http.Response response) {
    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to load data: ${response.statusCode}');
    }
  }
}

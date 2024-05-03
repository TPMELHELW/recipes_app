import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart';
import 'package:mocktail/mocktail.dart';
import 'package:recipes_app/features/recipes/models/recipes_model.dart';
import 'package:recipes_app/utils/constants/api_constants.dart';
import 'package:recipes_app/utils/http/http_client.dart';

class HttpMock extends Mock implements Client {}

void main() {
  late HttpHelper http;
  late HttpMock httpMock;
  setUp(() {
    httpMock = HttpMock();
    http = HttpHelper(client: httpMock);
  });

  group('httpRequest', () {
    test('getData', () async {
      when(() => httpMock.get(Uri.parse(recipesApi))).thenAnswer((_) async {
        return Response('''
 [
  {
        "id": "533143aaff604d567f8b4571",
        "fats": "8 g",
        "name": "Crispy Fish Goujons ",
        "image": "https://img.hellofresh.com/w_1080,f_webp,q_auto/hellofresh_s3/image/zartes-kokos-fischfilet-76aba609.jpg",
        "carbos": "47 g",
        "fibers": "",
        "calories": "516 kcal",
        "headline": "with Sweet Potato Wedges and Minted Snap Peas",
        "difficulty": 0,
        "proteins": "10",
        "description": "sdfasfaaasdf",
        "highlighted": true,
        "ingredients":["adadasdasd"]
    }
    ]''', 304);
      });
      expect(await http.get(), isA<List<RecipesModel>>());
      verify(() => httpMock.get(Uri.parse(recipesApi)));
    });
  });
}

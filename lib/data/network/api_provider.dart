import 'dart:convert';

import 'package:n8_default_project/models/app_model.dart';

import '../../models/universal_response.dart';
import 'package:http/http.dart' as http;

class ApiProvider {
  Future<UniversalResponse> getAllData() async {
    Uri uri = Uri.parse("https://www.freetogame.com/api/games");
    try {
      http.Response response = await http.get(uri);

      if (response.statusCode == 200) {
        return UniversalResponse(
            data: (jsonDecode(response.body) as List?)
                    ?.map((e) => AppModel.fromJson(e))
                    .toList() ??
                []);
      }
      return UniversalResponse(error: "ERROR");
    } catch (error) {
      return UniversalResponse(error: error.toString());
    }
  }
}

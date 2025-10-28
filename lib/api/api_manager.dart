import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:news_app/api/api_constants.dart';
import 'package:news_app/api/end_points.dart';
import 'package:news_app/model/SourceResponse.dart';

//https://newsapi.org/v2/top-headlines/sources?apiKey=45a3d7c771ac4e3a98681a58d848e3ec
class ApiManager {
  static Future<SourceResponse> getSources() async {
    Uri url = Uri.https(ApiConstants.baseUrl, EndPoints.sourceApi, {
      'apiKey': ApiConstants.apiKey,
    });
    try {
      var response = await http.get(url);
      //String responseBody=response.body; ///String
      //   var json=jsonDecode(responseBody);///String to json
      //   Sources.fromJson(json);///json to object
      return SourceResponse.fromJson(jsonDecode(response.body));
    } catch (e) {
      rethrow;
    }
  }
}

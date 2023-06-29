import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:http/http.dart';

class FetchNews {
  static fetchNews() async {
    Response response = await get(Uri.parse(
        'https://newsapi.org/v2/top-headlines?sources=google-news-in&apiKey=a56eb814a2b548dd829e6f2c77261594'));

    Map body_data = jsonDecode(response.body);
    print(body_data);
  }
}

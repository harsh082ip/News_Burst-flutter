import 'dart:convert';
import 'dart:math';

import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:newsburst/models/newsArticle.dart';

class FetchNews {
  static List sourcesId = [
    "abc-news",
    "bbc-news",
    "bbc-sport",
    "business-insider",
    "entertainment-weekly",
    "financial-post",
    "fox-news",
    "fox-sports",
    "google-news",
    "google-news-in",
    "news24",
    "new-scientist",
    "new-york-magazine",
    "next-big-future",
    "techcrunch",
    "techradar",
    "the-hindu",
    "the-wall-street-journal",
    "the-washington-times",
    "time",
    "usa-today",
  ];

  static Future<NewsArticle> fetchNews() async {
    final random = Random();
    var source = sourcesId[random.nextInt(sourcesId.length)];
    print(source);
    print('after...');
    Response response = await get(Uri.parse(
        'https://newsapi.org/v2/top-headlines?sources=$source&apiKey=0df3865357674f01bca7ec1636eb98fe'));

    Map body_data = jsonDecode(response.body);
    List articles = body_data['articles'];
    print(body_data);

    print('after...');
    final newRandom = Random();
    var myarticle = articles[random.nextInt(articles.length)];
    print(myarticle);

    // from model
    return NewsArticle.fromApitoApp(myarticle);
  }
}

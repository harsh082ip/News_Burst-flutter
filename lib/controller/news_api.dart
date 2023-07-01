import 'dart:convert';
import 'dart:math';

import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:newsburst/models/newsArticle.dart';

/* API Links

https://newsapi.org/v2/top-headlines?sources=google-news-in&apiKey=a56eb814a2b548dd829e6f2c77261594

https://newsapi.org/v2/top-headlines?country=in&apiKey=a56eb814a2b548dd829e6f2c77261594

https://newsapi.org/v2/top-headlines/sources?apiKey=a56eb814a2b548dd829e6f2c77261594

https://newsapi.org/v2/top-headlines/sources?apiKey=a56eb814a2b548dd829e6f2c77261594

*/
class FetchNews {
  static List sourcesId = [
    "abc-news",
    "bbc-news",
    "bbc-sport",
    "business-insider",
    "engadget",
    "entertainment-weekly",
    "espn",
    "espn-cric-info",
    "financial-post",
    "fox-news",
    "fox-sports",
    "globo",
    "google-news",
    "google-news-in",
    "medical-news-today",
    "national-geographic",
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
        'https://newsapi.org/v2/top-headlines?sources=$source&apiKey=a56eb814a2b548dd829e6f2c77261594'));

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

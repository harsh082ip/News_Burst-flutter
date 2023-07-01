import 'package:flutter/material.dart';
import 'package:newsburst/Views/widgets/news_container.dart';
import 'package:newsburst/controller/news_api.dart';
import 'package:newsburst/models/newsArticle.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late NewsArticle newsArticle = NewsArticle(
      imgUrl: '',
      newshead: 'newshead',
      newsDesc: 'newsDesc',
      newsCnt: 'newsCnt',
      newsUrl: 'newsUrl');

  getLatestNews() async {
    newsArticle = await FetchNews.fetchNews();
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    getLatestNews();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
          // itemCount: 10,
          scrollDirection: Axis.vertical,
          onPageChanged: (value) {
            getLatestNews();
          },
          itemBuilder: (context, index) {
            // FetchNews.fetchNews();
            double scrHeight = MediaQuery.of(context).size.height;
            print('Screen Height: $scrHeight');
            return NewsContainer(
              imgUrl: newsArticle.imgUrl,
              newsHeading: newsArticle.newshead,
              newsDesc: newsArticle.newsDesc,
              newsCnt: newsArticle.newsCnt,
              newsUrl: newsArticle.newsUrl,
            );
          }),
    );
  }
}

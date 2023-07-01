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
      imgUrl:
          'https://images.unsplash.com/photo-1504711434969-e33886168f5c?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1170&q=80',
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

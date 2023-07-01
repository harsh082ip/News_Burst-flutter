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
  late NewsArticle newsArticle;
  bool isLoading = true;

  getLatestNews() async {
    newsArticle = await FetchNews.fetchNews();
    setState(() {
      isLoading = false;
    });
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
            isLoading = true;
          },
          itemBuilder: (context, index) {
            // FetchNews.fetchNews();
            double scrHeight = MediaQuery.of(context).size.height;
            print('Screen Height: $scrHeight');
            return isLoading == true
                ? const Center(
                    child: CircularProgressIndicator(
                      color: Color.fromARGB(255, 253, 132, 105),
                    ),
                  )
                : NewsContainer(
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

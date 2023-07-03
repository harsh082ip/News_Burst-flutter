import 'package:flutter/material.dart';
import 'package:newsburst/Views/widgets/news_container.dart';
import 'package:newsburst/controller/news_api.dart';
import 'package:newsburst/models/newsArticle.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  NewsArticle? newsArticle; // Nullable NewsArticle
  bool isLoading = true;

  getLatestNews() async {
    final fetchedNewsArticle = await FetchNews.fetchNews();
    setState(() {
      newsArticle = fetchedNewsArticle;
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
        scrollDirection: Axis.vertical,
        onPageChanged: (value) {
          getLatestNews();
          isLoading = true;
        },
        itemBuilder: (context, index) {
          if (newsArticle == null ||
              newsArticle!.newsCnt == "---" ||
              newsArticle!.newsDesc == "---") {
            getLatestNews();
            isLoading = true;
            return const SizedBox();
          }

          double scrHeight = MediaQuery.of(context).size.height;
          print('Screen Height: $scrHeight');
          return isLoading == true
              ? const Center(
                  child: CircularProgressIndicator(
                    color: Color.fromARGB(255, 253, 132, 105),
                  ),
                )
              : NewsContainer(
                  imgUrl: newsArticle!.imgUrl,
                  newsHeading: newsArticle!.newshead,
                  newsDesc: newsArticle!.newsDesc,
                  newsCnt: newsArticle!.newsCnt,
                  newsUrl: newsArticle!.newsUrl,
                  newsAuthor: newsArticle!.newsauthor,
                );
        },
      ),
    );
  }
}

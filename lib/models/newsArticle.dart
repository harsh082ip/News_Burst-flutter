class NewsArticle {
  String imgUrl;
  String newshead;
  String newsDesc;
  String newsCnt;
  String newsUrl;

  NewsArticle(
      {required this.imgUrl,
      required this.newshead,
      required this.newsDesc,
      required this.newsCnt,
      required this.newsUrl});

  static NewsArticle fromApitoApp(Map<String, dynamic> article) {
    return NewsArticle(
        imgUrl: article['urlToImage'] ??
            'https://images.unsplash.com/photo-1504711434969-e33886168f5c?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1170&q=80',
        newshead: article['title'] ?? '---',
        newsDesc: article['description'] ?? '---',
        newsCnt: article['content'] ?? '---',
        newsUrl: article['url'] ??
            'https://news.google.com/home?hl=en-IN&gl=IN&ceid=IN:en');
  }
}

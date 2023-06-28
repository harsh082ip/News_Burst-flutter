import 'package:flutter/material.dart';
import 'package:newsburst/Views/widgets/news_container.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
          itemCount: 10,
          scrollDirection: Axis.vertical,
          itemBuilder: (context, index) {
            double scrHeight = MediaQuery.of(context).size.height;
            print('Screen Height: $scrHeight');
            return NewsContainer(
              imgUrl:
                  'https://images.unsplash.com/photo-1508921340878-ba53e1f016ec?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1170&q=80',
              newsHeading:
                  'Generative AI promises a new frontier for Indian companies',
              newsDesc:
                  'With generative AI booming, the human value will lie in performing high-value jobs, such as engaging with customers and building relationships,” said Deepak Pargaonkar. As more and more companies are embracing generative AI, there is optimism and some apprehension.',
              newsUrl:
                  'https://indianexpress.com/article/technology/tech-news-technology/generative-ai-in-india-deepak-pargaonkar-salesforce-interview-8690944/',
            );
          }),
    );
  }
}

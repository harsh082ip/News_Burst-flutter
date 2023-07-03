import 'package:flutter/material.dart';
import 'package:newsburst/Views/detailed_view.dart';

class NewsContainer extends StatelessWidget {
  String imgUrl;
  String newsHeading;
  String newsDesc;
  String newsUrl;
  String newsCnt;
  String newsAuthor;
  NewsContainer(
      {super.key,
      required this.imgUrl,
      required this.newsHeading,
      required this.newsDesc,
      required this.newsUrl,
      required this.newsCnt,
      required this.newsAuthor});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: Column(
        children: [
          FadeInImage.assetNetwork(
              height: MediaQuery.of(context).size.height * 0.430,
              width: MediaQuery.of(context).size.width,
              fit: BoxFit.cover,
              placeholder: 'assets/images/placeholder_img.avif',
              image: imgUrl),
          const SizedBox(
            height: 5.0,
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Column(
              children: [
                Text(
                  newsHeading,
                  style: const TextStyle(
                      fontSize: 22.0, fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 5.0,
                ),
                Text(
                  newsDesc,
                  style: const TextStyle(
                      fontSize: 14.0,
                      color: Colors.grey,
                      fontWeight: FontWeight.w400),
                ),
                Text(
                  newsCnt == '---'
                      ? newsCnt
                      : newsCnt.length > 250
                          ? '${newsCnt.substring(0, 250)}...'
                          : '${newsCnt.substring(0, newsCnt.length > 15 ? newsCnt.length - 15 : 0)}...',
                  style: const TextStyle(
                      fontSize: 17.0, fontWeight: FontWeight.w400),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 5.0,
          ),
          newsAuthor == 'undefined'
              ? const Text('')
              : Align(
                  alignment: Alignment.topLeft,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Text(
                      'Author: $newsAuthor',
                      style: const TextStyle(
                          fontSize: 20.0,
                          color: Color.fromARGB(255, 0, 0, 0),
                          fontFamily: 'Agdasima',
                          letterSpacing: 3.0,
                          fontWeight: FontWeight.w600,
                          decoration: TextDecoration.underline),
                    ),
                  )),
          const Spacer(),
          Align(
            alignment: Alignment.bottomRight,
            child: Padding(
              padding: const EdgeInsets.only(right: 10.0, bottom: 8.0),
              child: ElevatedButton(
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(
                        const Color.fromARGB(255, 253, 132, 105))),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              DetailedView(newsUrl: newsUrl)));
                },
                child: const Text(
                  'Read more',
                  style: TextStyle(color: Colors.white, fontSize: 15.0),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

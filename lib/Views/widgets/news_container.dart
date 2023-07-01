import 'package:flutter/material.dart';
import 'package:newsburst/Views/detailed_view.dart';

class NewsContainer extends StatelessWidget {
  String imgUrl;
  String newsHeading;
  String newsDesc;
  String newsUrl;
  String newsCnt;
  NewsContainer(
      {super.key,
      required this.imgUrl,
      required this.newsHeading,
      required this.newsDesc,
      required this.newsUrl,
      required this.newsCnt});

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
          SizedBox(
            height: 5.0,
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 8.0),
            child: Column(
              children: [
                Text(
                  newsHeading,
                  style: TextStyle(fontSize: 22.0, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 5.0,
                ),
                Text(
                  newsDesc,
                  style: TextStyle(
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
                  style: TextStyle(fontSize: 17.0, fontWeight: FontWeight.w400),
                ),
              ],
            ),
          ),
          Spacer(),
          Align(
              alignment: Alignment.bottomRight,
              child: Padding(
                padding: const EdgeInsets.only(right: 10.0, bottom: 8.0),
                child: ElevatedButton(
                    style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(
                            Color.fromARGB(255, 253, 132, 105))),
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
                    )),
              ))
        ],
      ),
    );
  }
}

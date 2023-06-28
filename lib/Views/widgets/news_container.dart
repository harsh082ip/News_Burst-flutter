import 'package:flutter/material.dart';

class NewsContainer extends StatelessWidget {
  String imgUrl;
  String newsHeading;
  String newsDesc;
  String newsUrl;
  NewsContainer(
      {super.key,
      required this.imgUrl,
      required this.newsHeading,
      required this.newsDesc,
      required this.newsUrl});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: Column(
        children: [
          Image.network(
              height: MediaQuery.of(context).size.height * 0.430,
              width: MediaQuery.of(context).size.width,
              fit: BoxFit.cover,
              imgUrl),
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
                        backgroundColor:
                            MaterialStateProperty.all(Colors.redAccent)),
                    onPressed: () {},
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

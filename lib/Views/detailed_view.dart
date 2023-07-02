import 'dart:async';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class DetailedView extends StatefulWidget {
  String newsUrl;
  DetailedView({Key? key, required this.newsUrl}) : super(key: key);

  @override
  State<DetailedView> createState() => _DetailedViewState();
}

class _DetailedViewState extends State<DetailedView> {
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    setState(() {
      widget.newsUrl = widget.newsUrl.contains('http:')
          ? widget.newsUrl.replaceAll('http:', 'https:')
          : widget.newsUrl;
    });
  }

  final Completer<WebViewController> controller =
      Completer<WebViewController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 253, 132, 105),
        title: const Text(
          'News Burst',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Stack(
        children: [
          WebView(
            initialUrl: widget.newsUrl,
            javascriptMode: JavascriptMode.unrestricted,
            onPageStarted: (_) {
              setState(() {
                _isLoading = true;
              });
            },
            onPageFinished: (_) {
              setState(() {
                _isLoading = false;
              });
            },
            onWebViewCreated: (WebViewController webViewController) {
              setState(() {
                controller.complete(webViewController);
              });
            },
          ),
          if (_isLoading)
            const Center(
              child: CircularProgressIndicator(
                color: Color.fromARGB(255, 253, 132, 105),
              ),
            ),
        ],
      ),
    );
  }
}

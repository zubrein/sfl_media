import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:sfl_media/features/home/ui/html_content.dart';
import 'package:sfl_media/features/shared/app_bar.dart';

import '../domain/entities/news.dart';

class DetailsPage extends StatefulWidget {
  final News news;

  const DetailsPage({super.key, required this.news});

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  InAppWebViewController? webViewController;

  bool load = false;

  @override
  void initState() {
    super.initState();
    loadWebView();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: SharedAppBar(),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: load
            ? Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: InAppWebView(
                  initialUrlRequest: URLRequest(
                      url: Uri.dataFromString(
                    prepareHtmlContent(
                      title: widget.news.title,
                      youtubeUrl: widget.news.videoUrl ?? '',
                      htmlContent: widget.news.description,
                      thumbnail: widget.news.thumbnailImage,
                      authorAndDate:
                          '${widget.news.author} | ${widget.news.date}',
                    ),
                    mimeType: 'text/html',
                    encoding: Encoding.getByName('utf-8'),
                  )),
                  onWebViewCreated: (InAppWebViewController controller) {
                    webViewController = controller;
                  },
                  initialOptions: InAppWebViewGroupOptions(
                      crossPlatform: InAppWebViewOptions(
                          javaScriptEnabled: true,
                          horizontalScrollBarEnabled: false,
                          verticalScrollBarEnabled: false)),
                ),
              )
            : const SizedBox.shrink(),
      ),
    );
  }

  void loadWebView() {
    Future.delayed(const Duration(milliseconds: 500)).then((value) {
      load = true;
      setState(() {});
    });
  }
}

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:sfl_media/features/home/ui/html_content.dart';

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
      appBar: AppBar(
        titleSpacing: 0.0,
        title: _buildBanner(),
        backgroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: load
            ? Padding(
                padding: const EdgeInsets.all(16.0),
                child: InAppWebView(
                  initialUrlRequest: URLRequest(
                      url: Uri.dataFromString(
                    prepareHtmlContent(
                      title: widget.news.title,
                      youtubeUrl: widget.news.videoUrl ?? '',
                      htmlContent: widget.news.description,
                      thumbnail: widget.news.thumbnailImage,
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

  Widget _buildBanner() {
    return Padding(
      padding: const EdgeInsets.only(right: 40.0),
      child: Center(
        child: Image.asset(
          'assets/images/banner_sfl_short.png',
          height: 40,
          width: 180,
        ),
      ),
    );
  }

  @override
  void dispose() {
    webViewController?.clearCache();
    super.dispose();
  }
}

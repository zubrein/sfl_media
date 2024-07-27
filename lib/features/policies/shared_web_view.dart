import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:sfl_media/core/logger.dart';

class SharedWebView extends StatefulWidget {
  final String url;

  const SharedWebView({super.key, required this.url});

  @override
  State<SharedWebView> createState() => _SharedWebViewState();
}

class _SharedWebViewState extends State<SharedWebView> {
  InAppWebViewController? webViewController;
  bool load = false;
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    loadWebView();
  }

  @override
  Widget build(BuildContext context) {
    return load
        ? Stack(
            children: [
              InAppWebView(
                initialUrlRequest: URLRequest(url: Uri.parse(widget.url)),
                onWebViewCreated: (InAppWebViewController controller) {
                  webViewController = controller;
                },
                initialOptions: InAppWebViewGroupOptions(
                    crossPlatform: InAppWebViewOptions(
                        javaScriptEnabled: true,
                        horizontalScrollBarEnabled: false,
                        verticalScrollBarEnabled: false)),
                onLoadStop: (_, url) async {
                  await Future.delayed(const Duration(seconds: 2))
                      .then((value) {
                    setState(() {
                      isLoading = false;
                    });
                  });
                },
                onProgressChanged: (controller, progress) async {
                  if (progress > 30) {
                    webViewController
                        ?.evaluateJavascript(
                            source:
                                "javascript:(function() { var head = document.getElementsByTagName('header')[0];head.parentNode.removeChild(head);var footer = document.getElementsByTagName('footer')[0];footer.parentNode.removeChild(footer);})()")
                        .catchError((error) {
                      Log.error('WebView error', error, StackTrace.current);
                    });
                  }
                },
              ),
              isLoading
                  ? const SizedBox(
                      height: double.infinity,
                      width: double.infinity,
                      child: ColoredBox(
                          color: Colors.white,
                          child: Center(child: CircularProgressIndicator())))
                  : const SizedBox(),
            ],
          )
        : const SizedBox.shrink();
  }

  void loadWebView() {
    Future.delayed(const Duration(milliseconds: 500)).then((value) {
      load = true;
      setState(() {});
    });
  }
}

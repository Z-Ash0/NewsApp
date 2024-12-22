import 'package:flutter/material.dart';
import 'package:news_app_ui_setup/widgets/app_bar.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebviewPage extends StatefulWidget {
  const WebviewPage({super.key, required this.url});
  final String url;

  @override
  State<WebviewPage> createState() => _WebviewPageState();
}

class _WebviewPageState extends State<WebviewPage> {
  late WebViewController controller;
  var loadingPercent = 0;
  @override
  void initState() {
    super.initState();
    controller = WebViewController()
      ..setNavigationDelegate(
        NavigationDelegate(
          onPageStarted: (url) {
            setState(() {
              loadingPercent = 0;
            });
          },
          onProgress: (progress) {
            setState(() {
              loadingPercent = progress;
            });
          },
          onPageFinished: (url) {
            setState(() {
              loadingPercent = 100;
            });
          },
        ),
      )
      ..loadRequest(Uri.parse(widget.url));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const NewsAppBar(),
      body: Stack(
        children: [
          WebViewWidget(
            controller: controller,
          ),
          loadingPercent < 100
              ? LinearProgressIndicator(
                  color: const Color(0xFFCBDF1A),
                  value: loadingPercent / 100.0,
                )
              : Container()
        ],
      ),
    );
  }
}

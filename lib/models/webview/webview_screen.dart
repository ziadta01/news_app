import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebScreen extends StatelessWidget {

  final String? url;
  final String? title;

  const WebScreen({required this.url,required this.title, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title!),
      ),
      body: WebView(
        initialUrl: '$url',
      ),
    );
  }
}

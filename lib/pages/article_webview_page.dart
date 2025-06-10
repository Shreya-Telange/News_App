import 'dart:io' show Platform;
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class ArticleWebViewPage extends StatelessWidget {
  final String url;
  const ArticleWebViewPage({super.key, required this.url});

  @override
  Widget build(BuildContext context) {
    if (kIsWeb) {
      _launchWebURL();
      return Scaffold(
        appBar: AppBar(title: const Text('Opening in browser...')),
        body: const Center(child: CircularProgressIndicator()),
      );
    }

    return Scaffold(
      appBar: AppBar(title: const Text("Article")),
      body: WebViewWidget(
        controller: WebViewController()..loadRequest(Uri.parse(url)),
      ),
    );
  }

  void _launchWebURL() async {
    final uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    }
  }
}

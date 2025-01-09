import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewScreen extends StatefulWidget {
  const WebViewScreen({super.key, required this.paymentUrl});
  final String paymentUrl;

  @override
  State<WebViewScreen> createState() => _WebViewScreenState();
}

class _WebViewScreenState extends State<WebViewScreen> {
  late final WebViewController _controller;
  bool canGoBack = false;

  @override
  void initState() {
    super.initState();

    // Initialize the WebViewController
    _controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setNavigationDelegate(
        NavigationDelegate(
          onProgress: (int progress) {
            // Optionally handle loading progress
            log('Loading progress: $progress%');
          },
          onPageStarted: (String url) {
            log('Page started loading: $url');
          },
          onPageFinished: (String url) async {
            log('Page finished loading: $url');

            // Check if WebView can go back
          },
          onNavigationRequest: (NavigationRequest request) {
            if (request.url.startsWith('https://www.youtube.com/')) {
              return NavigationDecision.prevent;
            }
            return NavigationDecision.navigate;
          },
        ),
      )
      ..loadRequest(Uri.parse(widget.paymentUrl));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Paystack Payment'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () async {
            if (canGoBack) {
              // Navigate back within the WebView
              await _controller.goBack();
            } else {
              // Pop the WebView screen when no pages to go back
              Navigator.of(context).pop();
            }
          },
        ),
      ),
      body: WebViewWidget(
        controller: _controller,
      ),
    );
  }
}

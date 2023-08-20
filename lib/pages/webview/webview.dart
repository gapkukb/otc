import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

class Webview extends StatefulWidget {
  final String url;

  const Webview({
    super.key,
    required this.url,
  });

  @override
  State<Webview> createState() => _WebviewState();
}

class _WebviewState extends State<Webview> {
  @override
  Widget build(BuildContext context) {
    return InAppWebView(
      initialSettings: InAppWebViewSettings(
        // useShouldOverrideUrlLoading: true,
        // mediaPlaybackRequiresUserGesture: false,
        // allowsInlineMediaPlayback: true,
        // iframeAllow: "camera; microphone",
        iframeAllowFullscreen: true,
      ),
      initialUrlRequest: URLRequest(
        url: WebUri('https://flutter.dev'),
      ),
    );
  }
}

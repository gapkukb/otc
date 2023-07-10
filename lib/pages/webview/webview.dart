import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class Webview extends StatefulWidget {
  final String url;
  final Function(JavaScriptMessage message)? onMessage;
  const Webview({
    super.key,
    required this.url,
    this.onMessage,
  });

  @override
  State<Webview> createState() => _WebviewState();
}

class _WebviewState extends State<Webview> {
  String? title;

  final WebViewController controller = WebViewController()
    ..setJavaScriptMode(JavaScriptMode.unrestricted)
    ..setBackgroundColor(Colors.white)
    ..setNavigationDelegate(
      NavigationDelegate(
        onProgress: (progress) {},
        onPageStarted: (url) {},
        onPageFinished: (url) {},
        onWebResourceError: (error) {},
        onNavigationRequest: (request) {
          // if (request.url.startsWith("https://www.youtube.com")) {
          //   // 阻止加载内容
          //   return NavigationDecision.prevent;
          // }
          return NavigationDecision.navigate;
        },
      ),
    )
    ..runJavaScript("window.inApp = true")
    ..loadFlutterAsset('assets/htmls/test.html');

  @override
  void initState() {
    if (widget.onMessage != null) {
      controller.addJavaScriptChannel(
        "App",
        onMessageReceived: widget.onMessage!,
      );
    }
    controller.getTitle().then((value) {
      setState(() {
        title = value;
      });
    });
    super.initState();
  }

  @override
  void dispose() {
    controller.removeJavaScriptChannel("App");
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title ?? ""),
      ),
      body: WebViewWidget(controller: controller),
    );
  }
}

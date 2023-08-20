import 'package:flutter/material.dart';
import 'package:otc/components/modal/modal.dart';
import 'package:qr_code_scanner/src/web/jsqr.dart';
import 'dart:html' as html;
import 'dart:async';
import 'dart:js';

bool loaded = false;

class QrcodeImageParser extends StatefulWidget {
  final Widget? child;
  const QrcodeImageParser({
    super.key,
    this.child,
  });

  @override
  State<QrcodeImageParser> createState() => _QrcodeImageParserState();

  static Future<String> parse(String path) {
    final completer = Completer<String>();
    final image = html.ImageElement();
    image.src = path;
    image.onLoad.listen((event) {
      final canvas = html.CanvasElement(width: image.width, height: image.height);
      final ctx = canvas.context2D;
      ctx.drawImage(image, 0, 0);

      final imgData = ctx.getImageData(0, 0, canvas.width!, canvas.height!);

      final code = jsQR(imgData.data, canvas.width, canvas.height);
      completer.complete(code.data);
    });

    image.onError.listen((event) {
      completer.completeError("图片加载失败");
    });

    return completer.future;
  }
}

class _QrcodeImageParserState extends State<QrcodeImageParser> {
  @override
  void initState() {
    super.initState();
    _load();
  }

  Future<void> _load() async {
    if (loaded) return;
    context.callMethod('fixRequireJs');
    final close = Modal.showLoading("正在加载二维码解析组件...");
    final completer = Completer();
    final script = html.ScriptElement()
      ..setAttribute("type", "application/javascript")
      ..setAttribute("src", "https://cdn.jsdelivr.net/npm/jsqr@1.3.1/dist/jsQR.min.js?v=1")
      ..addEventListener("load", (event) {
        loaded = true;
        close();
        completer.complete();
      })
      ..addEventListener("error", (event) {
        close();
        Modal.showText(text: "组件加载失败，请检查网络或刷新重试");
        completer.completeError("组件加载失败");
      });
    html.document.body!.append(script);
    return completer.future;
  }

  @override
  Widget build(BuildContext context) {
    return widget.child ?? const SizedBox.shrink();
  }
}

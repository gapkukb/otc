import 'package:bot_toast/bot_toast.dart';
import 'package:clipboard/clipboard.dart';
import 'package:flutter/material.dart';

class UiClipboard extends StatelessWidget {
  final String? text;
  final String toolTipText;
  final String successMesasge;
  final String? failedMesasge;
  final Function(String text)? successHandle;
  final Function(dynamic error)? failedHandle;

  const UiClipboard({
    super.key,
    this.text,
    this.toolTipText = "复制",
    this.successMesasge = "复制成功!",
    this.failedMesasge,
    this.failedHandle,
    this.successHandle,
  });

  @override
  Widget build(BuildContext context) {
    return Tooltip(
      message: toolTipText,
      child: IconButton(
        onPressed: () async {
          if (text == null || text == "") return;
          FlutterClipboard.copy(text!).then((value) {
            BotToast.showText(text: successMesasge);
            successHandle?.call(text!);
          }).catchError((error) {
            failedHandle?.call(error);
          });
        },
        icon: const Icon(Icons.copy),
      ),
    );
  }
}

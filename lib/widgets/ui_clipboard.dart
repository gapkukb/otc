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
  final double? iconSize;
  final Widget? child;

  const UiClipboard({
    super.key,
    this.text,
    this.toolTipText = "复制",
    this.successMesasge = "复制成功!",
    this.failedMesasge,
    this.failedHandle,
    this.successHandle,
    this.iconSize,
    this.child,
  });

  @override
  Widget build(BuildContext context) {
    var button = Tooltip(
      message: toolTipText,
      child: SizedBox.square(
        dimension: iconSize == null ? null : iconSize! * 2,
        child: IconButton(
          iconSize: iconSize,
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
      ),
    );

    if (child == null) return button;
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [Flexible(child: child!), button],
    );
  }
}

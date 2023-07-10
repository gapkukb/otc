import 'package:flutter/material.dart';
import 'package:otc/apis/apis.dart';
import 'package:otc/components/modal/modal.dart';
import 'package:otc/utils/string.dart';
import 'package:otc/widgets/ui_button.dart';

class NoticeDetail {}

showNotice({
  required String dateTime,
  required String title,
  required String amount,
}) {
  Modal.showNotification(
    margin: EdgeInsets.zero,
    duration: const Duration(seconds: 10),
    wrapToastAnimation: (controller, cancelFunc, widget) {
      return Align(
        alignment: Alignment.topRight,
        child: Material(
          elevation: 10,
          borderRadius: BorderRadius.circular(16),
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 280),
            child: widget,
          ),
        ),
      );
    },
    title: (cancelFunc) {
      return const Text(
        "通知详情",
        style: TextStyle(
          fontWeight: FontWeight.w500,
        ),
      );
    },
    subtitle: (cancelFunc) {
      return Padding(
        padding: const EdgeInsets.only(top: 8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              dateTime,
            ),
            Text(
              title,
            ),
            const SizedBox(height: 8),
            Text(
              amount.breakWord,
              style: const TextStyle(
                fontSize: 12,
                color: Colors.grey,
              ),
            ),
            UiButton(
              variant: UiButtonVariant.text,
              size: UiButtonSize.small,
              onPressed: cancelFunc,
              label: "知道了",
            )
          ],
        ),
      );
    },
  );
}

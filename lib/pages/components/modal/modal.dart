import 'package:bot_toast/bot_toast.dart';
import 'package:bot_toast/src/toast_widget/animation.dart'
    show loadingAnimation;
import 'package:flutter/material.dart';

class Modal {
  static const showAnimationWidget = BotToast.showAnimationWidget;
  static const showAttachedWidget = BotToast.showAttachedWidget;
  static const showCustomLoading = BotToast.showCustomLoading;
  static const showCustomNotification = BotToast.showCustomNotification;
  static const showCustomText = BotToast.showCustomText;
  static const showEnhancedWidget = BotToast.showEnhancedWidget;
  static const showLoading = BotToast.showLoading;
  static const showNotification = BotToast.showNotification;
  static const showSimpleNotification = BotToast.showSimpleNotification;
  static const showText = BotToast.showText;
  static const showWidget = BotToast.showWidget;

  static CancelFunc show({
    String okText = "确定",
    String cancelText = "取消",
    String title = "温馨提示",
    String content = "",
    bool asynClose = false,
    Function()? onOk,
    Function()? onDecline,
  }) {
    return BotToast.showAnimationWidget(
      animationDuration: const Duration(milliseconds: 300),
      wrapAnimation: loadingAnimation,
      backgroundColor: Colors.black45,
      crossPage: false,
      toastBuilder: (cancelFunc) {
        return AlertDialog(
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(4),
            ),
          ),
          title: Text(title),
          content: Text(content),
          actions: <Widget>[
            TextButton(
              child: Text(cancelText),
              onPressed: () {
                if (asynClose == false) {
                  cancelFunc();
                  onDecline?.call();
                }
              },
            ),
            TextButton(
              child: Text(okText),
              onPressed: () {
                if (asynClose == false) {
                  cancelFunc();
                  onOk?.call();
                }
              },
            ),
          ],
        );
      },
    );
  }
}

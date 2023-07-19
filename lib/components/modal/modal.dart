library modal;

import 'package:bot_toast/bot_toast.dart';
import 'package:bot_toast/src/toast_widget/animation.dart'
    show loadingAnimation;
import 'package:flutter/material.dart';
import 'package:otc/router/router.dart';
import 'package:otc/theme/padding.dart';
import 'package:otc/theme/text_theme.dart';
import 'package:otc/widgets/ui_button.dart';

part './modal_bottom_sheet_item.dart';

class Modal {
  static const showAnimationWidget = BotToast.showAnimationWidget;
  static const showAttachedWidget = BotToast.showAttachedWidget;
  static const showCustomLoading = BotToast.showCustomLoading;
  static const showCustomNotification = BotToast.showCustomNotification;
  static const showCustomText = BotToast.showCustomText;
  static const showEnhancedWidget = BotToast.showEnhancedWidget;
  static void Function() showLoading([String? message]) {
    if (message == null) {
      return BotToast.showLoading();
    }
    return BotToast.showLoading(
      wrapToastAnimation: (controller, cancelFunc, widget) {
        return Container(
          decoration: BoxDecoration(
            color: Colors.black54,
            borderRadius: BorderRadius.circular(8),
          ),
          padding: Pads.sm,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const CircularProgressIndicator(
                backgroundColor: Colors.white,
              ),
              const SizedBox(height: 16),
              Text(
                message,
                style: Font.miniGrey,
              )
            ],
          ),
        );
      },
    );
  }

  static const showNotification = BotToast.showNotification;
  static const showSimpleNotification = BotToast.showSimpleNotification;
  static const showText = BotToast.showText;
  static const showWidget = BotToast.showWidget;

  static CancelFunc alert({
    String okButtonText = "确定",
    String title = "温馨提示",
    String content = "",
    bool asyncClose = false,
    Widget? widget,
    Function()? onOk,
  }) {
    return Modal.show(
      okButtonText: okButtonText,
      title: title,
      content: content,
      asyncClose: asyncClose,
      onOk: onOk,
      widget: widget,
    );
  }

  static CancelFunc confirm({
    String okButtonText = "确定",
    String cancelText = "取消",
    String title = "温馨提示",
    String content = "",
    Widget? widget,
    bool asyncClose = false,
    Function()? onOk,
    Function()? onDecline,
  }) {
    return Modal.show(
      okButtonText: okButtonText,
      cancelButtonText: cancelText,
      title: title,
      content: content,
      asyncClose: asyncClose,
      onOk: onOk,
      onDecline: onDecline,
      widget: widget,
    );
  }

  static CancelFunc show({
    String okButtonText = "确定",
    String? cancelButtonText,
    String title = "温馨提示",
    String content = "",
    Widget? widget,
    bool asyncClose = false,
    UiButtonVariant? okButtonVariant,
    UiButtonVariant? cancelButtonVariant,
    Function()? onOk,
    Function()? onDecline,
  }) {
    return BotToast.showAnimationWidget(
      animationDuration: const Duration(milliseconds: 300),
      wrapAnimation: loadingAnimation,
      backgroundColor: Colors.black45,
      crossPage: false,
      allowClick: false,
      clickClose: true,
      toastBuilder: (cancelFunc) {
        return AlertDialog(
          backgroundColor: Colors.white,
          actionsPadding: const EdgeInsets.all(8),
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(16),
            ),
          ),
          title: Text(title),
          content: widget ?? Text(content),
          actions: <Widget>[
            if (cancelButtonText != null)
              UiButton(
                variant: cancelButtonVariant ?? UiButtonVariant.text,
                label: cancelButtonText,
                minWidth: 60,
                onPressed: () {
                  if (asyncClose == false) {
                    cancelFunc();
                    onDecline?.call();
                  }
                },
              ),
            UiButton(
              variant: okButtonVariant ?? UiButtonVariant.text,
              label: okButtonText,
              minWidth: 60,
              onPressed: () {
                if (asyncClose == false) {
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

  static const showBottomSheet = modalShowBottomSheet;
}

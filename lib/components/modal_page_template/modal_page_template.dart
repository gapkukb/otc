import 'dart:async';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:otc/theme/text_theme.dart';
import 'package:otc/widgets/ui_button.dart';

class ModalPageTemplate extends StatelessWidget {
  final String legend;
  final String? title;
  final String okButtonText;
  final String cancelButtonText;
  final bool? filledButton;
  final bool? showCancelButton;
  final bool? showOkButton;
  final IconData iconData;
  final Widget? icon;
  final List<Widget> children;
  final ScrollPhysics? physics;
  final double maxWidth;
  final FutureOr<void> Function(BuildContext context) onCompelete;
  final FutureOr<void> Function(BuildContext context)? onCancel;

  const ModalPageTemplate({
    super.key,
    this.legend = "账户安全",
    this.okButtonText = "确定",
    this.cancelButtonText = "取消",
    this.iconData = Icons.security,
    this.title,
    required this.onCompelete,
    required this.children,
    this.icon,
    this.onCancel,
    this.physics,
    this.maxWidth = 460,
    this.filledButton = true,
    this.showCancelButton,
    this.showOkButton,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        child: ConstrainedBox(
          constraints: BoxConstraints(
            maxWidth: maxWidth,
            // maxHeight: MediaQuery.of(context).size.height - 100,
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 16),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: Stack(
                    children: [
                      SizedBox(
                        height: 48,
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            title!,
                            style: Font.largeBold,
                          ),
                        ),
                      ),
                      Positioned(
                        right: 0,
                        top: 0,
                        child: IconButton(
                          constraints: const BoxConstraints(
                            maxWidth: 48,
                            maxHeight: 48,
                          ),
                          onPressed: () {
                            context.pop();
                          },
                          icon: const Icon(Icons.close_outlined, size: 24),
                        ),
                      )
                    ],
                  ),
                ),
                const Divider(height: 33, thickness: 1),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: ConstrainedBox(
                    constraints: BoxConstraints(
                      maxHeight: MediaQuery.of(context).size.height - 260,
                    ),
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: children,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: _buildActions(context),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  _buildActions(BuildContext context) {
    bool disabled = false;
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        if (showCancelButton != false)
          UiButton.text(
            child: Text(cancelButtonText),
            onPressed: () {
              onCancel?.call(context) ?? Navigator.of(context).maybePop();
            },
          ),
        if (showOkButton != false)
          UiButton(
            variant: filledButton == true ? UiButtonVariant.filled : UiButtonVariant.text,
            onPressed: () async {
              if (disabled) return;
              try {
                disabled = true;
                await onCompelete(context);
              } finally {
                disabled = false;
              }
            },
            child: Text(okButtonText),
          ),
      ],
    );
  }
}

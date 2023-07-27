import 'dart:async';

import 'package:flutter/material.dart';
import 'package:otc/theme/text_theme.dart';
import 'package:otc/widgets/ui_button.dart';

class ModalPageTemplate extends StatelessWidget {
  final String legend;
  final String title;
  final String nextText;
  final bool? filledButton;
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
    this.nextText = "确定",
    this.iconData = Icons.security,
    required this.title,
    required this.onCompelete,
    required this.children,
    this.icon,
    this.onCancel,
    this.physics,
    this.maxWidth = 460,
    this.filledButton,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        physics: physics,
        child: Card(
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: ConstrainedBox(
              constraints: BoxConstraints(
                maxWidth: maxWidth,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ListTile(
                    contentPadding: const EdgeInsets.all(0),
                    title: Padding(
                      padding: const EdgeInsets.only(bottom: 8.0),
                      child: Text(
                        legend,
                        style: const TextStyle(
                          color: Color(0xff7C7C7C),
                        ),
                      ),
                    ),
                    subtitle: Padding(
                      padding: const EdgeInsets.only(top: 24),
                      child: Text(
                        title,
                        style: Font.largeBold,
                      ),
                    ),
                    trailing: Opacity(
                      opacity: 0.2,
                      child: icon ??
                          Icon(
                            iconData,
                            size: 40,
                          ),
                    ),
                  ),
                  const SizedBox(height: 8),
                  const Divider(height: 1),
                  const SizedBox(height: 24),
                  ...children,
                  const SizedBox(height: 24),
                  _buildActions(context),
                ],
              ),
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
        TextButton(
          child: const Text("取消"),
          onPressed: () {
            onCancel?.call(context) ?? Navigator.of(context).maybePop();
          },
        ),
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
          child: Text(nextText),
        ),
      ],
    );
  }
}

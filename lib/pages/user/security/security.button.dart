import 'package:flutter/material.dart';
import 'package:otc/utils/predication.dart';
import 'package:otc/widgets/ui_button.dart';

class SecurityButton extends UiButton {
  final BuildContext? context;
  final void Function() onTap;
  SecurityButton({
    super.key,
    super.label,
    required this.onTap,
    this.context,
  }) : super(
          variant: UiButtonVariant.text,
          onPressed: () async {
            if (await predication(
              context: context,
              types: [Predication.captcha],
            )) {
              onTap();
            }
          },
        );
}

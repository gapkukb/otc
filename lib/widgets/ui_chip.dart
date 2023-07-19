import 'package:flutter/material.dart';

class UiChip extends StatelessWidget {
  final IconData? icon;
  final Widget? iconWidget;
  final String text;
  final TextStyle? textStyle;
  final bool? iconOnRight;
  final double? iconSize;
  final double spacing;

  const UiChip({
    super.key,
    this.icon,
    required this.text,
    this.textStyle,
    this.iconOnRight,
    this.iconSize,
    this.spacing = 8,
    this.iconWidget,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      textDirection: iconOnRight == true ? TextDirection.rtl : null,
      children: [
        iconWidget ??
            Icon(
              icon,
              size: iconSize,
            ),
        SizedBox(width: spacing),
        Text(
          text,
          style: textStyle,
        ),
      ],
    );
  }
}

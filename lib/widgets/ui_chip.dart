import 'package:flutter/material.dart';

class UiChip extends StatelessWidget {
  IconData icon;
  String text;
  TextStyle? textStyle;
  bool? iconOnRight;
  double? iconSize;
  double spacing;

  UiChip({
    super.key,
    required this.icon,
    required this.text,
    this.textStyle,
    this.iconOnRight,
    this.iconSize,
    this.spacing = 8,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      textDirection: iconOnRight == true ? TextDirection.rtl : null,
      children: [
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

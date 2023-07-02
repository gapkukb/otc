import 'package:flutter/material.dart';

class UiChip extends StatelessWidget {
  IconData icon;
  String text;
  TextStyle? textStyle;

  UiChip({
    super.key,
    required this.icon,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon),
        const SizedBox(width: 8),
        Text(text),
      ],
    );
  }
}

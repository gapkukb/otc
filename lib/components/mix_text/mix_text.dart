import 'package:flutter/material.dart';
import 'package:otc/theme/text_theme.dart';

class MixText extends StatelessWidget {
  final String child;
  final String small;
  final TextStyle? style;
  final TextStyle smallStyle;
  const MixText({
    super.key,
    required this.child,
    required this.small,
    this.style,
    this.smallStyle = Font.mini,
  });

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        text: child,
        style: style,
        children: [
          TextSpan(
            text: small,
            style: smallStyle,
          )
        ],
      ),
    );
  }
}

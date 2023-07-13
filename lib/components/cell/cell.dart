import 'package:flutter/material.dart';

class Cell extends StatelessWidget {
  final Widget? titleWidget;
  final String? title;
  final TextStyle? titleStyle;
  final Widget? subTitleWidget;
  final String? subtitle;
  final TextStyle? subtitleStyle;
  final EdgeInsets padding;

  const Cell({
    super.key,
    this.title,
    this.subtitle,
    this.titleWidget,
    this.subTitleWidget,
    this.titleStyle,
    this.subtitleStyle,
    this.padding = const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          titleWidget ??
              (title == null
                  ? const SizedBox.shrink()
                  : Text(
                      title!,
                      style: titleStyle,
                    )),
          subTitleWidget ??
              (subtitle == null
                  ? const SizedBox.shrink()
                  : Text(
                      subtitle!,
                      style: subtitleStyle,
                    )),
        ],
      ),
    );
  }
}

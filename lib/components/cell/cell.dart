import 'package:flutter/material.dart';

class Cell extends StatelessWidget {
  final Widget? title;
  final String? titleText;
  final TextStyle? titleTextStyle;
  final Widget? trailing;
  final String? trailingText;
  final TextStyle? trailingTextStyle;
  final EdgeInsets? padding;
  final bool evenly;
  final double? width;
  final double? height;
  final Color? backgroundColor;
  final BoxBorder? border;

  const Cell({
    super.key,
    this.titleText,
    this.trailingText,
    this.title,
    this.trailing,
    this.titleTextStyle,
    this.trailingTextStyle,
    this.evenly = false,
    this.width,
    this.height = 56,
    this.backgroundColor,
    this.border,
    this.padding,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      padding: padding,
      color: backgroundColor,
      decoration: BoxDecoration(border: border),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Flexible(
            fit: evenly ? FlexFit.tight : FlexFit.loose,
            child: title ??
                (titleText == null
                    ? const SizedBox.shrink()
                    : Text(
                        titleText!,
                        style: titleTextStyle,
                      )),
          ),
          Flexible(
            fit: evenly ? FlexFit.tight : FlexFit.loose,
            child: trailing ??
                (trailingText == null
                    ? const SizedBox.shrink()
                    : Text(
                        trailingText!,
                        style: trailingTextStyle,
                      )),
          ),
        ],
      ),
    );
  }
}

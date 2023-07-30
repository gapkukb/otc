import 'package:flutter/material.dart';
import 'package:otc/components/gap/gap.dart';

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
  final MainAxisAlignment align;
  final bool? divider;

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
    this.align = MainAxisAlignment.spaceBetween,
    this.divider,
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
        mainAxisAlignment: align,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Flexible(
            fit: !evenly ? FlexFit.loose : FlexFit.tight,
            flex: evenly ? 1 : 0,
            child: title ??
                (titleText == null
                    ? const SizedBox.shrink()
                    : Text(
                        titleText!,
                        style: titleTextStyle,
                      )),
          ),
          const Gap.large(horizition: true),
          if (divider == true)
            const VerticalDivider(
              width: 33,
              thickness: 0.5,
            ),
          Flexible(
            fit: !evenly ? FlexFit.loose : FlexFit.tight,
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

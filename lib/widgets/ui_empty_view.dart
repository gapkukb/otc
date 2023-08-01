import 'package:flutter/material.dart';
import 'package:otc/theme/text_theme.dart';

class UiEmptyView extends StatelessWidget {
  final Widget? titleWidget;
  final String? title;
  final TextStyle? titleStyle;
  final String? subtitle;
  final Widget? subtitleWidget;
  final TextStyle? subtitleTyle;
  final List<Widget>? actions;
  final Widget? icon;
  final double? iconSize;

  const UiEmptyView({
    super.key,
    this.actions,
    this.subtitle,
    this.title,
    this.subtitleWidget,
    this.titleWidget,
    this.subtitleTyle,
    this.titleStyle,
    this.icon,
    this.iconSize,
  });

  @override
  Widget build(BuildContext context) {
    var flag = actions != null && actions!.isNotEmpty;

    return Container(
      padding: const EdgeInsets.all(40),
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          icon ??
              Image.asset(
                "assets/images/empty.png",
                color: Colors.grey,
                height: iconSize ?? 100,
              ),
          const SizedBox(
            height: 24,
          ),
          titleWidget ??
              Text(
                title ?? "暂无数据",
                textAlign: TextAlign.center,
                style: titleStyle ?? Font.mediumGrey,
              ),
          if (subtitleWidget == null && subtitle != null)
            Padding(
              padding: const EdgeInsets.only(top: 8),
              child: Text(
                subtitle!,
                textAlign: TextAlign.center,
                style: Font.miniGrey,
              ),
            )
          else if (subtitleWidget != null)
            subtitleWidget!,
          if (flag)
            const SizedBox(
              height: 24,
            ),
          if (flag)
            Row(
              mainAxisSize: MainAxisSize.min,
              children: actions!,
            ),
        ],
      ),
    );
  }
}

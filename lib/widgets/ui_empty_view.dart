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
  });

  static const _titleStyle = TextStyle(
    fontSize: 16,
    // fontWeight: FontWeight.bold,
    color: Colors.black,
  );

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
                height: 134,
              ),
          const SizedBox(
            height: 40,
          ),
          titleWidget ??
              Text(
                title ?? "暂无数据",
                style: titleStyle ?? Font.medium,
              ),
          if (subtitleWidget == null && subtitle != null)
            Padding(
              padding: const EdgeInsets.only(top: 8),
              child: Text(
                subtitle!,
                style: Font.miniGrey,
              ),
            )
          else if (subtitleWidget != null)
            subtitleWidget!,
          if (flag)
            const SizedBox(
              height: 40,
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

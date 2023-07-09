import 'package:flutter/material.dart';

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
    fontSize: 18,
    // fontWeight: FontWeight.bold,
    color: Color(0xff888888),
  );

  static const _subTitleTyle = TextStyle(
    fontSize: 12,
    color: Color(0xff999999),
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
                style: titleStyle ?? _titleStyle,
              ),
          if (subtitleWidget == null && subtitle != null)
            Padding(
              padding: const EdgeInsets.only(top: 8),
              child: Text(
                subtitle!,
                style: _subTitleTyle,
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

import 'package:flutter/material.dart';

class UiEmptyView extends StatelessWidget {
  final Widget? titleWidget;
  final String? title;
  final TextStyle? titleStyle;
  final String? subtitle;
  final Widget? subtitleWidget;
  final TextStyle? subtitleTyle;
  final List<Widget>? actions;

  const UiEmptyView({
    super.key,
    this.actions,
    this.subtitle,
    this.title,
    this.subtitleWidget,
    this.titleWidget,
    this.subtitleTyle,
    this.titleStyle,
  });

  static const _titleStyle = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.bold,
  );

  static const _subTitleTyle = TextStyle(
    fontSize: 16,
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
            Text(
              subtitle!,
              style: _subTitleTyle,
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

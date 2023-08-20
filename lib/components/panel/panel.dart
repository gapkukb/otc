import 'package:flutter/material.dart';
import 'package:otc/theme/text_theme.dart';

class Panel extends StatelessWidget {
  final String? title;
  final Widget? titleWidget;
  final Widget child;
  final Widget? footer;
  final EdgeInsets? margin;

  const Panel({
    super.key,
    this.title,
    required this.child,
    this.titleWidget,
    this.footer,
    this.margin,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: margin,
      child: Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          titleWidget ??
              Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 16,
                  horizontal: 32,
                ),
                child: Text(
                  title!,
                  style: Font.largeBold,
                ),
              ),
          const Divider(
            height: 1,
            thickness: 0.5,
          ),
          child,
          // if (footer != null) footer!,
        ],
      ),
    );
  }
}

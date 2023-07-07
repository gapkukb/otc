import 'package:flutter/material.dart';

class Panel extends StatelessWidget {
  static const style = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w600,
  );

  final String? title;
  final Widget? titleWidget;
  final Widget child;
  final Widget? footer;

  const Panel({
    super.key,
    this.title,
    required this.child,
    this.titleWidget,
    this.footer,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          titleWidget ??
              Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 16,
                  horizontal: 24,
                ),
                child: Text(
                  title!,
                  style: style,
                ),
              ),
          const Divider(
            height: 1,
            thickness: 0.5,
            // color: Colors.grey.shade100,
          ),
          child,
          if (footer != null) footer!,
        ],
      ),
    );
  }
}

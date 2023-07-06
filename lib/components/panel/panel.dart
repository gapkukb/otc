import 'package:flutter/material.dart';

class Panel extends StatelessWidget {
  static const style = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w600,
  );

  final String title;
  final Widget child;

  const Panel({
    super.key,
    required this.title,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 16,
              horizontal: 24,
            ),
            child: Text(
              title,
              style: style,
            ),
          ),
          const Divider(
            height: 1,
            thickness: 0.5,
            // color: Colors.grey.shade100,
          ),
          child,
        ],
      ),
    );
  }
}

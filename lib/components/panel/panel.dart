import 'package:flutter/material.dart';

class Panel extends StatelessWidget {
  String title;
  Widget child;

  Panel({
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
              horizontal: 32,
            ),
            child: Text(
              title,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          const Divider(
            height: 1,
          ),
          child,
        ],
      ),
    );
  }
}

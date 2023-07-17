import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:otc/components/layout/layout.menu.item.dart';

class LayoutMenuSub extends StatelessWidget {
  final List<LayoutMenuItem> items;
  final String? title;
  final bool underline;

  const LayoutMenuSub({
    Key? key,
    required this.items,
    this.title,
    this.underline = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        if (title != null)
          SizedBox(
              height: 56,
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(title!),
              )),
        ...items,
        if (underline)
          const Divider(
            height: 33,
            thickness: 1,
          ),
      ],
    );
  }
}

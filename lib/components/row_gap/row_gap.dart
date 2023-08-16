import 'package:flutter/material.dart';
import 'package:otc/utils/list.dart';

class RowGap extends Row {
  final List<Widget> items;
  final double spacing;
  RowGap({
    super.key,
    // super.children,
    super.crossAxisAlignment,
    super.mainAxisAlignment,
    super.mainAxisSize,
    super.textBaseline,
    super.textDirection,
    super.verticalDirection,
    this.items = const [],
    this.spacing = 8,
  }) : super(children: items.map((e) => [e, SizedBox(width: spacing)]).expand((element) => element).toList().slice(0, -1));
}

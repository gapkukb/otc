import 'package:flutter/material.dart';

final NestedScrollViewHeaderSliversBuilder header =
    (context, innerBoxIsScrolled) {
  return [
    SliverAppBar(
      title: const Text('嵌套ListView'),
      pinned: true, // 固定在顶部
      forceElevated: innerBoxIsScrolled,
    ),
  ];
};

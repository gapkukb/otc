// part of layout;

import 'package:flutter/material.dart';
import 'package:otc/theme/padding.dart';

class SidebarMenu extends StatefulWidget {
  final double width;
  final List<Widget> items;

  const SidebarMenu({
    super.key,
    this.width = 336,
    this.items = const [],
  });

  @override
  State<SidebarMenu> createState() => _SidebarMenuState();
}

class _SidebarMenuState extends State<SidebarMenu> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: Pads.xAxisSm,
      width: widget.width,
      child: ListView.builder(
        physics: const RangeMaintainingScrollPhysics(),
        itemCount: widget.items.length,
        itemBuilder: (context, index) {
          final item = widget.items[index];
          return item;
        },
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:otc/theme/padding.dart';
import 'package:otc/theme/text_theme.dart';
import 'package:otc/widgets/ui_chip.dart';

class Menu extends PopupMenuButton {
  final String text;
  final List<MenuItem> items;
  Menu({
    super.key,
    super.clipBehavior,
    super.color,
    super.constraints,
    super.elevation,
    super.enableFeedback,
    super.enabled,
    super.iconSize,
    super.initialValue,
    super.offset,
    super.onCanceled,
    super.onOpened,
    super.onSelected,
    super.padding,
    super.position = PopupMenuPosition.under,
    super.shadowColor,
    super.shape,
    super.splashRadius,
    super.surfaceTintColor,
    super.tooltip,
    required this.text,
    required this.items,
  }) : super(
            child: SizedBox(
              height: 56,
              child: Padding(
                padding: Pads.xAxisSm,
                child: UiChip(
                  text: text,
                  icon: Icons.keyboard_arrow_down_outlined,
                  iconOnRight: true,
                ),
              ),
            ),
            itemBuilder: (_) {
              return items.map((item) {
                return PopupMenuItem(
                  child: item,
                );
              }).toList();
            });
}

class MenuItem extends StatelessWidget {
  final String title;
  final String? subtitle;
  final IconData? icon;

  const MenuItem({
    super.key,
    required this.title,
    this.subtitle,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      visualDensity: const VisualDensity(vertical: -4),
      leading: icon == null
          ? null
          : Material(
              color: Colors.grey.shade200,
              borderRadius: BorderRadius.circular(4),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Icon(icon),
              ),
            ),
      title: Text(
        title,
        style: Font.small,
      ),
      subtitle: subtitle == null
          ? null
          : Text(
              subtitle!,
              style: Font.miniGrey,
            ),
    );
  }
}

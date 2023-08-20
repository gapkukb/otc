// part of layout;

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:otc/router/router.dart';

class LayoutMenuItem extends ListTile {
  final String? path;
  final String? pathname;
  final VoidCallback? onPressed;
  final String name;

  // @override
  // bool get selected {
  //   return GoRouterState.of(navigatorKey.currentContext!).name;
  // }

  const LayoutMenuItem({
    super.key,
    super.autofocus,
    super.contentPadding,
    super.dense,
    super.enableFeedback,
    super.enabled,
    super.focusColor,
    super.focusNode,
    super.horizontalTitleGap,
    super.hoverColor,
    super.iconColor,
    super.isThreeLine,
    super.leading = const Icon(
      Icons.fiber_manual_record,
      size: 18,
    ),
    super.leadingAndTrailingTextStyle,
    super.minLeadingWidth,
    super.minVerticalPadding,
    super.mouseCursor,
    super.onFocusChange,
    super.onLongPress,
    super.selected,
    super.selectedColor = Colors.black,
    super.selectedTileColor = const Color(0xffE8DEF8),
    super.shape = const StadiumBorder(),
    super.splashColor,
    super.style,
    super.subtitle,
    super.subtitleTextStyle,
    super.textColor,
    super.tileColor,
    super.titleAlignment,
    super.titleTextStyle,
    super.trailing,
    super.visualDensity,
    this.path,
    this.pathname,
    required this.name,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    final location = GoRouter.of(context).location.split("/");

    final selected = location.contains(path!.substring(1)) || location.contains(pathname?.substring(1));

    return SelectionContainer.disabled(
      child: ListTile(
        key: key,
        autofocus: autofocus,
        contentPadding: contentPadding,
        dense: dense,
        enableFeedback: enableFeedback,
        enabled: enabled,
        focusColor: focusColor,
        focusNode: focusNode,
        horizontalTitleGap: horizontalTitleGap,
        hoverColor: hoverColor,
        iconColor: iconColor,
        isThreeLine: isThreeLine,
        title: Text(name),
        leading: leading,
        leadingAndTrailingTextStyle: leadingAndTrailingTextStyle,
        minLeadingWidth: minLeadingWidth,
        minVerticalPadding: minVerticalPadding,
        mouseCursor: mouseCursor,
        onFocusChange: onFocusChange,
        onLongPress: onLongPress,
        selected: selected,
        selectedColor: selectedColor,
        selectedTileColor: selectedTileColor,
        shape: shape,
        splashColor: splashColor,
        style: style,
        subtitle: subtitle,
        subtitleTextStyle: subtitleTextStyle,
        textColor: textColor,
        tileColor: tileColor,
        titleAlignment: titleAlignment,
        titleTextStyle: TextStyle(
          fontSize: 14,
          color: Colors.black,
          fontWeight: selected ? FontWeight.bold : FontWeight.normal,
        ),
        trailing: trailing,
        visualDensity: visualDensity,
        onTap: () {
          if (onPressed != null) {
            onPressed!();
          } else if (path != null) {
            navigatorKey.currentContext!.go(path!);
          } else if (pathname != null) {
            navigatorKey.currentContext!.goNamed(pathname!);
          }
        },
      ),
    );
  }
}

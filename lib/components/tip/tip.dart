import 'package:flutter/material.dart';

class Tip extends StatelessWidget {
  final String message;
  final double? iconSize;
  final Color? iconColor;
  final IconData? iconData;
  final TextStyle? style;

  const Tip({
    super.key,
    required this.message,
    this.style,
    this.iconSize,
    this.iconColor,
    this.iconData,
  });

  @override
  Widget build(BuildContext context) {
    var key = ValueKey(message);
    var icon = Icon(
      iconData ?? Icons.help,
      color: iconColor ?? Theme.of(context).hintColor,
      size: iconSize,
    );

    return Tooltip(
      key: key,
      triggerMode: TooltipTriggerMode.tap,
      message: message,
      textStyle: style,
      child: icon,
    );

    // return context.responsive(
    //   IconButton(
    //     onPressed: () {
    //       showDialog(
    //         context: context,
    //         builder: (context) {
    //           return AlertDialog(
    //             content: Text(
    //               message,
    //               style: style,
    //             ),
    //           );
    //         },
    //       );
    //     },
    //     icon: icon,
    //   ),
    //   sm: Tooltip(
    //     triggerMode: TooltipTriggerMode.tap,
    //     message: message,
    //     textStyle: style,
    //     child: icon,
    //   ),
    // );
  }
}

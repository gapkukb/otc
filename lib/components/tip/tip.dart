import 'package:flutter/material.dart';
import 'package:otc/utils/responsive.dart';

class Tip extends StatelessWidget {
  String message;
  double? iconSize;
  Color? iconColor;
  IconData? iconData;
  TextStyle? style;

  Tip({
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

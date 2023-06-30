import 'package:flutter/material.dart';
import 'package:otc/utils/responsive.dart';

class Tip extends StatelessWidget {
  String message;
  double? iconSize;
  Color iconColor;
  IconData iconData;
  TextStyle? style;

  Tip({
    super.key,
    required this.message,
    this.style,
    this.iconSize,
    this.iconColor = Colors.white,
    this.iconData = Icons.help,
  });

  @override
  Widget build(BuildContext context) {
    var icon = Icon(
      iconData,
      color: iconColor,
      size: iconSize,
    );

    return context.responsive(
      IconButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                content: Text(
                  message,
                  style: style,
                ),
              );
            },
          );
        },
        icon: icon,
      ),
      lg: Tooltip(
        message: message,
        textStyle: style,
        child: icon,
      ),
    );
  }
}

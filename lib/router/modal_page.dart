import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:otc/router/router.keys.dart';

CustomTransitionPage modalPage(Widget child, [bool? barrierDismissible]) {
  return CustomTransitionPage(
    barrierColor: Colors.black38,
    barrierDismissible: barrierDismissible ?? false,
    fullscreenDialog: false,
    opaque: false,
    transitionsBuilder: (_, __, ___, child) => child,
    child: child,
  );
}

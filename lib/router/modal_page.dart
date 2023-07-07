import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

CustomTransitionPage ModalPage(Widget child, [bool? barrierDismissible]) {
  return CustomTransitionPage(
    barrierColor: Colors.black54,
    barrierDismissible: barrierDismissible ?? false,
    fullscreenDialog: true,
    opaque: false,
    transitionsBuilder: (_, __, ___, child) => child,
    child: child,
  );
}

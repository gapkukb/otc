import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

CustomTransitionPage ModalRoutePage(Widget child, [bool? barrierDismissible]) {
  return CustomTransitionPage(
    barrierColor: Colors.black54,
    barrierDismissible: barrierDismissible ?? true,
    fullscreenDialog: true,
    opaque: false,
    transitionsBuilder: (_, __, ___, child) => child,
    child: child,
  );
}

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

CustomTransitionPage ModalRoutePage(Widget child) {
  return CustomTransitionPage(
    barrierColor: Colors.black54,
    barrierDismissible: true,
    fullscreenDialog: true,
    opaque: false,
    transitionsBuilder: (_, __, ___, child) => child,
    child: child,
  );
}

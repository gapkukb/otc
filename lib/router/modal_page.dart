import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

final GlobalKey<NavigatorState> shellKey = GlobalKey();

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

GoRoute createModalPage({
  required String name,
  required String path,
  Page<dynamic> Function(BuildContext, GoRouterState)? pageBuilder,
  Widget? page,
}) {
  return GoRoute(
    parentNavigatorKey: shellKey,
    name: name,
    path: path,
    pageBuilder: pageBuilder ??
        (context, state) => ModalPage(
              page!,
            ),
  );
}

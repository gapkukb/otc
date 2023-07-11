import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:otc/router/router.keys.dart';

CustomTransitionPage modalPage(Widget child, [bool? barrierDismissible]) {
  return CustomTransitionPage(
    barrierColor: null,
    barrierDismissible: barrierDismissible ?? false,
    fullscreenDialog: false,
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
    parentNavigatorKey: appLayoutKey,
    name: name,
    path: path,
    pageBuilder: pageBuilder ??
        (context, state) => modalPage(
              page!,
            ),
  );
}

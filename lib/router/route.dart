import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CustomRoute extends GoRoute {
  final bool? authorizable;
  CustomRoute({
    required super.path,
    super.builder,
    super.name,
    super.pageBuilder,
    super.parentNavigatorKey,
    super.redirect,
    super.routes,
    this.authorizable = true,
  });
}

class CustomShellRoute extends ShellRoute {
  final bool? authorizable;
  CustomShellRoute({
    super.builder,
    super.navigatorKey,
    super.observers,
    super.pageBuilder,
    super.restorationScopeId,
    super.routes,
    this.authorizable = true,
  });
}

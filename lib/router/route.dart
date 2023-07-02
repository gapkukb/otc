part of router;

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

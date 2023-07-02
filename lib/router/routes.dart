part of router;

class Route  {
  final bool auth;
  final String path;
  Route({
    this.path = '1',
    // super.builder,
    // super.name,
    // super.pageBuilder,
    // super.parentNavigatorKey,
    // super.redirect,
    // super.routes,
    this.auth = true,
  }) : GoRoute();
}

class _Route {
  String name;
  bool authorizable;
  String path;

  _Route({
    this.authorizable = true,
    required this.name,
    required this.path,
  });
}

class Routes {
  static final home = _Route(authorizable: false, name: "home");
}

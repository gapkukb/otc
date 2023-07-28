part of router;

final navigatorKey = GlobalKey<NavigatorState>();
final appLayoutKey = GlobalKey<NavigatorState>();
final userLayoutKey = GlobalKey<NavigatorState>();
final orderLayoutKey = GlobalKey<NavigatorState>();
final walletLayoutKey = GlobalKey<NavigatorState>();
final agentLayoutKey = GlobalKey<NavigatorState>();
final advertiseLayoutKey = GlobalKey<NavigatorState>();

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

class ModalRoute extends GoRoute {
  final Widget? page;
  // 背景透明
  final bool? transparent;
  final Widget Function(BuildContext context, GoRouterState state)? statePage;
  ModalRoute({
    required super.path,
    this.page,
    this.statePage,
    this.transparent,
  }) : super(
          name: path,
          parentNavigatorKey: navigatorKey,
          pageBuilder: (context, state) => modalPage(
            statePage?.call(context, state) ?? page!,
            transparent,
          ),
        );
}

FutureOr<String?> redirect(BuildContext ontext, GoRouterState state) {
  if (global.authorization == null) return Routes.home;
  return null;
}

class AuthRoute extends GoRoute {
  final Widget? page;
  final Widget Function(BuildContext context, GoRouterState state)? statePage;

  AuthRoute({
    super.parentNavigatorKey,
    required super.path,
    this.page,
    this.statePage,
  }) : super(
          name: path.substring(1),
          builder: statePage ?? (context, state) => page!,
          redirect: redirect,
        );
}

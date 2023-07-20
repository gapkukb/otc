part of router;

final navigatorKey = GlobalKey<NavigatorState>();
final appLayoutKey = GlobalKey<NavigatorState>();
final userLayoutKey = GlobalKey<NavigatorState>();
final orderLayoutKey = GlobalKey<NavigatorState>();
final walletLayoutKey = GlobalKey<NavigatorState>();
final agentSystemKey = GlobalKey<NavigatorState>();

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
  final Widget Function(BuildContext, GoRouterState)? statePage;
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

class AuthRoute extends GoRoute {
  final Widget page;

  AuthRoute({
    super.parentNavigatorKey,
    required super.path,
    required this.page,
  }) : super(
          name: path.substring(1),
          builder: (context, state) => page,
        );
}

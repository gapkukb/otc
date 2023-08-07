part of router;

final navigatorKey = GlobalKey<NavigatorState>();
final appLayoutKey = GlobalKey<NavigatorState>();
final userLayoutKey = GlobalKey<NavigatorState>();
final orderLayoutKey = GlobalKey<NavigatorState>();
final walletLayoutKey = GlobalKey<NavigatorState>();
final merchantLayoutKey = GlobalKey<NavigatorState>();
final advertiseLayoutKey = GlobalKey<NavigatorState>();

CustomTransitionPage modalPage(Widget child, [bool? barrierDismissible]) {
  return CustomTransitionPage(
    barrierColor: Colors.black38,
    barrierDismissible: barrierDismissible ?? false,
    fullscreenDialog: true,
    opaque: false,
    transitionsBuilder: (_, __, ___, child) => child,
    child: child,
  );
}

class ModalRoute extends GoRoute {
  final Widget? page;
  // 背景透明
  final bool? barrierDismissible;
  final Widget Function(BuildContext context, GoRouterState state)? statePage;
  final GlobalKey<NavigatorState>? key;
  ModalRoute({
    required super.path,
    this.page,
    this.statePage,
    this.barrierDismissible,
    this.key,
  }) : super(
          name: path,
          parentNavigatorKey: key ?? navigatorKey,
          pageBuilder: (context, state) => modalPage(
            statePage?.call(context, state) ?? page!,
            barrierDismissible,
          ),
        );
}

FutureOr<String?> redirect(BuildContext context, GoRouterState state) {
  if (global.authorization == null) {
    Future(() async {
      await Future.delayed(const Duration(milliseconds: 1));
      navigatorKey.currentContext!.push(Routes.login);
    });
    return Routes.home;
  }

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

import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../pages/index.dart';
import './routes.dart';

final navigatorKey = GlobalKey<NavigatorState>();

final router = GoRouter(
  navigatorKey: navigatorKey,
  // 根据平台和启动页引导页区分
  initialLocation: '/notice',
  debugLogDiagnostics: true,
  redirect: (context, state) {
    // for (var element in routes) {
    //   if (element.runtimeType == CustomShellRoute) {
    //     var route = deepFind(element as CustomShellRoute, state.location);
    //     if (route == null) {}
    //   }
    // }

    return null;
  },
  errorBuilder: (context, state) {
    // if (state.error == 404) {
    // }

    return const Page404();
  },
  observers: [BotToastNavigatorObserver()],
  routes: routes,
);

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:otc/pages/reset_password/reset_password.dart';
import 'package:otc/pages/user/c2c/c2c.dart';
import 'package:otc/pages/user/home/home.dart';
import 'package:otc/pages/user/layout/user_layout.dart';
import 'package:otc/pages/user/rebate/rebate.dart';
import 'package:otc/pages/user/tasks/user_tasks.dart';
import 'package:otc/pages/wallet/wallet_home/wallet_home.dart';
import '../pages/index.dart';
import '../pages/register/register.dart';

final routerKey = GlobalKey<NavigatorState>();

final router = GoRouter(
  navigatorKey: routerKey,
  // 根据平台和启动页引导页区分
  initialLocation: '/tasks',
  debugLogDiagnostics: true,
  redirect: (context, state) {
    // if (accessable) {
    //   return '/';
    // }

    return null;
  },
  errorBuilder: (context, state) {
    // if (state.error == 404) {
    // }
    return const Page404();
  },
  routes: [
    ShellRoute(
      builder: layout,
      routes: [
        GoRoute(
          path: '/',
          builder: (context, state) => const HomePage(),
        ),
        GoRoute(
          path: '/register',
          builder: (context, state) => const Register(),
        ),
        GoRoute(
          path: '/reset_password',
          builder: (context, state) => const ResetPassword(),
        ),
        GoRoute(
          path: '/wallet_home',
          builder: (context, state) => const WalletHome(),
        ),
      ],
    ),
    ShellRoute(
      builder: userLayout,
      routes: [
        GoRoute(
          path: '/user',
          builder: (context, state) => const UserHome(),
        ),
        GoRoute(
          path: '/c2c',
          builder: (context, state) => const UserC2C(),
        ),
        GoRoute(
          path: '/rebate',
          builder: (context, state) => const UserRebate(),
        ),
        GoRoute(
          path: '/tasks',
          builder: (context, state) => const UserTasks(),
        ),
      ],
    ),
    GoRoute(
      path: '/',
      builder: (context, state) => const HomePage(),
    ),
    GoRoute(
      path: '/456',
      builder: (context, state) => const HomePage(),
    ),
  ],
);

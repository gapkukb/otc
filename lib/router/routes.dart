import 'package:go_router/go_router.dart';
import 'package:otc/layout/page_layout/page_layout.dart';
import 'package:otc/pages/user/auth/auth.dart';
import 'package:otc/pages/user/c2c/c2c.dart';
import 'package:otc/pages/user/rebate/rebate.dart';
import 'package:otc/pages/user/layout/user_layout.dart';
import 'package:otc/pages/user/home/home.dart';
import 'package:otc/pages/user/security/security.dart';
import 'package:otc/pages/user/tasks/user_tasks.dart';
import 'package:otc/router/route_name.dart';

final List<RouteBase> routes = [
  ShellRoute(
    builder: userLayout,
    routes: [
      GoRoute(
        name: RouteName.user,
        path: '/user',
        builder: (context, state) => const UserHome(),
      ),
      GoRoute(
        name: RouteName.c2c,
        path: '/c2c',
        builder: (context, state) => const UserC2C(),
      ),
      GoRoute(
        name: RouteName.rebate,
        path: '/rebate',
        builder: (context, state) => const UserRebate(),
      ),
      GoRoute(
        name: RouteName.tasks,
        path: '/tasks',
        builder: (context, state) => const UserTasks(),
      ),
      GoRoute(
        name: RouteName.security,
        path: '/security',
        builder: (context, state) => const UserSecurity(),
      ),
      GoRoute(
        name: RouteName.auth,
        path: '/auth',
        builder: (context, state) => const UserAuth(),
      ),
    ],
  ),

  /// 下面是普通页面，不需要鉴权
  GoRoute(
    path: '/page_layout',
    builder: (context, state) => const PageLayout(),
  ),
];

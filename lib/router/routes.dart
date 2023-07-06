import 'package:go_router/go_router.dart';
import 'package:otc/layout/page_layout/page_layout.dart';
import 'package:otc/pages/user/layout/user_layout.dart';
import 'package:otc/pages/user/home/home.dart';
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
    ],
  ),

  /// 下面是普通页面，不需要鉴权
  GoRoute(
    path: '/page_layout',
    builder: (context, state) => const PageLayout(),
  ),
];

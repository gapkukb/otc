import 'package:go_router/go_router.dart';
import 'package:otc/layout/page_layout/page_layout.dart';
import 'package:otc/pages/agent_mng/agent_setting/agent_setting.dart';
import 'package:otc/pages/agent_mng/dashboard/dashboard.dart';
import 'package:otc/pages/agent_mng/rebase_details/rebase_details.dart';
import 'package:otc/pages/notice/notice.dart';
import 'package:otc/pages/order/order_c2c/order_c2c.dart';
import 'package:otc/pages/user/auth/auth.dart';
import 'package:otc/pages/user/c2c/c2c.dart';
import 'package:otc/pages/user/rebate/rebate.dart';
import 'package:otc/pages/user/layout/user_layout.dart';
import 'package:otc/pages/user/home/home.dart';
import 'package:otc/pages/user/security/security.dart';
import 'package:otc/pages/user/tasks/user_tasks.dart';
import 'package:otc/pages/webview/webview.dart';
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
  GoRoute(
    path: '/order_c2c',
    builder: (context, state) => const OrderC2c(),
  ),

  GoRoute(
    path: '/dashboard',
    builder: (context, state) => const Dashboard(),
  ),

  GoRoute(
    path: '/rebase_details',
    builder: (context, state) => const RebaseDetails(),
  ),
  GoRoute(
    path: '/agent_setting',
    builder: (context, state) => const AgentSetting(),
  ),
  GoRoute(
    path: '/notice',
    builder: (context, state) => const Notice(),
  ),

  /// 下面是普通页面，不需要鉴权
  GoRoute(
    path: '/page_layout',
    builder: (context, state) => const PageLayout(),
  ),
  GoRoute(
    path: '/webview',
    builder: (context, state) => const Webview(),
  ),
];

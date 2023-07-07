import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:otc/layout/page_layout/page_layout.dart';
import 'package:otc/pages/user/agent/agent.dart';
import 'package:otc/pages/user/auth/auth.dart';
import 'package:otc/pages/user/auth/auth_junior.dart';
import 'package:otc/pages/user/auth/auth_primary.dart';
import 'package:otc/pages/user/auth/auth_senior.dart';
import 'package:otc/pages/user/c2c/c2c.dart';
import 'package:otc/pages/user/rebate/rebate.dart';
import 'package:otc/pages/user/layout/user_layout.dart';
import 'package:otc/pages/user/home/home.dart';
import 'package:otc/pages/user/security/security.dart';
import 'package:otc/pages/user/setting/setting.dart';
import 'package:otc/pages/user/setting/setting_nickname.dart';
import 'package:otc/pages/user/tasks/user_tasks.dart';
import 'package:otc/router/route_name.dart';
import 'package:otc/router/modal_page.dart';

final GlobalKey<NavigatorState> shellKey = GlobalKey();

final List<RouteBase> routes = [
  //需要鉴权的页面
  ShellRoute(
    navigatorKey: shellKey,
    builder: (context, state, child) {
      return child;
    },
    routes: [
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
          GoRoute(
            name: RouteName.authAgent,
            path: '/auth_agent',
            builder: (context, state) => const UserAgent(),
          ),
          GoRoute(
            name: RouteName.setting,
            path: '/setting',
            builder: (context, state) => const UserSetting(),
          ),
        ],
      ),
      GoRoute(
        parentNavigatorKey: shellKey,
        name: RouteName.authPrimary,
        path: '/auth_primary',
        pageBuilder: (context, state) => ModalPage(
          const AuthPrimary(),
        ),
      ),
      GoRoute(
        parentNavigatorKey: shellKey,
        name: RouteName.authJunior,
        path: '/auth_junior',
        pageBuilder: (context, state) => ModalPage(
          const AuthJunior(),
        ),
      ),
      GoRoute(
        parentNavigatorKey: shellKey,
        name: RouteName.authSenior,
        path: '/auth_senior',
        pageBuilder: (context, state) => ModalPage(
          const AuthSenior(),
        ),
      ),
      GoRoute(
        parentNavigatorKey: shellKey,
        name: RouteName.settingNickname,
        path: '/setting_nickname',
        pageBuilder: (context, state) => ModalPage(
          const SettingNickname(),
        ),
      ),
    ],
  ),

  /// 下面是普通页面，不需要鉴权
  GoRoute(
    path: '/page_layout',
    builder: (context, state) => const PageLayout(),
  ),
];

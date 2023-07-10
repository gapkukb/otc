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
import 'package:otc/pages/user/setting/setting_avatar.dart';
import 'package:otc/pages/user/setting/setting_nickname.dart';
import 'package:otc/pages/user/tasks/user_tasks.dart';
import 'package:otc/pages/wallet/wallet_address/wallet_address.dart';
import 'package:otc/pages/wallet/layout/wallet_layout.dart';
import 'package:otc/pages/wallet/wallet_address/wallet_address_addition.dart';
import 'package:otc/pages/wallet/wallet_address/wallet_address_dc_addition.dart';
import 'package:otc/pages/wallet/wallet_futures/wallet_futures.dart';
import 'package:otc/pages/wallet/wallet_history/wallet_history.dart';
import 'package:otc/pages/wallet/wallet_home/wallet_home.dart';
import 'package:otc/pages/wallet/wallet_funds/wallet_funds.dart';
import 'package:otc/pages/wallet/wallet_spot/wallet_spot.dart';
import 'package:otc/router/route_name.dart';
import 'package:otc/router/modal_page.dart';

final GlobalKey<NavigatorState> shellKey = GlobalKey();

GoRoute createModalPage({
  required String name,
  required String path,
  Page<dynamic> Function(BuildContext, GoRouterState)? pageBuilder,
  Widget? page,
}) {
  return GoRoute(
    parentNavigatorKey: shellKey,
    name: name,
    path: path,
    pageBuilder: pageBuilder ??
        (context, state) => ModalPage(
              page!,
            ),
  );
}

final List<RouteBase> routes = [
  //需要鉴权的页面
  ShellRoute(
    navigatorKey: shellKey,
    builder: (context, state, child) {
      return child;
    },
    routes: [
      // 用户中心
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
      //钱包
      ShellRoute(
        builder: walletLayout,
        routes: [
          GoRoute(
            name: RouteName.wallet,
            path: '/wallet',
            builder: (context, state) => const WalletHome(),
          ),
          GoRoute(
            name: RouteName.walletAddress,
            path: '/wallet_address',
            builder: (context, state) => const WalletAddress(),
          ),
          GoRoute(
            name: RouteName.walletFunds,
            path: '/wallet_funds',
            builder: (context, state) => const WalletFunds(),
          ),
          GoRoute(
            name: RouteName.walletSpot,
            path: '/wallet_spot',
            builder: (context, state) => const WalletSpot(),
          ),
          GoRoute(
            name: RouteName.walletFutures,
            path: '/wallet_futures',
            builder: (context, state) => const WalletFutures(),
          ),
          GoRoute(
            name: RouteName.walletHistory,
            path: '/wallet_history',
            builder: (context, state) => const WalletHistory(),
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
      GoRoute(
        parentNavigatorKey: shellKey,
        name: RouteName.settingAvatar,
        path: '/setting_avatar',
        pageBuilder: (context, state) => ModalPage(
          const SettingAvatar(),
        ),
      ),
      createModalPage(
        name: RouteName.walletAddition,
        path: '/wallet_addition',
        pageBuilder: (context, state) => ModalPage(
          WalletAddressAddition(
            addType: (state.extra as AddType?) ?? AddType.bank,
          ),
        ),
      ),
      createModalPage(
        name: RouteName.walletAdditionDc,
        path: '/wallet_addition_dc',
        page: WalletAddressDcAddition(),
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

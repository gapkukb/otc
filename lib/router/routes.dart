import 'package:go_router/go_router.dart';
import 'package:otc/pages/account/login/login.dart';
import 'package:otc/pages/home/home.dart';
import 'package:otc/pages/notice/notice_window.dart';
import 'package:otc/pages/user/home/home.dart';
import 'package:otc/pages/user/layout/user_layout.dart';
import 'package:otc/pages/user/setting/setting.dart';
import 'package:otc/pages/user/setting/setting_avatar.dart';
import 'package:otc/pages/user/setting/setting_nickname.dart';
import 'package:otc/router/modal_page.dart';
import 'package:otc/router/route_name.dart';
import 'package:otc/router/router.keys.dart';
import '../layout/layout.dart';

final List<RouteBase> routes = [
  ShellRoute(
    navigatorKey: appLayoutKey,
    builder: layout,
    routes: [
      GoRoute(
        // name: RoutesName.home.name,
        path: '/',
        builder: (context, state) => const Home(),
      ),
      ShellRoute(
        navigatorKey: userLayoutKey,
        builder: userLayout,
        routes: [
          GoRoute(
            // name: RoutesName.home.name,
            path: '/user',
            builder: (context, state) => const UserHome(),
          ),
          GoRoute(
            name: RouteName.setting,
            path: '/setting',
            builder: (context, state) => const UserSetting(),
          ),
        ],
      ),
    ],
  ),
  GoRoute(
    parentNavigatorKey: navigatorKey,
    path: '/notice_window',
    pageBuilder: (context, state) => modalPage(
      const NoticeWindow(),
      true,
    ),
  ),
  GoRoute(
    path: '/login',
    builder: (context, state) => const Login(),
  ),
  GoRoute(
    parentNavigatorKey: navigatorKey,
    name: RouteName.settingNickname,
    path: '/setting_nickname',
    pageBuilder: (context, state) => modalPage(
      const SettingNickname(),
    ),
  ),
  GoRoute(
    parentNavigatorKey: navigatorKey,
    name: RouteName.settingAvatar,
    path: '/setting_avatar',
    pageBuilder: (context, state) => modalPage(
      const SettingAvatar(),
    ),
  ),
];

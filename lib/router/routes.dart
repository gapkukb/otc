import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:otc/pages/account/login/login.dart';
import 'package:otc/pages/home/home.dart';
import 'package:otc/pages/notice/notice_window.dart';
import 'package:otc/pages/user/auth/auth.dart';
import 'package:otc/pages/user/captcha/captcha.dart';
import 'package:otc/pages/user/f2a/f2a.dart';
import 'package:otc/pages/user/reset.pwd/reset.pwd.dart';
import 'package:otc/pages/user/update.email/update.email.dart';
import 'package:otc/pages/user/update.funds.pwd/update.funds.pwd.dart';
import 'package:otc/pages/user/update.phone/update.phone.dart';
import 'package:otc/pages/user/update.pwd/update.pwd.dart';
import 'package:otc/pages/user/home/home.dart';
import 'package:otc/pages/user/layout/user_layout.dart';
import 'package:otc/pages/user/security/security.dart';
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
        name: Routes.home,
        path: '/home',
        builder: (context, state) => const Home(),
      ),
      ShellRoute(
        navigatorKey: userLayoutKey,
        builder: userLayout,
        routes: [
          GoRoute(
            name: Routes.user,
            path: Routes.user,
            builder: (context, state) => const UserHome(),
          ),
          GoRoute(
            name: Routes.setting,
            path: Routes.setting,
            builder: (context, state) => const UserSetting(),
          ),
          GoRoute(
            name: Routes.auth,
            path: Routes.auth,
            builder: (context, state) => const UserAuth(),
          ),
          GoRoute(
            name: Routes.security,
            path: Routes.security,
            builder: (context, state) => const UserSecurity(),
          ),
        ],
      ),
    ],
  ),
  GoRoute(
    parentNavigatorKey: navigatorKey,
    path: '/notice_window',
    pageBuilder: (context, state) => modalPage(const NoticeWindow(), true),
  ),
  GoRoute(
    name: Routes.login,
    path: Routes.login,
    builder: (context, state) => const Login(),
  ),
  GoRoute(
    parentNavigatorKey: navigatorKey,
    name: Routes.settingNickname,
    path: Routes.settingNickname,
    pageBuilder: (context, state) => modalPage(
      const SettingNickname(),
    ),
  ),
  GoRoute(
    parentNavigatorKey: navigatorKey,
    name: Routes.settingAvatar,
    path: Routes.settingAvatar,
    pageBuilder: (context, state) => modalPage(
      const SettingAvatar(),
    ),
  ),
  GoRoute(
    parentNavigatorKey: navigatorKey,
    name: Routes.udpatePwd,
    path: Routes.udpatePwd,
    pageBuilder: (context, state) => modalPage(
      const UpdatePwd(),
    ),
  ),
  GoRoute(
    parentNavigatorKey: navigatorKey,
    name: Routes.captcha,
    path: Routes.captcha,
    pageBuilder: (context, state) => modalPage(
      Captcha(
        preferredDevice: (state.extra as dynamic)['preferredDevice'],
        service: (state.extra as dynamic)['service'],
        account: (state.extra as dynamic)['account'],
        switchable: (state.extra as dynamic)['switchable'],
        user: (state.extra as dynamic)['user'],
      ),
    ),
  ),
  ModalPage(
    path: Routes.updateEmail,
    page: const UpdateEmail(),
  ),
  ModalPage(
    path: Routes.f2a,
    withPage: (context, state) => F2A(
      text: state.extra as String,
    ),
  ),
  ModalPage(
    path: Routes.updatePhone,
    page: const UpdatePhone(),
  ),
  ModalPage(
    path: Routes.updateFundsPwd,
    page: const UpdateFundsPwd(),
  ),
  ModalPage(
    path: Routes.resetPwd,
    page: const ResetPwd(),
  ),
];

class ModalPage extends GoRoute {
  final Widget? page;
  final Widget Function(BuildContext, GoRouterState)? withPage;
  ModalPage({
    required super.path,
    this.page,
    this.withPage,
  }) : super(
          name: path,
          parentNavigatorKey: navigatorKey,
          pageBuilder: (context, state) => modalPage(
            withPage?.call(context, state) ?? page!,
          ),
        );
}

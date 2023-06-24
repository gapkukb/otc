import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:otc/pages/reset_password/reset_password.dart';
import 'package:otc/pages/user/auth/auth.dart';
import 'package:otc/pages/user/auth/auth_junior.dart';
import 'package:otc/pages/user/auth/auth_primary.dart';
import 'package:otc/pages/user/auth/auth_senior.dart';
import 'package:otc/pages/user/bindings/binding_phone.dart';
import 'package:otc/pages/user/c2c/c2c.dart';
import 'package:otc/pages/user/email_address/email_address.dart';
import 'package:otc/pages/user/f2a/f2a.dart';
import 'package:otc/pages/user/home/home.dart';
import 'package:otc/pages/user/layout/user_layout.dart';
import 'package:otc/pages/user/verification/verification.dart';
import 'package:otc/pages/user/rebate/rebate.dart';
import 'package:otc/pages/user/tasks/user_tasks.dart';
import 'package:otc/pages/wallet/wallet_home/wallet_home.dart';
import 'package:otc/router/modal_route.dart';
import '../pages/index.dart';
import '../pages/register/register.dart';

final routerKey = GlobalKey<NavigatorState>();

final router = GoRouter(
  navigatorKey: routerKey,
  // 根据平台和启动页引导页区分
  initialLocation: '/auth',
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
  observers: [BotToastNavigatorObserver()],
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
        GoRoute(
          path: '/reset_password',
          builder: (context, state) => const ResetPassword(),
        ),
        GoRoute(
          path: '/auth',
          builder: (context, state) => const UserAuth(),
        ),
      ],
    ),
    GoRoute(
      path: '/phone_verification',
      pageBuilder: (context, state) => ModalRoutePage(
        const UserVerification(isPhoneEditing: true),
      ),
    ),
    GoRoute(
      path: '/email_verification',
      pageBuilder: (context, state) => ModalRoutePage(
        const UserVerification(isPhoneEditing: false),
      ),
    ),
    GoRoute(
      path: '/f2a',
      pageBuilder: (context, state) => ModalRoutePage(
        const UserF2a(),
      ),
    ),
    GoRoute(
      path: '/email',
      pageBuilder: (context, state) => ModalRoutePage(
        const UserEmailAddress(),
      ),
    ),
    GoRoute(
      path: '/bind_f2a',
      pageBuilder: (context, state) => ModalRoutePage(
        const BindingPhone(),
      ),
    ),
    GoRoute(
      path: '/auth_primary',
      pageBuilder: (context, state) => ModalRoutePage(
        const AuthPrimary(),
      ),
    ),
    GoRoute(
      path: '/auth_junior',
      pageBuilder: (context, state) => ModalRoutePage(
        const AuthJunior(),
      ),
    ),
    GoRoute(
      path: '/auth_senior',
      pageBuilder: (context, state) => ModalRoutePage(
        const AuthSenior(),
      ),
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

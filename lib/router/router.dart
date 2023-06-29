import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:otc/pages/advertise/advertise.dart';
import 'package:otc/pages/advertise/advertise_place/advertise_place.dart';
import 'package:otc/pages/advertise/layout/advertise_layout.dart';
import 'package:otc/pages/agent/agent.dart';
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
import 'package:otc/pages/user/setting/setting.dart';
import 'package:otc/pages/user/setting/setting_nickname.dart';
import 'package:otc/pages/user/setting/update_avatar.dart';
import 'package:otc/pages/user/verification/verification.dart';
import 'package:otc/pages/user/rebate/rebate.dart';
import 'package:otc/pages/user/tasks/user_tasks.dart';
import 'package:otc/pages/wallet/banks/wallet_address.dart';
import 'package:otc/pages/wallet/banks/wallet_address_addition.dart';
import 'package:otc/pages/wallet/banks/wallet_address_dc_addition.dart';
import 'package:otc/pages/wallet/funds/contract_wallet.dart';
import 'package:otc/pages/wallet/funds/funds.dart';
import 'package:otc/pages/wallet/layout/wallet_layout.dart';
import 'package:otc/pages/wallet/wallet_home/wallet_home.dart';
import 'package:otc/router/modal_route.dart';
import '../pages/index.dart';
import '../pages/register/register.dart';

final navigatorKey = GlobalKey<NavigatorState>();

final router = GoRouter(
  navigatorKey: navigatorKey,
  // 根据平台和启动页引导页区分
  initialLocation: '/',
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
        GoRoute(
          path: '/setting',
          builder: (context, state) => const UserSetting(),
        ),
      ],
    ),
    ShellRoute(
      builder: walletLayout,
      routes: [
        GoRoute(
          path: '/wallet_home',
          builder: (context, state) => const WalletHome(),
        ),
        GoRoute(
          path: '/wallet_banks',
          builder: (context, state) => const WalletAddressDC(),
        ),
        GoRoute(
          path: '/wallet_addition',
          pageBuilder: (context, state) => ModalRoutePage(
            WalletAddressAddition(
              addType: (state.extra as AddType?) ?? AddType.bank,
            ),
          ),
        ),
        GoRoute(
          path: '/wallet_addition_dc',
          pageBuilder: (context, state) => ModalRoutePage(
            WalletAddressDcAddition(),
          ),
        ),
        GoRoute(
          path: '/funds',
          builder: (context, state) => const Funds(),
        ),
      ],
    ),
    ShellRoute(
      builder: advertiseLayout,
      routes: [
        GoRoute(
          path: '/advertise',
          builder: (context, state) => const Advertise(),
        ),
      ],
    ),
    GoRoute(
      path: '/contract_wallet',
      builder: (context, state) => const ContractWallet(),
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
      path: '/agent',
      pageBuilder: (context, state) => ModalRoutePage(
        const Agent(),
      ),
    ),
    GoRoute(
      path: '/setting_nickname',
      pageBuilder: (context, state) => ModalRoutePage(
        const SettingNickname(),
      ),
    ),
    GoRoute(
      path: '/update_avatar',
      pageBuilder: (context, state) => ModalRoutePage(
        const UpdateAvatar(),
      ),
    ),
    GoRoute(
      path: '/advertise_place',
      pageBuilder: (context, state) => ModalRoutePage(
        const AdvertisePlace(),
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

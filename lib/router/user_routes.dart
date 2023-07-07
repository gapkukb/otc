import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:otc/global/global.dart';
import 'package:otc/http/http.dart';
import 'package:otc/layout/page_layout/page_layout.dart';
import 'package:otc/pages/advertise/advertise.dart';
import 'package:otc/pages/advertise/advertise_place/advertise_place.dart';
import 'package:otc/pages/advertise/layout/advertise_layout.dart';
import 'package:otc/pages/user/agent/agent.dart';
import 'package:otc/pages/index.dart';
import 'package:otc/pages/legal_terms/legal_terms.dart';
import 'package:otc/pages/account/account.dart';
import 'package:otc/pages/retrieve_password/retrieve_password.dart';
import 'package:otc/pages/slider_captcha/slider_captcha.dart';
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
import 'package:otc/pages/user/setting/setting_avatar.dart';
import 'package:otc/pages/user/captcha/captcha.dart';
import 'package:otc/pages/user/rebate/rebate.dart';
import 'package:otc/pages/user/tasks/user_tasks.dart';
import 'package:otc/pages/wallet/wallet_address/wallet_address.dart';
import 'package:otc/pages/wallet/wallet_address/wallet_address_addition.dart';
import 'package:otc/pages/wallet/wallet_address/wallet_address_dc_addition.dart';
import 'package:otc/pages/wallet/wallet_funds/contract_wallet.dart';
import 'package:otc/pages/wallet/wallet_funds/wallet_funds.dart';
import 'package:otc/pages/wallet/layout/wallet_layout.dart';
import 'package:otc/pages/wallet/wallet_home/wallet_home.dart';
import 'package:otc/router/modal_page.dart';
import 'package:otc/router/route_name.dart';

final List<RouteBase> routes = [
  GoRoute(
    path: '/page_layout',
    builder: (context, state) => const PageLayout(),
  ),
  ShellRoute(
    builder: layout,
    routes: [
      GoRoute(
        // name: RoutesName.home.name,
        path: '/',
        builder: (context, state) => const HomePage(),
      ),
      GoRoute(
        path: '/wallet_home',
        builder: (context, state) => const WalletHome(),
      ),
    ],
  ),
  GoRoute(
    // name: RoutesName.account.name,
    path: '/account/:type',
    redirect: (context, state) {
      // 已经登录禁止再次访问
      if (global.authorization == null) {
        return null;
      }
      return '/';
    },
    builder: (context, state) {
      return Account(
        type: state.pathParameters['type'],
      );
    },
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
        path: '/retrieve_password',
        builder: (context, state) => RetrievePassword(),
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
        builder: (context, state) => const WalletAddress(),
      ),
      GoRoute(
        path: '/wallet_addition',
        pageBuilder: (context, state) => ModalPage(
          WalletAddressAddition(
            addType: (state.extra as AddType?) ?? AddType.bank,
          ),
        ),
      ),
      GoRoute(
        path: '/wallet_addition_dc',
        pageBuilder: (context, state) => ModalPage(
          WalletAddressDcAddition(),
        ),
      ),
      GoRoute(
        path: '/funds',
        builder: (context, state) => const WalletFunds(),
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
    path: '/captcha',
    pageBuilder: (context, state) => ModalPage(
      Captcha(
        device: (state.extra as dynamic)['device'],
        service: (state.extra as dynamic)['service'],
        account: (state.extra as dynamic)['account'],
      ),
    ),
  ),
  GoRoute(
    path: '/f2a',
    pageBuilder: (context, state) => ModalPage(
      const UserF2a(),
    ),
  ),
  GoRoute(
    path: '/email',
    pageBuilder: (context, state) => ModalPage(
      const UserEmailAddress(),
    ),
  ),
  GoRoute(
    path: '/bind_f2a',
    pageBuilder: (context, state) => ModalPage(
      const BindingPhone(),
    ),
  ),
  GoRoute(
    path: '/auth_primary',
    pageBuilder: (context, state) => ModalPage(
      const AuthPrimary(),
    ),
  ),
  GoRoute(
    path: '/auth_junior',
    pageBuilder: (context, state) => ModalPage(
      const AuthJunior(),
    ),
  ),
  GoRoute(
    path: '/auth_senior',
    pageBuilder: (context, state) => ModalPage(
      const AuthSenior(),
    ),
  ),
  GoRoute(
    path: '/agent',
    pageBuilder: (context, state) => ModalPage(
      const UserAgent(),
    ),
  ),
  GoRoute(
    path: '/setting_nickname',
    pageBuilder: (context, state) => ModalPage(
      const SettingNickname(),
    ),
  ),
  GoRoute(
    path: '/update_avatar',
    pageBuilder: (context, state) => ModalPage(
      const SettingAvatar(),
    ),
  ),
  GoRoute(
    path: '/advertise_place',
    pageBuilder: (context, state) => ModalPage(
      const AdvertisePlace(),
    ),
  ),
  GoRoute(
    path: '/slider_captcha',
    pageBuilder: (context, state) => ModalPage(
      const SliderCaptcha(),
      false,
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
  GoRoute(
    path: '/terms',
    builder: (context, state) => const LegalTerms(),
  ),
];

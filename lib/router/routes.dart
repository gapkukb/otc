part of router;

final List<RouteBase> routes = [
  CustomRoute(
    path: '/page_layout',
    builder: (context, state) => const PageLayout(),
  ),
  CustomShellRoute(
    builder: layout,
    routes: [
      CustomRoute(
        name: RoutesName.home.name,
        path: '/',
        builder: (context, state) => const HomePage(),
      ),
      CustomRoute(
        path: '/wallet_home',
        builder: (context, state) => const WalletHome(),
      ),
    ],
  ),
  CustomRoute(
    name: RoutesName.account.name,
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
  CustomShellRoute(
    builder: userLayout,
    routes: [
      CustomRoute(
        path: '/user',
        builder: (context, state) => const UserHome(),
      ),
      CustomRoute(
        path: '/c2c',
        builder: (context, state) => const UserC2C(),
      ),
      CustomRoute(
        path: '/rebate',
        builder: (context, state) => const UserRebate(),
      ),
      CustomRoute(
        path: '/tasks',
        builder: (context, state) => const UserTasks(),
      ),
      CustomRoute(
        path: '/reset_password',
        builder: (context, state) => const ResetPassword(),
      ),
      CustomRoute(
        path: '/auth',
        builder: (context, state) => const UserAuth(),
      ),
      CustomRoute(
        path: '/setting',
        builder: (context, state) => const UserSetting(),
      ),
    ],
  ),
  CustomShellRoute(
    builder: walletLayout,
    routes: [
      CustomRoute(
        path: '/wallet_home',
        builder: (context, state) => const WalletHome(),
      ),
      CustomRoute(
        path: '/wallet_banks',
        builder: (context, state) => const WalletAddressDC(),
      ),
      CustomRoute(
        path: '/wallet_addition',
        pageBuilder: (context, state) => ModalRoutePage(
          WalletAddressAddition(
            addType: (state.extra as AddType?) ?? AddType.bank,
          ),
        ),
      ),
      CustomRoute(
        path: '/wallet_addition_dc',
        pageBuilder: (context, state) => ModalRoutePage(
          WalletAddressDcAddition(),
        ),
      ),
      CustomRoute(
        path: '/funds',
        builder: (context, state) => const Funds(),
      ),
    ],
  ),
  CustomShellRoute(
    builder: advertiseLayout,
    routes: [
      CustomRoute(
        path: '/advertise',
        builder: (context, state) => const Advertise(),
      ),
    ],
  ),
  CustomRoute(
    path: '/contract_wallet',
    builder: (context, state) => const ContractWallet(),
  ),
  CustomRoute(
    path: '/captcha',
    pageBuilder: (context, state) => ModalRoutePage(
      Captcha(
        device: (state.extra as dynamic)['device'],
        service: (state.extra as dynamic)['service'],
        account: (state.extra as dynamic)['account'],
      ),
    ),
  ),
  CustomRoute(
    path: '/f2a',
    pageBuilder: (context, state) => ModalRoutePage(
      const UserF2a(),
    ),
  ),
  CustomRoute(
    path: '/email',
    pageBuilder: (context, state) => ModalRoutePage(
      const UserEmailAddress(),
    ),
  ),
  CustomRoute(
    path: '/bind_f2a',
    pageBuilder: (context, state) => ModalRoutePage(
      const BindingPhone(),
    ),
  ),
  CustomRoute(
    path: '/auth_primary',
    pageBuilder: (context, state) => ModalRoutePage(
      const AuthPrimary(),
    ),
  ),
  CustomRoute(
    path: '/auth_junior',
    pageBuilder: (context, state) => ModalRoutePage(
      const AuthJunior(),
    ),
  ),
  CustomRoute(
    path: '/auth_senior',
    pageBuilder: (context, state) => ModalRoutePage(
      const AuthSenior(),
    ),
  ),
  CustomRoute(
    path: '/agent',
    pageBuilder: (context, state) => ModalRoutePage(
      const Agent(),
    ),
  ),
  CustomRoute(
    path: '/setting_nickname',
    pageBuilder: (context, state) => ModalRoutePage(
      const SettingNickname(),
    ),
  ),
  CustomRoute(
    path: '/update_avatar',
    pageBuilder: (context, state) => ModalRoutePage(
      const UpdateAvatar(),
    ),
  ),
  CustomRoute(
    path: '/advertise_place',
    pageBuilder: (context, state) => ModalRoutePage(
      const AdvertisePlace(),
    ),
  ),
  CustomRoute(
    path: '/slider_captcha',
    pageBuilder: (context, state) => ModalRoutePage(
      const SliderCaptcha(),
      false,
    ),
  ),
  CustomRoute(
    path: '/',
    builder: (context, state) => const HomePage(),
  ),
  CustomRoute(
    path: '/456',
    builder: (context, state) => const HomePage(),
  ),
  CustomRoute(
    path: '/terms',
    builder: (context, state) => const LegalTerms(),
  ),
];

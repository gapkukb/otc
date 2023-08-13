part of router;

final List<RouteBase> routes = [
  ShellRoute(
    navigatorKey: appLayoutKey,
    builder: layout,
    routes: [
      GoRoute(
        parentNavigatorKey: appLayoutKey,
        name: Routes.home,
        path: Routes.home,
        builder: (context, state) => const Home(),
      ),
      ShellRoute(
        navigatorKey: userLayoutKey,
        builder: userLayout,
        routes: [
          AuthRoute(
            path: Routes.user,
            page: const UserHome(),
          ),
          AuthRoute(
            path: Routes.setting,
            page: const UserSetting(),
          ),
          AuthRoute(
            path: Routes.auth,
            page: const UserAuth(),
          ),
          AuthRoute(
            path: Routes.security,
            page: const UserSecurity(),
          ),
          AuthRoute(
            path: Routes.tasks,
            page: const UserTasks(),
          ),
          AuthRoute(
            path: Routes.c2c,
            page: const UserC2C(),
          ),
          AuthRoute(
            path: Routes.merchant,
            page: const Merchant(),
          ),
          AuthRoute(
            path: Routes.rebate,
            page: const UserRebate(),
          ),
          AuthRoute(
            path: Routes.userInvitation,
            page: const UserInvitation(),
          ),
        ],
      ),
      ShellRoute(
        navigatorKey: orderLayoutKey,
        builder: orderLayout,
        routes: [
          AuthRoute(
            path: Routes.order,
            page: const OrderC2c(),
          ),
          AuthRoute(
            path: Routes.pendingSpotOrder,
            page: const PendingSpotOrder(),
          ),
          AuthRoute(
            path: Routes.historySpotOrder,
            page: const HistorySpotOrder(),
          ),
          AuthRoute(
            path: Routes.doneSpotOrder,
            page: const DoneSpotOrder(),
          ),
          AuthRoute(
            path: Routes.pendingFutureOrder,
            page: const PendingFutureOrder(),
          ),
          AuthRoute(
            path: Routes.historyFutureOrder,
            page: const HistoryFutureOrder(),
          ),
          AuthRoute(
            path: Routes.doneFutureOrder,
            page: const DoneFutureOrder(),
          ),
        ],
      ),
      ShellRoute(
        navigatorKey: walletLayoutKey,
        builder: walletLayout,
        routes: [
          AuthRoute(
            path: Routes.wallet,
            page: const WalletHome(),
          ),
          AuthRoute(
            path: Routes.walletMethod,
            statePage: (_, state) => WalletMethod(
              tabIndex: state.extra as int?,
            ),
          ),
          AuthRoute(
            path: Routes.walletFunds,
            page: const WalletFunds(),
          ),
          AuthRoute(
            path: Routes.walletHistory,
            statePage: (context, state) => WalletHistory(initialIndex: state.extra as int?),
          ),
          AuthRoute(
            path: Routes.walletSpot,
            page: const WalletSpot(),
          ),
          AuthRoute(
            path: Routes.walletFutures,
            page: const WalletFutures(),
          ),
        ],
      ),
      ShellRoute(
        navigatorKey: merchantLayoutKey,
        builder: merchantLayout,
        routes: [
          AuthRoute(
            path: Routes.merchantDashboard,
            page: const AgentDashboard(),
          ),
          AuthRoute(
            path: Routes.merchantIncome,
            page: const MerchantIncome(),
          ),
          AuthRoute(
            path: Routes.merchantSetting,
            page: const MerchantSetting(),
          ),
          AuthRoute(
            path: Routes.merchantInvitation,
            page: const MerchantInvitation(),
          ),
        ],
      ),
      ShellRoute(
        navigatorKey: advertiseLayoutKey,
        builder: advertiseLayout,
        routes: [
          AuthRoute(
            path: Routes.adBuying,
            page: const AdBuying(),
          ),
          AuthRoute(
            path: Routes.adSelling,
            page: const AdSelling(),
          ),
          AuthRoute(
            path: Routes.adOwn,
            page: const AdOwn(),
          ),
          AuthRoute(
            path: Routes.adHistory,
            page: const AdHistory(),
          ),
          AuthRoute(
            path: Routes.course,
            page: const Course(),
          ),
        ],
      ),
    ],
  ),
  ModalRoute(
    path: '/notice_window',
    barrierDismissible: true,
    statePage: (context, state) => const NoticeWindow(),
  ),
  ModalRoute(
    path: Routes.updateNickname,
    page: const UpdateNickname(),
  ),
  ModalRoute(
    path: Routes.updateAvatar,
    page: const SettingAvatar(),
  ),
  ModalRoute(
    path: Routes.udpatePwd,
    page: const UpdatePwd(),
  ),
  ModalRoute(
      path: Routes.captcha,
      statePage: (context, state) {
        final CaptchaWindowOptions? option = state.extra as dynamic;
        return Captcha(
          preferredDevice: option?.preferredDevice,
          session: option?.session,
          account: option?.account,
          switchable: option?.switchable,
          user: option?.user ?? global.user,
          autoStart: option?.autoStart,
          legend: option?.legend,
        );
      }),
  ModalRoute(
    path: Routes.updateEmail,
    page: const UpdateEmail(),
  ),
  ModalRoute(
    path: Routes.f2a,
    statePage: (context, state) => F2A(
      text: state.extra as String,
    ),
  ),
  ModalRoute(
    path: Routes.updatePhone,
    page: const UpdatePhone(),
  ),
  ModalRoute(
    path: Routes.updateFundsPwd,
    page: const UpdateFundsPwd(),
  ),
  ModalRoute(
    path: Routes.resetPwd,
    page: const ResetPwd(),
  ),
  ModalRoute(
    path: Routes.walletMethodBankAddition,
    page: const WalletMethodBankAddition(),
  ),
  ModalRoute(
    path: Routes.walletMethodQRcodeAddition,
    statePage: (context, state) => WalletMethodQRcodeAddition(
      addType: state.extra as dynamic,
    ),
  ),
  ModalRoute(
    path: Routes.walletMethodCryptoAddition,
    page: const ModelMethodCryptoAddtion(),
  ),
  ModalRoute(
    path: Routes.recharge,
    page: const Recharge(),
  ),
  ModalRoute(
    path: Routes.withdrawal,
    page: const Withdrawal(),
  ),
  ModalRoute(
    path: Routes.authPrimary,
    page: const AuthPrimary(),
  ),
  ModalRoute(
    path: Routes.authJunior,
    page: const AuthJunior(),
  ),
  ModalRoute(
    path: Routes.authSenior,
    page: const AuthSenior(),
  ),
  ModalRoute(
    path: Routes.adPostPayment,
    statePage: (context, state) => AdPostPayment(isBuying: state.extra as bool),
  ),
  ModalRoute(
    path: Routes.adPost,
    statePage: (context, state) => AdPost(type: state.extra as AdPostType),
  ),
  ModalRoute(
    path: Routes.transfer,
    page: const WalletTransfer(),
  ),
  ModalRoute(
    path: Routes.walletDetail,
    statePage: (context, state) => WalletDetail(id: state.pathParameters['id']!),
  ),
  ModalRoute(
    path: Routes.login,
    page: const Login(),
    barrierDismissible: true,
  ),
  ModalRoute(
    path: Routes.register,
    page: const Register(),
    barrierDismissible: true,
  ),
  ModalRoute(
    path: Routes.terms,
    page: const Terms(),
  ),
  ModalRoute(
    path: Routes.notice,
    page: const NoticeWindow(),
  ),
];

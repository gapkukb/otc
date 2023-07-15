part of router;

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
        ],
      ),
    ],
  ),
  ModalRoute(
    path: '/notice_window',
    transparent: true,
    statePage: (context, state) => const NoticeWindow(),
  ),
  ModalRoute(
    path: Routes.login,
    page: const Login(),
  ),
  ModalRoute(
    path: Routes.settingNickname,
    page: const SettingNickname(),
  ),
  ModalRoute(
    path: Routes.settingAvatar,
    page: const SettingAvatar(),
  ),
  ModalRoute(
    path: Routes.udpatePwd,
    page: const UpdatePwd(),
  ),
  ModalRoute(
    path: Routes.captcha,
    statePage: (context, state) => Captcha(
      preferredDevice: (state.extra as dynamic)['preferredDevice'],
      service: (state.extra as dynamic)['service'],
      account: (state.extra as dynamic)['account'],
      switchable: (state.extra as dynamic)['switchable'],
      user: (state.extra as dynamic)['user'],
    ),
  ),
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
];

library router;

import 'dart:developer';

import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:otc/pages/advertise/advertise.dart';
import 'package:otc/pages/advertise/advertise_place/advertise_place.dart';
import 'package:otc/pages/advertise/layout/advertise_layout.dart';
import 'package:otc/pages/agent/agent.dart';
import 'package:otc/pages/legal_terms/legal_terms.dart';
import 'package:otc/pages/register/register.dart';
import 'package:otc/pages/reset_password/reset_password.dart';
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
import 'package:otc/pages/user/setting/update_avatar.dart';
import 'package:otc/pages/user/captcha/captcha.dart';
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

part './route.dart';
part './routes.dart';

final navigatorKey = GlobalKey<NavigatorState>();

final router = GoRouter(
  navigatorKey: navigatorKey,
  // 根据平台和启动页引导页区分
  initialLocation: '/register',
  debugLogDiagnostics: true,
  redirect: (context, state) {
    // for (var element in routes) {
    //   if (element.runtimeType == CustomShellRoute) {
    //     var route = deepFind(element as CustomShellRoute, state.location);
    //     if (route == null) {}
    //   }
    // }

    return null;
  },
  errorBuilder: (context, state) {
    // if (state.error == 404) {
    // }

    return const Page404();
  },
  observers: [BotToastNavigatorObserver()],
  routes: routes,
);

library router;

import 'package:flutter/material.dart';
import 'package:bot_toast/bot_toast.dart';
import 'package:go_router/go_router.dart';
import 'package:otc/pages/error/404.dart';
import 'package:otc/pages/account/login/login.dart';
import 'package:otc/pages/home/home.dart';
import 'package:otc/pages/notice/notice_window.dart';
import 'package:otc/pages/order/done.future.order/done.future.order.dart';
import 'package:otc/pages/order/done.spot.order/done.spot.order.dart';
import 'package:otc/pages/order/history.future.order/history.future.order.dart';
import 'package:otc/pages/order/history.spot.order/history.spot.order.dart';
import 'package:otc/pages/order/c2c.order/c2c.order.dart';
import 'package:otc/pages/order/pending.future.order/pending.future.order.dart';
import 'package:otc/pages/order/pending.spot.order/pending.spot.order.dart';
import 'package:otc/pages/user/merchant/merchant.dart';
import 'package:otc/pages/user/auth/auth.dart';
import 'package:otc/pages/user/c2c/c2c.dart';
import 'package:otc/pages/user/captcha/captcha.dart';
import 'package:otc/pages/user/f2a/f2a.dart';
import 'package:otc/pages/user/reset.pwd/reset.pwd.dart';
import 'package:otc/pages/user/tasks/user_tasks.dart';
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
import 'package:otc/pages/order/layout/layout.dart';
import 'package:otc/pages/wallet/layout/layout.dart';
import 'package:otc/pages/wallet/wallet.home/wallet.home.dart';
import '../layout/layout.dart';

part 'router.name.dart';
part 'routes.dart';
part "router.helper.dart";

final router = GoRouter(
  navigatorKey: navigatorKey,
  // 根据平台和启动页引导页区分
  initialLocation: Routes.order,
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

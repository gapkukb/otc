import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:otc/models/user/user.model.dart';
import 'package:otc/pages/user/captcha/captcha.dart';
import 'package:otc/router/route_name.dart';
import 'package:otc/router/router.keys.dart';
import 'package:otc/utils/navigator.dart';

Future<void> bindEmail(BuildContext context, UserModel user) async {
  final code = await openCaptchaView(
    context: context,
    device: CaptchaDeviceType.phone,
    service: CaptchaServiceType.boundEmail,
    switchable: false,
    account: user.phone,
  );

  await GoRouter.of(navigatorKey.currentContext!).pushNamed(Routes.updateEmail);
}

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:otc/pages/user/captcha/captcha.dart';
import 'package:otc/router/route_name.dart';

Future<Map<String, String>?> openCaptchaView({
  required BuildContext context,
  required CaptchaDeviceType device,
  required CaptchaServiceType service,
  String? account,
  bool? switchable,
}) {
  return context.pushNamed(
    Routes.captcha,
    extra: {
      "device": device,
      "service": service,
      "account": account,
      "switchable": switchable,
    },
  );
}

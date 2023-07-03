import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:otc/pages/user/captcha/captcha.dart';

Future<String?> openCaptchaView({
  required BuildContext context,
  required CaptchaDeviceType device,
  required CaptchaServiceType service,
  String? account,
}) {
  return context.push<String>(
    '/captcha',
    extra: {
      "device": device,
      "service": service,
      "account": account,
    },
  );
}

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:otc/global/global.dart';
import 'package:otc/models/user/user.model.dart';
import 'package:otc/pages/user/captcha/captcha.dart';
import 'package:otc/router/router.dart';

export 'package:otc/pages/user/captcha/captcha.dart'
    show CaptchaDeviceType, CaptchaServiceType, CaptchaController;

Future<Map<String, String>?> openCaptchaWindow({
  required BuildContext context,
  CaptchaDeviceType? preferredDevice,
  required CaptchaServiceType service,
  String? account,
  bool? switchable,
  UserModel? user,
  bool? autoStart,
  String? legend,
}) {
  return context.pushNamed(
    Routes.captcha,
    extra: {
      "preferredDevice": preferredDevice,
      "service": service,
      "account": account,
      "switchable": switchable,
      "autoStart": autoStart,
      "legend": legend,
      "user": user ?? global.user,
    },
  );
}

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:otc/global/global.dart';
import 'package:otc/models/user/user.model.dart';
import 'package:otc/pages/user/captcha/captcha.dart';
import 'package:otc/router/router.dart';

export 'package:otc/pages/user/captcha/captcha.dart'
    show CaptchaDevice, CaptchaSession, CaptchaController;

Future<Map<String, String>?> openCaptchaWindow(CaptchaWindowOptions option) {
  return (option.context ?? navigatorKey.currentContext!).pushNamed(
    Routes.captcha,
    extra: {
      "preferredDevice": option.preferredDevice,
      "service": option.service,
      "account": option.account,
      "switchable": option.switchable,
      "autoStart": option.autoStart,
      "legend": option.legend,
      "user": option.user ?? global.user,
    },
  );
}

class CaptchaWindowOptions {
  final BuildContext? context;
  final CaptchaDevice? preferredDevice;
  final CaptchaSession? service;
  final String? account;
  final bool? switchable;
  final UserModel? user;
  final bool? autoStart;
  final String? legend;

  CaptchaWindowOptions({
    this.context,
    this.preferredDevice,
    this.service,
    this.account,
    this.switchable,
    this.user,
    this.autoStart,
    this.legend,
  });
}

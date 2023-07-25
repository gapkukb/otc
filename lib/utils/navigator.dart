import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:otc/models/user/user.model.dart';
import 'package:otc/pages/user/captcha/captcha.dart';
import 'package:otc/router/router.dart';

export 'package:otc/pages/user/captcha/captcha.dart' show CaptchaDevice, CaptchaSession, CaptchaController;

Future<Map<String, dynamic>?> openCaptchaWindow(CaptchaWindowOptions option) {
  return (option.context ?? navigatorKey.currentContext!).pushNamed(
    Routes.captcha,
    extra: option,
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

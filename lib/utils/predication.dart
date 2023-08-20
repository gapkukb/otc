import 'dart:async';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:otc/components/modal/modal.dart';
import 'package:otc/global/global.dart';
import 'package:otc/models/kyc/kyc.model.dart';
import 'package:otc/router/router.dart';

enum Predication {
  kyc1,
  phone,
  email,
  funds,
  captcha,
}

FutureOr<bool> predication({
  BuildContext? context,
  List<Predication> types = const [],
  FutureOr Function(BuildContext context)? extend,
}) async {
  final ctx = context ?? navigatorKey.currentContext!;

  if (types.contains(Predication.phone)) {
    if (!global.user.base.phoneValid) {
      Modal.confirm(
        okButtonText: "去绑定",
        title: "交易资格",
        content: "您必须完成手机绑定才能使用此功能。",
        onOk: () {
          ctx.go(Routes.security);
        },
      );
      return false;
    }
  }

  if (types.contains(Predication.kyc1)) {
    if (global.user.kyc?.lv1Status != KycStatus.pass) {
      Modal.confirm(
        okButtonText: "去认证",
        title: "交易资格",
        content: "您必须完成至少KYC1级别的身份认证才能使用此功能。",
        onOk: () {
          ctx.go(Routes.auth);
        },
      );
      return false;
    }
  }

  if (types.contains(Predication.funds)) {
    if (!global.user.base.hasPaymentPassword) {
      Modal.alert(
        title: "提币提醒",
        content: "您尚未设置资金密码",
        okButtonText: "去开启",
        onOk: () {
          ctx.go(Routes.security);
        },
      );
      return false;
    }
  }

  if (types.contains(Predication.captcha)) {
    if (global.captchaTokenExpire.isBefore(DateTime.now())) {
      final result = await ctx.push(Routes.captcha);

      return result != null;
    }
  }

  await extend?.call(ctx);

  return true;
}

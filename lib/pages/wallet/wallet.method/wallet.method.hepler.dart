import 'dart:async';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:otc/components/modal/modal.dart';
import 'package:otc/global/global.dart';
import 'package:otc/models/kyc/kyc.model.dart';
import 'package:otc/router/router.dart';

enum AddType {
  bank("BANK_CARD_TRANSFER", "银行卡"),
  alipay("ALIPAY_TRANSFER", "支付宝"),
  wechat("WECHAT_TRANSFER", "微信");

  const AddType(this.type, this.chinese);

  final String type;
  final String chinese;
}

// 前置判断的高阶函数
void Function() verify(BuildContext context, FutureOr Function() then) {
  return () async {
    if (!global.user.base.phoneValid) {
      Modal.confirm(
        okButtonText: "去绑定",
        title: "交易资格",
        content: "您必须完成手机绑定才能使用此功能。",
        onOk: () {
          context.push(Routes.security);
        },
      );
      return;
    }
    if (global.user.kyc?.lv1Status != KycStatus.pass) {
      Modal.confirm(
        okButtonText: "去认证",
        title: "交易资格",
        content: "您必须完成至少KYC1级别的身份认证才能使用此功能。",
        onOk: () {
          context.push(Routes.auth);
        },
      );
      return;
    }

    await then();
  };
}

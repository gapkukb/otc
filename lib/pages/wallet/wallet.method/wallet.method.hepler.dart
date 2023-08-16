import 'dart:async';

import 'package:flutter/material.dart';
import 'package:otc/utils/predication.dart';

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
    if (await predication(
      context: context,
      types: [
        Predication.phone,
        Predication.kyc1,
        Predication.captcha,
      ],
    )) {
      then();
    }
  };
}

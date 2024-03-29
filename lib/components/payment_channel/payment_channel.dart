import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:otc/asstes/assets.gen.dart';

@JsonEnum(valueField: 'value')
enum PaymentMethods {
  bankCard(
    type: 0,
    text: "银行借记卡",
    value: "BANK_CARD_TRANSFER",
  ),
  wechat(
    type: 1,
    text: "微信",
    value: "WECHAT_TRANSFER",
  ),
  alipay(
    type: 2,
    text: "支付宝",
    value: "ALIPAY_TRANSFER",
  );

  const PaymentMethods({
    required this.type,
    required this.text,
    required this.value,
  });

  final int type;
  final String text;
  final String value;

  Widget get widget {
    return Chip(
      labelPadding: EdgeInsets.zero,
      labelStyle: const TextStyle(fontSize: 12),
      label: Text(text),
      avatar: Icon(
        Icons.fiber_manual_record,
        size: 10,
        color: color,
      ),
    );
  }

  Color get color {
    return type == PaymentMethods.bankCard.type
        ? Colors.orange
        : type == PaymentMethods.wechat.type
            ? Colors.green
            : Colors.blue;
  }

  Image icon([double? size]) {
    final s = size ?? 24;
    switch (type) {
      case 0:
        return Assets.images.unionpay.image(height: s);

      case 1:
        return Assets.images.wechat.image(height: s);

      default:
        return Assets.images.alipay.image(height: s);
    }
  }

  static PaymentMethods fromType(int type) {
    return type == PaymentMethods.bankCard.type
        ? PaymentMethods.bankCard
        : type == PaymentMethods.wechat.type
            ? PaymentMethods.wechat
            : PaymentMethods.bankCard;
  }

  static PaymentMethods getByValue(String value) {
    return PaymentMethods.values.firstWhere((element) => element.value == value);
  }
}

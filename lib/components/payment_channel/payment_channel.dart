import 'package:flutter/material.dart';

enum PaymentChannel {
  bankCard(type: 0, text: "银行借记卡"),
  wechat(type: 1, text: "微信"),
  alipay(type: 2, text: "支付宝");

  const PaymentChannel({
    required this.type,
    required this.text,
  });

  final int type;
  final String text;

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
    return type == PaymentChannel.bankCard.type
        ? Colors.orange
        : type == PaymentChannel.wechat.type
            ? Colors.green
            : Colors.blue;
  }

  static PaymentChannel fromType(int type) {
    return type == PaymentChannel.bankCard.type
        ? PaymentChannel.bankCard
        : type == PaymentChannel.wechat.type
            ? PaymentChannel.wechat
            : PaymentChannel.bankCard;
  }
}

import 'package:flutter/material.dart';

enum PaymentChannel {
  bank(type: 0, name: "银行借记卡"),
  wechat(type: 1, name: "微信"),
  alpay(type: 2, name: "支付宝");

  const PaymentChannel({
    required this.type,
    required this.name,
  });

  final int type;
  final String name;

  Widget get widget {
    return Chip(
      labelPadding: EdgeInsets.zero,
      labelStyle: const TextStyle(fontSize: 12),
      label: Text(name),
      avatar: Icon(
        Icons.fiber_manual_record,
        size: 10,
        color: color,
      ),
    );
  }

  Color get color {
    return type == PaymentChannel.bank.type
        ? Colors.orange
        : type == PaymentChannel.wechat.type
            ? Colors.green
            : Colors.blue;
  }

  static PaymentChannel fromType(int type) {
    return type == PaymentChannel.bank.type
        ? PaymentChannel.bank
        : type == PaymentChannel.wechat.type
            ? PaymentChannel.wechat
            : PaymentChannel.bank;
  }
}

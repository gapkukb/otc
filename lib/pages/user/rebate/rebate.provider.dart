import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:otc/apis/apis.dart';
import 'dart:convert';

class RabateNotifier extends StateNotifier<RabateModel> {
  RabateNotifier() : super(RabateModel()) {
    update();
  }

  update() async {
    final data = await apis.otc.getCommissionRate();
    state = RabateModel.fromJson(data);
  }
}

final rabateProvider = StateNotifierProvider<RabateNotifier, RabateModel>((ref) {
  return RabateNotifier();
});

class RabateModel {
  final num alipayTransfer;
  final num wechatTransfer;
  final num bankCardTransfer;

  RabateModel({
    this.alipayTransfer = 0,
    this.wechatTransfer = 0,
    this.bankCardTransfer = 0,
  });

  RabateModel copyWith({
    num? alipayTransfer,
    num? wechatTransfer,
    num? bankCardTransfer,
  }) =>
      RabateModel(
        alipayTransfer: alipayTransfer ?? this.alipayTransfer,
        wechatTransfer: wechatTransfer ?? this.wechatTransfer,
        bankCardTransfer: bankCardTransfer ?? this.bankCardTransfer,
      );

  factory RabateModel.fromRawJson(String str) => RabateModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory RabateModel.fromJson(Map<String, dynamic> json) => RabateModel(
        alipayTransfer: json["ALIPAY_TRANSFER"]?.toDouble(),
        wechatTransfer: json["WECHAT_TRANSFER"]?.toDouble(),
        bankCardTransfer: json["BANK_CARD_TRANSFER"]?.toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "ALIPAY_TRANSFER": alipayTransfer,
        "WECHAT_TRANSFER": wechatTransfer,
        "BANK_CARD_TRANSFER": bankCardTransfer,
      };
}

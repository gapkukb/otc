import 'dart:convert';

class MerchantDashboradModel {
  final num bankcardRate;
  final num aliRate;
  final num wechatRate;
  final num yesterdayCommission;
  final num yesterdaySuccess;
  final num totalCommission;
  final num totalSuccess;
  final num subordinates;

  MerchantDashboradModel({
    this.bankcardRate = 0,
    this.aliRate = 0,
    this.wechatRate = 0,
    this.yesterdayCommission = 0,
    this.yesterdaySuccess = 0,
    this.totalCommission = 0,
    this.totalSuccess = 0,
    this.subordinates = 0,
  });

  MerchantDashboradModel copyWith({
    num? bankcardRate,
    num? aliRate,
    num? wechatRate,
    num? yesterdayCommission,
    num? yesterdaySuccess,
    num? totalCommission,
    num? totalSuccess,
    num? subordinates,
  }) =>
      MerchantDashboradModel(
        bankcardRate: bankcardRate ?? this.bankcardRate,
        aliRate: aliRate ?? this.aliRate,
        wechatRate: wechatRate ?? this.wechatRate,
        yesterdayCommission: yesterdayCommission ?? this.yesterdayCommission,
        yesterdaySuccess: yesterdaySuccess ?? this.yesterdaySuccess,
        totalCommission: totalCommission ?? this.totalCommission,
        totalSuccess: totalSuccess ?? this.totalSuccess,
        subordinates: subordinates ?? this.subordinates,
      );

  factory MerchantDashboradModel.fromRawJson(String str) => MerchantDashboradModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory MerchantDashboradModel.fromJson(Map<String, dynamic> json) => MerchantDashboradModel(
        bankcardRate: json["bankcardRate"],
        aliRate: json["aliRate"],
        wechatRate: json["wechatRate"],
        yesterdayCommission: json["yesterdayCommission"],
        yesterdaySuccess: json["yesterdaySuccess"],
        totalCommission: json["totalCommission"],
        totalSuccess: json["totalSuccess"],
        subordinates: json["subordinates"],
      );

  Map<String, dynamic> toJson() => {
        "bankcardRate": bankcardRate,
        "aliRate": aliRate,
        "wechatRate": wechatRate,
        "yesterdayCommission": yesterdayCommission,
        "yesterdaySuccess": yesterdaySuccess,
        "totalCommission": totalCommission,
        "totalSuccess": totalSuccess,
        "subordinates": subordinates,
      };
}

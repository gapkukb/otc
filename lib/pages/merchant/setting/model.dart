import 'dart:convert';

class MerchantSettingModel {
  final int id;
  final String username;
  final double wechatLv1;
  final double alipayLv1;
  final double bankCardLv1;
  final double wechatLv2;
  final double alipayLv2;
  final double bankCardLv2;
  final double wechatLv3;
  final double alipayLv3;
  final double bankCardLv3;
  final double wechatLv4;
  final double alipayLv4;
  final double bankCardLv4;
  final double alipayTotal;
  final double wechatTotal;
  final double bankcardTotal;
  final double alipayMakerRate;
  final double wechatMakerRate;
  final double bankcardMakerRate;
  final String createdTime;

  MerchantSettingModel({
    required this.id,
    required this.username,
    required this.wechatLv1,
    required this.alipayLv1,
    required this.bankCardLv1,
    required this.wechatLv2,
    required this.alipayLv2,
    required this.bankCardLv2,
    required this.wechatLv3,
    required this.alipayLv3,
    required this.bankCardLv3,
    required this.wechatLv4,
    required this.alipayLv4,
    required this.bankCardLv4,
    required this.alipayTotal,
    required this.wechatTotal,
    required this.bankcardTotal,
    required this.alipayMakerRate,
    required this.wechatMakerRate,
    required this.bankcardMakerRate,
    required this.createdTime,
  });

  MerchantSettingModel copyWith({
    int? id,
    String? username,
    double? wechatLv1,
    double? alipayLv1,
    double? bankCardLv1,
    double? wechatLv2,
    double? alipayLv2,
    double? bankCardLv2,
    double? wechatLv3,
    double? alipayLv3,
    double? bankCardLv3,
    double? wechatLv4,
    double? alipayLv4,
    double? bankCardLv4,
    double? alipayTotal,
    double? wechatTotal,
    double? bankcardTotal,
    double? alipayMakerRate,
    double? wechatMakerRate,
    double? bankcardMakerRate,
    String? createdTime,
  }) =>
      MerchantSettingModel(
        id: id ?? this.id,
        username: username ?? this.username,
        wechatLv1: wechatLv1 ?? this.wechatLv1,
        alipayLv1: alipayLv1 ?? this.alipayLv1,
        bankCardLv1: bankCardLv1 ?? this.bankCardLv1,
        wechatLv2: wechatLv2 ?? this.wechatLv2,
        alipayLv2: alipayLv2 ?? this.alipayLv2,
        bankCardLv2: bankCardLv2 ?? this.bankCardLv2,
        wechatLv3: wechatLv3 ?? this.wechatLv3,
        alipayLv3: alipayLv3 ?? this.alipayLv3,
        bankCardLv3: bankCardLv3 ?? this.bankCardLv3,
        wechatLv4: wechatLv4 ?? this.wechatLv4,
        alipayLv4: alipayLv4 ?? this.alipayLv4,
        bankCardLv4: bankCardLv4 ?? this.bankCardLv4,
        alipayTotal: alipayTotal ?? this.alipayTotal,
        wechatTotal: wechatTotal ?? this.wechatTotal,
        bankcardTotal: bankcardTotal ?? this.bankcardTotal,
        alipayMakerRate: alipayMakerRate ?? this.alipayMakerRate,
        wechatMakerRate: wechatMakerRate ?? this.wechatMakerRate,
        bankcardMakerRate: bankcardMakerRate ?? this.bankcardMakerRate,
        createdTime: createdTime ?? this.createdTime,
      );

  factory MerchantSettingModel.fromRawJson(String str) => MerchantSettingModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory MerchantSettingModel.fromJson(Map<String, dynamic> json) => MerchantSettingModel(
        id: json["id"],
        username: json["username"],
        wechatLv1: json["wechatLv1"],
        alipayLv1: json["alipayLv1"],
        bankCardLv1: json["bankCardLv1"],
        wechatLv2: json["wechatLv2"],
        alipayLv2: json["alipayLv2"],
        bankCardLv2: json["bankCardLv2"],
        wechatLv3: json["wechatLv3"],
        alipayLv3: json["alipayLv3"],
        bankCardLv3: json["bankCardLv3"],
        wechatLv4: json["wechatLv4"],
        alipayLv4: json["alipayLv4"],
        bankCardLv4: json["bankCardLv4"],
        alipayTotal: json["alipayTotal"],
        wechatTotal: json["wechatTotal"],
        bankcardTotal: json["bankcardTotal"],
        alipayMakerRate: json["alipayMakerRate"],
        wechatMakerRate: json["wechatMakerRate"],
        bankcardMakerRate: json["bankcardMakerRate"],
        createdTime: json["createdTime"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "username": username,
        "wechatLv1": wechatLv1,
        "alipayLv1": alipayLv1,
        "bankCardLv1": bankCardLv1,
        "wechatLv2": wechatLv2,
        "alipayLv2": alipayLv2,
        "bankCardLv2": bankCardLv2,
        "wechatLv3": wechatLv3,
        "alipayLv3": alipayLv3,
        "bankCardLv3": bankCardLv3,
        "wechatLv4": wechatLv4,
        "alipayLv4": alipayLv4,
        "bankCardLv4": bankCardLv4,
        "alipayTotal": alipayTotal,
        "wechatTotal": wechatTotal,
        "bankcardTotal": bankcardTotal,
        "alipayMakerRate": alipayMakerRate,
        "wechatMakerRate": wechatMakerRate,
        "bankcardMakerRate": bankcardMakerRate,
        "createdTime": createdTime,
      };
}

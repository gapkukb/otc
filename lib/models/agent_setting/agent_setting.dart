import 'dart:convert';

class AgentSettingModel {
  final int id;
  final String username;
  final int wechatLv1;
  final int alipayLv1;
  final int bankCardLv1;
  final int wechatLv2;
  final int alipayLv2;
  final int bankCardLv2;
  final int wechatLv3;
  final int alipayLv3;
  final int bankCardLv3;
  final int wechatLv4;
  final int alipayLv4;
  final int bankCardLv4;
  final int alipayTotal;
  final int wechatTotal;
  final int bankcardTotal;
  final String createdTime;

  AgentSettingModel({
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
    required this.createdTime,
  });

  AgentSettingModel copyWith({
    int? id,
    String? username,
    int? wechatLv1,
    int? alipayLv1,
    int? bankCardLv1,
    int? wechatLv2,
    int? alipayLv2,
    int? bankCardLv2,
    int? wechatLv3,
    int? alipayLv3,
    int? bankCardLv3,
    int? wechatLv4,
    int? alipayLv4,
    int? bankCardLv4,
    int? alipayTotal,
    int? wechatTotal,
    int? bankcardTotal,
    String? createdTime,
  }) =>
      AgentSettingModel(
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
        createdTime: createdTime ?? this.createdTime,
      );

  factory AgentSettingModel.fromRawJson(String str) =>
      AgentSettingModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory AgentSettingModel.fromJson(Map<String, dynamic> json) =>
      AgentSettingModel(
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
        "createdTime": createdTime,
      };
}

import 'dart:convert';

class MerchantInvitationModel {
  final num id;
  final String username;
  final String invCode;
  final bool used;
  final String user;
  final String? usedTime;
  final String type;
  final num bankcardRate;
  final num alipayRate;
  final num wechatRate;
  final String creator;
  final String createdTime;

  MerchantInvitationModel({
    required this.id,
    required this.username,
    required this.invCode,
    required this.used,
    required this.user,
    required this.usedTime,
    required this.type,
    required this.bankcardRate,
    required this.alipayRate,
    required this.wechatRate,
    required this.creator,
    required this.createdTime,
  });

  MerchantInvitationModel copyWith({
    num? id,
    String? username,
    String? invCode,
    bool? used,
    String? user,
    String? usedTime,
    String? type,
    num? bankcardRate,
    num? alipayRate,
    num? wechatRate,
    String? creator,
    String? createdTime,
  }) =>
      MerchantInvitationModel(
        id: id ?? this.id,
        username: username ?? this.username,
        invCode: invCode ?? this.invCode,
        used: used ?? this.used,
        user: user ?? this.user,
        usedTime: usedTime ?? this.usedTime,
        type: type ?? this.type,
        bankcardRate: bankcardRate ?? this.bankcardRate,
        alipayRate: alipayRate ?? this.alipayRate,
        wechatRate: wechatRate ?? this.wechatRate,
        creator: creator ?? this.creator,
        createdTime: createdTime ?? this.createdTime,
      );

  factory MerchantInvitationModel.fromRawJson(String str) => MerchantInvitationModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory MerchantInvitationModel.fromJson(Map<String, dynamic> json) => MerchantInvitationModel(
        id: json["id"],
        username: json["username"],
        invCode: json["invCode"],
        used: json["used"],
        user: json["user"],
        usedTime: json["usedTime"],
        type: json["type"],
        bankcardRate: json["bankcardRate"],
        alipayRate: json["alipayRate"],
        wechatRate: json["wechatRate"],
        creator: json["creator"],
        createdTime: json["createdTime"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "username": username,
        "invCode": invCode,
        "used": used,
        "user": user,
        "usedTime": usedTime,
        "type": type,
        "bankcardRate": bankcardRate,
        "alipayRate": alipayRate,
        "wechatRate": wechatRate,
        "creator": creator,
        "createdTime": createdTime,
      };
}

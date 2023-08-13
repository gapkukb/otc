import 'dart:convert';

class UserInvitationModel {
  final int id;
  final String username;
  final String invCode;
  final bool used;
  final String user;
  final String usedTime;
  final String type;
  final int bankcardRate;
  final int alipayRate;
  final int wechatRate;
  final String creator;
  final String createdTime;

  UserInvitationModel({
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

  UserInvitationModel copyWith({
    int? id,
    String? username,
    String? invCode,
    bool? used,
    String? user,
    String? usedTime,
    String? type,
    int? bankcardRate,
    int? alipayRate,
    int? wechatRate,
    String? creator,
    String? createdTime,
  }) =>
      UserInvitationModel(
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

  factory UserInvitationModel.fromRawJson(String str) => UserInvitationModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory UserInvitationModel.fromJson(Map<String, dynamic> json) => UserInvitationModel(
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

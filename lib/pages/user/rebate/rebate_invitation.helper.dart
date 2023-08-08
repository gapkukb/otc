import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:otc/apis/apis.dart';

class RebateInvitationModel {
  final String nickname;
  final String username;
  final String firstTime;
  final String lastTime;
  final int makerSuccessTotal;

  RebateInvitationModel({
    required this.nickname,
    required this.username,
    required this.firstTime,
    required this.lastTime,
    required this.makerSuccessTotal,
  });

  RebateInvitationModel copyWith({
    String? nickname,
    String? username,
    String? firstTime,
    String? lastTime,
    int? makerSuccessTotal,
  }) =>
      RebateInvitationModel(
        nickname: nickname ?? this.nickname,
        username: username ?? this.username,
        firstTime: firstTime ?? this.firstTime,
        lastTime: lastTime ?? this.lastTime,
        makerSuccessTotal: makerSuccessTotal ?? this.makerSuccessTotal,
      );

  factory RebateInvitationModel.fromRawJson(String str) => RebateInvitationModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory RebateInvitationModel.fromJson(Map<String, dynamic> json) => RebateInvitationModel(
        nickname: json["nickname"],
        username: json["username"],
        firstTime: json["firstTime"],
        lastTime: json["lastTime"],
        makerSuccessTotal: json["makerSuccessTotal"],
      );

  Map<String, dynamic> toJson() => {
        "nickname": nickname,
        "username": username,
        "firstTime": firstTime,
        "lastTime": lastTime,
        "makerSuccessTotal": makerSuccessTotal,
      };
}

final rebateInvitationProvider = FutureProvider.autoDispose<List<RebateInvitationModel>>((ref) async {
  final data = await apis.otc.commissionInvPage({
    "page": 1,
    "pageSize": 8,
  });
  return (data["records"] as List).map((item) => RebateInvitationModel.fromJson(item)).toList();
});

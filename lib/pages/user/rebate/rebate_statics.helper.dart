import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:otc/apis/apis.dart';
import 'package:otc/utils/date_time.dart';

class RebateStaticsNotifier extends StateNotifier<List<RebateStaticsModel>> {
  RebateStaticsNotifier()
      : super([
          RebateStaticsModel(),
          RebateStaticsModel(),
          RebateStaticsModel(),
          RebateStaticsModel(),
        ]) {
    update();
  }

  update() async {
    final now = DateTime.now();
    final end = "${now.format()} 23:59:59";
    final list = await Future.wait([
      apis.otc.commissionOverview({}),
      apis.otc.commissionOverview({"begin": begin(now, 1), "end": end}),
      apis.otc.commissionOverview({"begin": begin(now, 7), "end": end}),
      apis.otc.commissionOverview({"begin": begin(now, 30), "end": end}),
    ]);

    state = list.map((e) => RebateStaticsModel.fromJson(e)).toList();
    return state;
  }

  begin(DateTime now, int days) {
    return "${now.subtract(Duration(days: days)).format()} 00:00:00";
  }
}

final rebateStaticsProvider = StateNotifierProvider.autoDispose<RebateStaticsNotifier, List<RebateStaticsModel>>((ref) {
  return RebateStaticsNotifier();
});

class RebateStaticsModel {
  final num commissionTotal;
  final num markerFriends;
  final num friends;

  RebateStaticsModel({
    this.commissionTotal = 0,
    this.markerFriends = 0,
    this.friends = 0,
  });

  RebateStaticsModel copyWith({
    num? commissionTotal,
    num? markerFriends,
    num? friends,
  }) =>
      RebateStaticsModel(
        commissionTotal: commissionTotal ?? this.commissionTotal,
        markerFriends: markerFriends ?? this.markerFriends,
        friends: friends ?? this.friends,
      );

  factory RebateStaticsModel.fromRawJson(String str) => RebateStaticsModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory RebateStaticsModel.fromJson(Map<String, dynamic> json) => RebateStaticsModel(
        commissionTotal: json["commissionTotal"],
        markerFriends: json["markerFriends"],
        friends: json["friends"],
      );

  Map<String, dynamic> toJson() => {
        "commissionTotal": commissionTotal,
        "markerFriends": markerFriends,
        "friends": friends,
      };
}

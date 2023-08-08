import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:otc/apis/apis.dart';

final c2cProvider = FutureProvider<C2CModel>((ref) async {
  return C2CModel.fromJson(await apis.otc.stat30days());
});

class C2CModel {
  C2CModel({
    required this.username,
    required this.range,
    required this.registerDays,
    required this.firstTradeDays,
    required this.historyTradeUsers,
    required this.commissionTotal,
    required this.rangeStat,
    required this.historyStat,
  });
  late final String username;
  late final Range range;
  late final num registerDays;
  late final num firstTradeDays;
  late final num historyTradeUsers;
  late final num commissionTotal;
  late final RangeStat rangeStat;
  late final HistoryStat historyStat;

  C2CModel.fromJson(Map<String, dynamic> json) {
    username = json['username'];
    range = Range.fromJson(json['range']);
    registerDays = json['registerDays'];
    firstTradeDays = json['firstTradeDays'];
    historyTradeUsers = json['historyTradeUsers'];
    commissionTotal = json['commissionTotal'];
    rangeStat = RangeStat.fromJson(json['rangeStat']);
    historyStat = HistoryStat.fromJson(json['historyStat']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['username'] = username;
    _data['range'] = range.toJson();
    _data['registerDays'] = registerDays;
    _data['firstTradeDays'] = firstTradeDays;
    _data['historyTradeUsers'] = historyTradeUsers;
    _data['commissionTotal'] = commissionTotal;
    _data['rangeStat'] = rangeStat.toJson();
    _data['historyStat'] = historyStat.toJson();
    return _data;
  }
}

class Range {
  Range({
    required this.begin,
    required this.end,
    required this.reverse,
  });
  late final String begin;
  late final String end;
  late final bool reverse;

  Range.fromJson(Map<String, dynamic> json) {
    begin = json['begin'];
    end = json['end'];
    reverse = json['reverse'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['begin'] = begin;
    _data['end'] = end;
    _data['reverse'] = reverse;
    return _data;
  }
}

class RangeStat {
  RangeStat({
    required this.takerBuyCount,
    required this.takerSellCount,
    required this.takerBugSuccessCount,
    required this.takerSellSuccessCount,
    required this.takerNotifyTime,
    required this.takerConfirmTime,
    required this.makerBuyCount,
    required this.makerSellCount,
    required this.makerSellSuccessCount,
    required this.makerBugSuccessCount,
    required this.makerNotifyTime,
    required this.makerConfirmTime,
  });
  late final num takerBuyCount;
  late final num takerSellCount;
  late final num takerBugSuccessCount;
  late final num takerSellSuccessCount;
  late final num takerNotifyTime;
  late final num takerConfirmTime;
  late final num makerBuyCount;
  late final num makerSellCount;
  late final num makerSellSuccessCount;
  late final num makerBugSuccessCount;
  late final num makerNotifyTime;
  late final num makerConfirmTime;

  RangeStat.fromJson(Map<String, dynamic> json) {
    takerBuyCount = json['takerBuyCount'];
    takerSellCount = json['takerSellCount'];
    takerBugSuccessCount = json['takerBugSuccessCount'];
    takerSellSuccessCount = json['takerSellSuccessCount'];
    takerNotifyTime = json['takerNotifyTime'];
    takerConfirmTime = json['takerConfirmTime'];
    makerBuyCount = json['makerBuyCount'];
    makerSellCount = json['makerSellCount'];
    makerSellSuccessCount = json['makerSellSuccessCount'];
    makerBugSuccessCount = json['makerBugSuccessCount'];
    makerNotifyTime = json['makerNotifyTime'];
    makerConfirmTime = json['makerConfirmTime'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['takerBuyCount'] = takerBuyCount;
    _data['takerSellCount'] = takerSellCount;
    _data['takerBugSuccessCount'] = takerBugSuccessCount;
    _data['takerSellSuccessCount'] = takerSellSuccessCount;
    _data['takerNotifyTime'] = takerNotifyTime;
    _data['takerConfirmTime'] = takerConfirmTime;
    _data['makerBuyCount'] = makerBuyCount;
    _data['makerSellCount'] = makerSellCount;
    _data['makerSellSuccessCount'] = makerSellSuccessCount;
    _data['makerBugSuccessCount'] = makerBugSuccessCount;
    _data['makerNotifyTime'] = makerNotifyTime;
    _data['makerConfirmTime'] = makerConfirmTime;
    return _data;
  }
}

class HistoryStat {
  HistoryStat({
    required this.takerBuyCount,
    required this.takerSellCount,
    required this.takerBugSuccessCount,
    required this.takerSellSuccessCount,
    required this.takerNotifyTime,
    required this.takerConfirmTime,
    required this.makerBuyCount,
    required this.makerSellCount,
    required this.makerSellSuccessCount,
    required this.makerBugSuccessCount,
    required this.makerNotifyTime,
    required this.makerConfirmTime,
  });
  late final num takerBuyCount;
  late final num takerSellCount;
  late final num takerBugSuccessCount;
  late final num takerSellSuccessCount;
  late final num takerNotifyTime;
  late final num takerConfirmTime;
  late final num makerBuyCount;
  late final num makerSellCount;
  late final num makerSellSuccessCount;
  late final num makerBugSuccessCount;
  late final num makerNotifyTime;
  late final num makerConfirmTime;

  HistoryStat.fromJson(Map<String, dynamic> json) {
    takerBuyCount = json['takerBuyCount'];
    takerSellCount = json['takerSellCount'];
    takerBugSuccessCount = json['takerBugSuccessCount'];
    takerSellSuccessCount = json['takerSellSuccessCount'];
    takerNotifyTime = json['takerNotifyTime'];
    takerConfirmTime = json['takerConfirmTime'];
    makerBuyCount = json['makerBuyCount'];
    makerSellCount = json['makerSellCount'];
    makerSellSuccessCount = json['makerSellSuccessCount'];
    makerBugSuccessCount = json['makerBugSuccessCount'];
    makerNotifyTime = json['makerNotifyTime'];
    makerConfirmTime = json['makerConfirmTime'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['takerBuyCount'] = takerBuyCount;
    _data['takerSellCount'] = takerSellCount;
    _data['takerBugSuccessCount'] = takerBugSuccessCount;
    _data['takerSellSuccessCount'] = takerSellSuccessCount;
    _data['takerNotifyTime'] = takerNotifyTime;
    _data['takerConfirmTime'] = takerConfirmTime;
    _data['makerBuyCount'] = makerBuyCount;
    _data['makerSellCount'] = makerSellCount;
    _data['makerSellSuccessCount'] = makerSellSuccessCount;
    _data['makerBugSuccessCount'] = makerBugSuccessCount;
    _data['makerNotifyTime'] = makerNotifyTime;
    _data['makerConfirmTime'] = makerConfirmTime;
    return _data;
  }
}

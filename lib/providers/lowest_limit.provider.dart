import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:otc/apis/apis.dart';

class LowestLimitNotifier extends StateNotifier<LowestLimitModel> {
  LowestLimitNotifier() : super(LowestLimitModel()) {
    _init();
  }

  _init() async {
    final resp = await apis.wallet.transferLimit();
    state = LowestLimitModel.fromJson(resp);
    return state;
  }
}

final lowestLimitProvider = StateNotifierProvider<LowestLimitNotifier, LowestLimitModel>((ref) {
  return LowestLimitNotifier();
});

class LowestLimitModel {
  LowestLimitModel({
    this.minWithdraw = 0,
    this.minDeposit = 0,
    this.maxWithdrawDaily = 0,
    this.maxTransferDaily = 0,
  });

  final num minWithdraw;
  final num minDeposit;
  final num maxWithdrawDaily;
  final num maxTransferDaily;

  factory LowestLimitModel.fromJson(Map<String, dynamic> json) {
    return LowestLimitModel(
      minWithdraw: json["minWithdraw"],
      minDeposit: json["minDeposit"],
      maxWithdrawDaily: json["maxWithdrawDaily"],
      maxTransferDaily: json["maxTransferDaily"],
    );
  }
}

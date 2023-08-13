import 'dart:math';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:otc/apis/apis.dart';
import 'package:otc/providers/wallet.provider.dart';

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
    this.gas = const {
      "ETH": 0,
      "BTC": 0,
      "BSC": 0,
      "TRON": 0,
    },
  });

  final num minWithdraw;
  final num minDeposit;
  final num maxWithdrawDaily;
  final num maxTransferDaily;
  final Map<String, num> gas;

  factory LowestLimitModel.fromJson(Map<String, dynamic> json) {
    return LowestLimitModel(
      minWithdraw: json["minWithdraw"],
      minDeposit: json["minDeposit"],
      maxWithdrawDaily: json["maxWithdrawDaily"],
      maxTransferDaily: json["maxTransferDaily"],
      gas: (json["gas"] as Map).cast(),
    );
  }
}

final withdrawLimitProvider = Provider<WithdrawLimitModel>((ref) {
  final balance = ref.watch(balanceProvider);
  final lowestLimit = ref.watch(lowestLimitProvider);

  return WithdrawLimitModel(
    lowestLimit.minWithdraw.toDouble(),
    min(balance.valid, lowestLimit.maxTransferDaily.toDouble()),
  );
});

class WithdrawLimitModel {
  final double min;
  final double max;

  const WithdrawLimitModel(this.min, this.max);
}

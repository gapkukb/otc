import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:otc/apis/apis.dart';
import 'package:otc/models/wallet.balance/wallet.balance.dart';

class WalletNotifier extends StateNotifier<WalletBalanceModel> {
  WalletNotifier()
      : super(WalletBalanceModel(
          balance: Balance(
            bnb: 0,
            usd: 0,
            eth: 0,
            cny: 0,
            trx: 0,
            btc: 0,
            usdt: 0,
          ),
          detail: [],
        ));

  Future<WalletBalanceModel> updateWallet() async {
    final Balance balance = await apis.wallet.currenciesBalances();

    state = state.copyWith(balance: balance);

    final List<dynamic> rawBalances = await apis.wallet.currenciesDetails();

    final List<Detail> balances =
        rawBalances.map((json) => Detail.fromJson(json)).toList();

    state = state.copyWith(detail: balances);
    return state;
  }

  BalanceTotal get total {
    final $total = BalanceTotal(balance: 0, freezed: 0, valid: 0);

    for (var element in state.detail) {
      total.balance += element.balance;
      total.valid += element.canUsd;
      total.freezed += element.balance - element.canUsd;
    }

    return $total;
  }
}

final walletProvider =
    StateNotifierProvider<WalletNotifier, WalletBalanceModel>((ref) {
  return WalletNotifier();
});

class BalanceTotal {
  double balance;
  double valid;
  double freezed;

  BalanceTotal({
    required this.balance,
    required this.freezed,
    required this.valid,
  });
}

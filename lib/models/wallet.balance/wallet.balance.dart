import 'dart:convert';

class WalletBalanceModel {
  final List<Detail> detail;
  final Balance balance;

  WalletBalanceModel({
    required this.detail,
    required this.balance,
  });

  WalletBalanceModel copyWith({
    List<Detail>? detail,
    Balance? balance,
  }) =>
      WalletBalanceModel(
        detail: detail ?? this.detail,
        balance: balance ?? this.balance,
      );

  factory WalletBalanceModel.fromRawJson(String str) =>
      WalletBalanceModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory WalletBalanceModel.fromJson(Map<String, dynamic> json) =>
      WalletBalanceModel(
        detail:
            List<Detail>.from(json["detail"].map((x) => Detail.fromJson(x))),
        balance: Balance.fromJson(json["balance"]),
      );

  Map<String, dynamic> toJson() => {
        "detail": List<dynamic>.from(detail.map((x) => x.toJson())),
        "balance": balance.toJson(),
      };
}

class Balance {
  final double bnb;
  final double usd;
  final double eth;
  final double cny;
  final double trx;
  final double btc;
  final double usdt;

  Balance({
    required this.bnb,
    required this.usd,
    required this.eth,
    required this.cny,
    required this.trx,
    required this.btc,
    required this.usdt,
  });

  Balance copyWith({
    double? bnb,
    double? usd,
    double? eth,
    double? cny,
    double? trx,
    double? btc,
    double? usdt,
  }) =>
      Balance(
        bnb: bnb ?? this.bnb,
        usd: usd ?? this.usd,
        eth: eth ?? this.eth,
        cny: cny ?? this.cny,
        trx: trx ?? this.trx,
        btc: btc ?? this.btc,
        usdt: usdt ?? this.usdt,
      );

  factory Balance.fromRawJson(String str) => Balance.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Balance.fromJson(Map<String, dynamic> json) => Balance(
        bnb: json["BNB"],
        usd: json["USD"],
        eth: json["ETH"],
        cny: json["CNY"],
        trx: json["TRX"],
        btc: json["BTC"],
        usdt: json["USDT"],
      );

  Map<String, dynamic> toJson() => {
        "BNB": bnb,
        "USD": usd,
        "ETH": eth,
        "CNY": cny,
        "TRX": trx,
        "BTC": btc,
        "USDT": usdt,
      };
}

class Detail {
  final String currency;
  final double balance;
  final double canUsd;
  final double usdtPrice;
  final double cnyPrice;

  Detail({
    required this.currency,
    required this.balance,
    required this.canUsd,
    required this.usdtPrice,
    required this.cnyPrice,
  });

  Detail copyWith({
    String? currency,
    double? balance,
    double? canUsd,
    double? usdtPrice,
    double? cnyPrice,
  }) =>
      Detail(
        currency: currency ?? this.currency,
        balance: balance ?? this.balance,
        canUsd: canUsd ?? this.canUsd,
        usdtPrice: usdtPrice ?? this.usdtPrice,
        cnyPrice: cnyPrice ?? this.cnyPrice,
      );

  factory Detail.fromRawJson(String str) => Detail.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Detail.fromJson(Map<String, dynamic> json) => Detail(
        currency: json["currency"],
        balance: json["balance"],
        canUsd: json["canUsd"],
        usdtPrice: json["usdtPrice"],
        cnyPrice: json["cnyPrice"],
      );

  Map<String, dynamic> toJson() => {
        "currency": currency,
        "balance": balance,
        "canUsd": canUsd,
        "usdtPrice": usdtPrice,
        "cnyPrice": cnyPrice,
      };
}

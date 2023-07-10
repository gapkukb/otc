class WalletAllBalance {
  String currency;
  int balance;
  int canUsd;
  int usdtPrice;
  int cnyPrice;

  WalletAllBalance({
    required this.currency,
    required this.balance,
    required this.canUsd,
    required this.usdtPrice,
    required this.cnyPrice,
  });

  factory WalletAllBalance.fromJson(Map<String, dynamic> json) {
    return WalletAllBalance(
      currency: json['currency'] as String,
      balance: json['balance'] as int,
      canUsd: json['canUsd'] as int,
      usdtPrice: json['usdtPrice'] as int,
      cnyPrice: json['cnyPrice'] as int,
    );
  }

  Map<String, dynamic> toJson() => {
        'currency': currency,
        'balance': balance,
        'canUsd': canUsd,
        'usdtPrice': usdtPrice,
        'cnyPrice': cnyPrice,
      };
}

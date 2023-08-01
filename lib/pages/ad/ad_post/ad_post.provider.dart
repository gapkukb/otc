part of ad_post;

final rateProvider = StateProvider<double>((ref) {
  return 0;
});

final adPostProvider = FutureProvider.autoDispose<List<PaymentItem>>((ref) async {
  return await Future.wait([
    apis.otc.qrcode().then((value) {
      final result = value.map(WalletQrcodeModel.fromJson).toList();
      final paymentItems = result
          .map(
            (item) => PaymentItem(
              min: 0,
              max: 0,
              paymentMethod: item.paymentMethod,
              account: item.account,
              remark: item.title,
              username: item.username,
            ),
          )
          .toList();
      return paymentItems as dynamic;
    }),
    apis.otc.bankcard().then((value) {
      final result = value.map(WalletBankModel.fromJson).toList();
      final paymentItems = result
          .map(
            (item) => PaymentItem(
              min: 0,
              max: 0,
              paymentMethod: PaymentMethods.bankCard,
              account: item.account,
              remark: item.title,
              username: item.username,
            ),
          )
          .toList();
      return paymentItems as dynamic;
    }),
  ]);
});

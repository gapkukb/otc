part of ad_post;

final isBuyingProvider = StateProvider<bool>((ref) {
  return false;
});

final rateProvider = StateProvider<double>((ref) {
  return 0;
});

final adPostPaymentProvider = FutureProvider<List<PaymentItem>>((ref) async {
  final otc = ref.watch(otcProvider);
  final result = await Future.wait<List<PaymentItem>>([
    apis.otc.qrcode().then((value) {
      final result = value.cast<Map<String, dynamic>>().map(WalletQrcodeModel.fromJson).toList();
      final paymentItems = result.where((element) => !element.used!).map((item) {
        final isAlipay = item.paymentMethod == PaymentMethods.alipay;

        return PaymentItem(
          outMin: (isAlipay ? otc.aliPayoutMin : otc.wechatPayoutMin).toDouble(),
          outMax: (isAlipay ? otc.aliPayoutMax : otc.wechatPayoutMax).toDouble(),
          inMin: (isAlipay ? otc.aliReceiptMin : otc.wechatReceiptMin).toDouble(),
          inMax: (isAlipay ? otc.aliReceiptMax : otc.wechatReceiptMax).toDouble(),
          paymentMethod: item.paymentMethod,
          account: item.account,
          title: item.title,
          name: item.name,
          reference: item.reference,
          username: null,
          selected: false,
        );
      }).toList();
      return paymentItems;
    }),
    apis.otc.bankcard().then((value) {
      final result = value.cast<Map<String, dynamic>>().map(WalletBankModel.fromJson).toList();
      final paymentItems = result
          .where((element) => !element.used!)
          .map(
            (item) => PaymentItem(
              outMin: otc.bankcardPayoutMax.toDouble(),
              outMax: otc.bankcardPayoutMax.toDouble(),
              inMin: otc.bankcardReceiptMin.toDouble(),
              inMax: otc.bankcardReceiptMax.toDouble(),
              paymentMethod: PaymentMethods.bankCard,
              account: item.cardNumber,
              title: item.title,
              name: item.name,
              reference: item.reference,
              username: null,
              selected: false,
            ),
          )
          .toList();
      return paymentItems;
    }),
  ]);

  return result.expand((element) => element).toList();
});

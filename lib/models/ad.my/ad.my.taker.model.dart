import 'package:freezed_annotation/freezed_annotation.dart';
part 'ad.my.taker.model.freezed.dart';
part 'ad.my.taker.model.g.dart';

@freezed
class AdMyTakerModel with _$AdMyTakerModel {
  const factory AdMyTakerModel({
    ///
    required String reference,

    ///
    required String makerReference,

    ///
    required String makerChannelReference,

    ///
    required String merchantCode,
    required String? overTime,
    required int overTimeSeconds,

    ///
    required bool sell,

    /// 	可用值:CNY,USD,USDT,BTC,TRX,BNB,ETH
    required String coin,

    ///
    required num coinAmount,

    ///
    required String makerUsername,
    required String? takerAccountName,

    ///
    required String takerUsername,

    /// 	可用值:BANK_CARD_TRANSFER,ALIPAY_TRANSFER,WECHAT_TRANSFER
    required String paymentMethod,

    /// 	可用值:PENDING,NOTIFIED,PAID,BLOCKING,CANCELED
    required String state,

    /// 	可用值:NORMAL,STAR
    required String orderLevel,

    ///
    required String makerPaymentAccount,

    ///
    required String takerPaymentAccount,

    ///
    required num moneyAmount,

    /// 	可用值:CNY,USD,USDT,BTC,TRX,BNB,ETH
    required String money,

    ///
    required num rate,

    ///
    required String? notifyAt,

    ///
    required int? notifyTimes,

    ///
    required String? confirmAt,

    ///
    required int? confirmTimes,

    ///
    required num? commission,

    ///
    required String createdTime,
  }) = _AdMyTakerModel;

  factory AdMyTakerModel.fromJson(Map<String, Object?> json) => _$AdMyTakerModelFromJson(json);
}

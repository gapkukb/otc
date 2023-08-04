import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:otc/components/payment_channel/payment_channel.dart';
part 'ad.my.channel.model.freezed.dart';
part 'ad.my.channel.model.g.dart';

@freezed
class AdMyChannleModel with _$AdMyChannleModel {
  const factory AdMyChannleModel({
    /// 	做市订单号
    required String makerDealReference,

    /// 	订单号
    required String reference,

    /// 	支付类型,可用值:BANK_CARD_TRANSFER,ALIPAY_TRANSFER,WECHAT_TRANSFER
    @JsonEnum(valueField: "value") required PaymentMethods paymentMethod,

    /// 	当时的标题
    required String title,

    /// 	最小收付
    required num amountMin,

    /// 	最大收付
    required num amountMax,

    /// 	收付渠道
    required String channelReference,

    /// 	收付标题
    required String channelTitle,

    /// 	收付账号
    required String channelAccount,

    /// 	收付户主
    required String channelName,

    /// 	启用中
    required bool enabled,

    /// 	创建时间
    required String createdTime,
  }) = _AdMyChannleModel;

  factory AdMyChannleModel.fromJson(Map<String, Object?> json) => _$AdMyChannleModelFromJson(json);
}

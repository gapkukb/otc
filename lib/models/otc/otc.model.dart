import 'package:freezed_annotation/freezed_annotation.dart';
part 'otc.model.freezed.dart';
part 'otc.model.g.dart';

@freezed
class OtcModel with _$OtcModel {
  const factory OtcModel({
    ///是否启用
    required bool enabled,

    /// kyc等级
    required int kycLevel,

    /// 银行卡最小限收
    required num bankcardReceiptMin,

    /// 银行卡最大限收
    required num bankcardReceiptMax,

    /// 银行卡每日收收
    required num bankcardReceiptDaily,

    /// 微信最小限收
    required num wechatReceiptMin,

    /// 微信最大限收
    required num wechatReceiptMax,

    /// 微信每日限收
    required num wechatReceiptDaily,

    /// 支付宝最小限收
    required num aliReceiptMin,

    /// 支付宝最大限收
    required num aliReceiptMax,

    /// 支付宝每日限收
    required num aliReceiptDaily,

    /// 银行卡最小限出
    required num bankcardPayoutMin,

    /// 银行卡最大限出
    required num bankcardPayoutMax,

    /// 微信最小限出
    required num wechatPayoutMin,

    /// 微信最大限出
    required num wechatPayoutMax,

    /// 支付宝最小限出
    required num aliPayoutMin,

    /// 支付宝最大限出
    required num aliPayoutMax,

    /// 银行卡每日限出
    required num bankcardPayoutDaily,

    /// 微信每日限出
    required num wechatPayoutDaily,

    /// 支付宝每日限出
    required num aliPayoutDaily,

    /// 最低返佣额度
    required num lowestCommission,

    ///maker单最低限额
    required num makerMin,

    ///Maker单的最高限额
    required num makerMax,
  }) = _OtcModel;

  factory OtcModel.fromJson(Map<String, Object?> json) => _$OtcModelFromJson(json);
}

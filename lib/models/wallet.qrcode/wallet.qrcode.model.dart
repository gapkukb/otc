import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:otc/components/payment_channel/payment_channel.dart';
part 'wallet.qrcode.model.freezed.dart';
part 'wallet.qrcode.model.g.dart';

@freezed
class WalletQrcodeModel with _$WalletQrcodeModel {
  const factory WalletQrcodeModel({
    /// 唯一标识
    required String reference,

    /// 标题
    required String title,

    /// 用户名
    required String username,

    /// 内容
    required String content,

    /// 二维码账号
    required String account,

    /// 银行,可用值:
    required PaymentMethods paymentMethod,

    /// 名字
    required String name,

    /// 是否默认使用
    required bool defaultUse,
    required bool? used,
    required bool? disabled,
  }) = _WalletQrcodeModel;

  factory WalletQrcodeModel.fromJson(Map<String, Object?> json) => _$WalletQrcodeModelFromJson(json);
}

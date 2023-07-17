import 'package:freezed_annotation/freezed_annotation.dart';
part 'wallet.address.model.freezed.dart';
part 'wallet.address.model.g.dart';

@freezed
class WalletAddressModel with _$WalletAddressModel {
  const factory WalletAddressModel({
    ///	唯一标识
    required String reference,

    ///	标题
    required String title,

    ///	用户名
    required String username,

    ///	内容
    required String content,

    ///	二维码账号
    required String account,

    ///	银行,可用值:BANK_CARD_TRANSFER,ALIPAY_TRANSFER,WECHAT_TRANSFER
    required String paymentMethod,

    ///	名字
    required String name,

    ///	是否默认使用
    required bool defaultUse,
  }) = _WalletAddressModel;

  factory WalletAddressModel.fromJson(Map<String, Object?> json) =>
      _$WalletAddressModelFromJson(json);
}

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'wallet.qrcode.model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_WalletQrcodeModel _$$_WalletQrcodeModelFromJson(Map<String, dynamic> json) =>
    _$_WalletQrcodeModel(
      reference: json['reference'] as String,
      title: json['title'] as String,
      username: json['username'] as String,
      content: json['content'] as String,
      account: json['account'] as String,
      paymentMethod:
          $enumDecode(_$PaymentMethodsEnumMap, json['paymentMethod']),
      name: json['name'] as String,
      defaultUse: json['defaultUse'] as bool,
    );

Map<String, dynamic> _$$_WalletQrcodeModelToJson(
        _$_WalletQrcodeModel instance) =>
    <String, dynamic>{
      'reference': instance.reference,
      'title': instance.title,
      'username': instance.username,
      'content': instance.content,
      'account': instance.account,
      'paymentMethod': _$PaymentMethodsEnumMap[instance.paymentMethod]!,
      'name': instance.name,
      'defaultUse': instance.defaultUse,
    };

const _$PaymentMethodsEnumMap = {
  PaymentMethods.bankCard: 'BANK_CARD_TRANSFER',
  PaymentMethods.wechat: 'WECHAT_TRANSFER',
  PaymentMethods.alipay: 'ALIPAY_TRANSFER',
};

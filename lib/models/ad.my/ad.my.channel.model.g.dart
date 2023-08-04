// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ad.my.channel.model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_AdMyChannleModel _$$_AdMyChannleModelFromJson(Map<String, dynamic> json) =>
    _$_AdMyChannleModel(
      makerDealReference: json['makerDealReference'] as String,
      reference: json['reference'] as String,
      paymentMethod:
          $enumDecode(_$PaymentMethodsEnumMap, json['paymentMethod']),
      title: json['title'] as String,
      amountMin: json['amountMin'] as num,
      amountMax: json['amountMax'] as num,
      channelReference: json['channelReference'] as String,
      channelTitle: json['channelTitle'] as String,
      channelAccount: json['channelAccount'] as String,
      channelName: json['channelName'] as String,
      enabled: json['enabled'] as bool,
      createdTime: json['createdTime'] as String,
    );

Map<String, dynamic> _$$_AdMyChannleModelToJson(_$_AdMyChannleModel instance) =>
    <String, dynamic>{
      'makerDealReference': instance.makerDealReference,
      'reference': instance.reference,
      'paymentMethod': _$PaymentMethodsEnumMap[instance.paymentMethod]!,
      'title': instance.title,
      'amountMin': instance.amountMin,
      'amountMax': instance.amountMax,
      'channelReference': instance.channelReference,
      'channelTitle': instance.channelTitle,
      'channelAccount': instance.channelAccount,
      'channelName': instance.channelName,
      'enabled': instance.enabled,
      'createdTime': instance.createdTime,
    };

const _$PaymentMethodsEnumMap = {
  PaymentMethods.bankCard: 'BANK_CARD_TRANSFER',
  PaymentMethods.wechat: 'WECHAT_TRANSFER',
  PaymentMethods.alipay: 'ALIPAY_TRANSFER',
};

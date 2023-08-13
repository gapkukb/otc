// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'otc.model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_OtcModel _$$_OtcModelFromJson(Map<String, dynamic> json) => _$_OtcModel(
      enabled: json['enabled'] as bool,
      kycLevel: json['kycLevel'] as int,
      bankcardReceiptMin: json['bankcardReceiptMin'] as num,
      bankcardReceiptMax: json['bankcardReceiptMax'] as num,
      bankcardReceiptDaily: json['bankcardReceiptDaily'] as num,
      wechatReceiptMin: json['wechatReceiptMin'] as num,
      wechatReceiptMax: json['wechatReceiptMax'] as num,
      wechatReceiptDaily: json['wechatReceiptDaily'] as num,
      aliReceiptMin: json['aliReceiptMin'] as num,
      aliReceiptMax: json['aliReceiptMax'] as num,
      aliReceiptDaily: json['aliReceiptDaily'] as num,
      bankcardPayoutMin: json['bankcardPayoutMin'] as num,
      bankcardPayoutMax: json['bankcardPayoutMax'] as num,
      wechatPayoutMin: json['wechatPayoutMin'] as num,
      wechatPayoutMax: json['wechatPayoutMax'] as num,
      aliPayoutMin: json['aliPayoutMin'] as num,
      aliPayoutMax: json['aliPayoutMax'] as num,
      bankcardPayoutDaily: json['bankcardPayoutDaily'] as num,
      wechatPayoutDaily: json['wechatPayoutDaily'] as num,
      aliPayoutDaily: json['aliPayoutDaily'] as num,
      lowestCommission: json['lowestCommission'] as num,
      makerMin: json['makerMin'] as num,
      makerMax: json['makerMax'] as num,
    );

Map<String, dynamic> _$$_OtcModelToJson(_$_OtcModel instance) =>
    <String, dynamic>{
      'enabled': instance.enabled,
      'kycLevel': instance.kycLevel,
      'bankcardReceiptMin': instance.bankcardReceiptMin,
      'bankcardReceiptMax': instance.bankcardReceiptMax,
      'bankcardReceiptDaily': instance.bankcardReceiptDaily,
      'wechatReceiptMin': instance.wechatReceiptMin,
      'wechatReceiptMax': instance.wechatReceiptMax,
      'wechatReceiptDaily': instance.wechatReceiptDaily,
      'aliReceiptMin': instance.aliReceiptMin,
      'aliReceiptMax': instance.aliReceiptMax,
      'aliReceiptDaily': instance.aliReceiptDaily,
      'bankcardPayoutMin': instance.bankcardPayoutMin,
      'bankcardPayoutMax': instance.bankcardPayoutMax,
      'wechatPayoutMin': instance.wechatPayoutMin,
      'wechatPayoutMax': instance.wechatPayoutMax,
      'aliPayoutMin': instance.aliPayoutMin,
      'aliPayoutMax': instance.aliPayoutMax,
      'bankcardPayoutDaily': instance.bankcardPayoutDaily,
      'wechatPayoutDaily': instance.wechatPayoutDaily,
      'aliPayoutDaily': instance.aliPayoutDaily,
      'lowestCommission': instance.lowestCommission,
      'makerMin': instance.makerMin,
      'makerMax': instance.makerMax,
    };

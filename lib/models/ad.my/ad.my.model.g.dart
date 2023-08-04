// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ad.my.model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_AdMyModel _$$_AdMyModelFromJson(Map<String, dynamic> json) => _$_AdMyModel(
      reference: json['reference'] as String,
      username: json['username'] as String,
      amount: json['amount'] as num,
      currency: json['currency'] as String,
      submitAmount: json['submitAmount'] as num,
      refRate: json['refRate'] as num,
      rate: json['rate'] as num,
      fixedRate: json['fixedRate'] as bool,
      validTime: json['validTime'] as int,
      state: json['state'] as String,
      sell: json['sell'] as bool,
      changeCurrency: json['changeCurrency'] as String,
      createdTime: json['createdTime'] as String,
      totalAmount: json['totalAmount'] as num,
      totalChangeAmount: json['totalChangeAmount'] as num,
      channels: (json['channels'] as List<dynamic>)
          .map((e) => AdMyChannleModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      akerDeals: (json['akerDeals'] as List<dynamic>)
          .map((e) => AdMyTakerModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_AdMyModelToJson(_$_AdMyModel instance) =>
    <String, dynamic>{
      'reference': instance.reference,
      'username': instance.username,
      'amount': instance.amount,
      'currency': instance.currency,
      'submitAmount': instance.submitAmount,
      'refRate': instance.refRate,
      'rate': instance.rate,
      'fixedRate': instance.fixedRate,
      'validTime': instance.validTime,
      'state': instance.state,
      'sell': instance.sell,
      'changeCurrency': instance.changeCurrency,
      'createdTime': instance.createdTime,
      'totalAmount': instance.totalAmount,
      'totalChangeAmount': instance.totalChangeAmount,
      'channels': instance.channels,
      'akerDeals': instance.akerDeals,
    };

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ad.my.taker.model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_AdMyTakerModel _$$_AdMyTakerModelFromJson(Map<String, dynamic> json) =>
    _$_AdMyTakerModel(
      reference: json['reference'] as String,
      makerReference: json['makerReference'] as String,
      makerChannelReference: json['makerChannelReference'] as String,
      merchantCode: json['merchantCode'] as String,
      sell: json['sell'] as bool,
      coin: json['coin'] as String,
      coinAmount: json['coinAmount'] as num,
      makerUsername: json['makerUsername'] as String,
      takerUsername: json['takerUsername'] as String,
      paymentMethod: json['paymentMethod'] as String,
      state: json['state'] as String,
      orderLevel: json['orderLevel'] as String,
      makerPaymentAccount: json['makerPaymentAccount'] as String,
      takerPaymentAccount: json['takerPaymentAccount'] as String,
      moneyAmount: json['moneyAmount'] as num,
      money: json['money'] as String,
      rate: json['rate'] as num,
      notifyAt: json['notifyAt'] as String,
      notifyTimes: json['notifyTimes'] as int,
      confirmAt: json['confirmAt'] as String,
      confirmTimes: json['confirmTimes'] as int,
      commission: json['commission'] as num,
      createdTime: json['createdTime'] as String,
    );

Map<String, dynamic> _$$_AdMyTakerModelToJson(_$_AdMyTakerModel instance) =>
    <String, dynamic>{
      'reference': instance.reference,
      'makerReference': instance.makerReference,
      'makerChannelReference': instance.makerChannelReference,
      'merchantCode': instance.merchantCode,
      'sell': instance.sell,
      'coin': instance.coin,
      'coinAmount': instance.coinAmount,
      'makerUsername': instance.makerUsername,
      'takerUsername': instance.takerUsername,
      'paymentMethod': instance.paymentMethod,
      'state': instance.state,
      'orderLevel': instance.orderLevel,
      'makerPaymentAccount': instance.makerPaymentAccount,
      'takerPaymentAccount': instance.takerPaymentAccount,
      'moneyAmount': instance.moneyAmount,
      'money': instance.money,
      'rate': instance.rate,
      'notifyAt': instance.notifyAt,
      'notifyTimes': instance.notifyTimes,
      'confirmAt': instance.confirmAt,
      'confirmTimes': instance.confirmTimes,
      'commission': instance.commission,
      'createdTime': instance.createdTime,
    };

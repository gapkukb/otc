// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ad.all.model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AdAllModel _$AdAllModelFromJson(Map<String, dynamic> json) => AdAllModel(
      reference: json['reference'] as String,
      username: json['username'] as String,
      nickname: json['nickname'] as String,
      avatar: json['avatar'] as String,
      amount: json['amount'] as num,
      coin: $enumDecode(_$CryptocurrencyEnumMap, json['coin']),
      money: $enumDecode(_$FiatcurrencyEnumMap, json['money']),
      submitAmount: json['submitAmount'] as num,
      refRate: json['refRate'] as num,
      currentRate: json['currentRate'] as num,
      finalRate: json['finalRate'] as num,
      floatOffset: json['floatOffset'] as num,
      fixedRate: json['fixedRate'] as bool,
      validTime: json['validTime'] as int,
      state: json['state'] as String,
      sell: json['sell'] as bool,
      makerTimes: json['makerTimes'] as int,
      makerSuccessTimes: json['makerSuccessTimes'] as int,
      methods:
          (json['methods'] as List<dynamic>).map((e) => e as String).toList(),
      createdTime: json['createdTime'] as String,
    );

Map<String, dynamic> _$AdAllModelToJson(AdAllModel instance) =>
    <String, dynamic>{
      'reference': instance.reference,
      'username': instance.username,
      'nickname': instance.nickname,
      'avatar': instance.avatar,
      'amount': instance.amount,
      'coin': _$CryptocurrencyEnumMap[instance.coin]!,
      'money': _$FiatcurrencyEnumMap[instance.money]!,
      'submitAmount': instance.submitAmount,
      'refRate': instance.refRate,
      'currentRate': instance.currentRate,
      'finalRate': instance.finalRate,
      'floatOffset': instance.floatOffset,
      'fixedRate': instance.fixedRate,
      'validTime': instance.validTime,
      'state': instance.state,
      'sell': instance.sell,
      'makerTimes': instance.makerTimes,
      'makerSuccessTimes': instance.makerSuccessTimes,
      'methods': instance.methods,
      'createdTime': instance.createdTime,
    };

const _$CryptocurrencyEnumMap = {
  Cryptocurrency.USDT: 'USDT',
  Cryptocurrency.ETH: 'ETH',
  Cryptocurrency.TRX: 'TRX',
  Cryptocurrency.BNB: 'BNB',
  Cryptocurrency.BTC: 'BTC',
  Cryptocurrency.USDC: 'USDC',
  Cryptocurrency.XRP: 'XRP',
  Cryptocurrency.ADA: 'ADA',
  Cryptocurrency.DOGE: 'DOGE',
  Cryptocurrency.SOL: 'SOL',
  Cryptocurrency.MATIC: 'MATIC',
  Cryptocurrency.LTC: 'LTC',
  Cryptocurrency.DOT: 'DOT',
  Cryptocurrency.AVAX: 'AVAX',
  Cryptocurrency.DAI: 'DAI',
};

const _$FiatcurrencyEnumMap = {
  Fiatcurrency.CNY: 'CNY',
  Fiatcurrency.USD: 'USD',
  Fiatcurrency.CAD: 'CAD',
  Fiatcurrency.GBP: 'GBP',
  Fiatcurrency.JPY: 'JPY',
  Fiatcurrency.AUD: 'AUD',
  Fiatcurrency.EUR: 'EUR',
  Fiatcurrency.PHP: 'PHP',
  Fiatcurrency.SGD: 'SGD',
  Fiatcurrency.MYR: 'MYR',
};

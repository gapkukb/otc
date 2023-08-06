// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ad.my.model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_AdMyModel _$$_AdMyModelFromJson(Map<String, dynamic> json) => _$_AdMyModel(
      reference: json['reference'] as String,
      username: json['username'] as String,
      amount: json['amount'] as num,
      coin: $enumDecode(_$CryptocurrencyEnumMap, json['coin']),
      money: $enumDecode(_$FiatcurrencyEnumMap, json['money']),
      submitAmount: json['submitAmount'] as num,
      refRate: json['refRate'] as num,
      currentRate: json['currentRate'] as num,
      methods:
          (json['methods'] as List<dynamic>).map((e) => e as String).toList(),
      finalRate: json['finalRate'] as num,
      floatOffset: json['floatOffset'] as num,
      fixedRate: json['fixedRate'] as bool,
      validTime: json['validTime'] as int,
      state: json['state'] as String,
      sell: json['sell'] as bool,
      createdTime: json['createdTime'] as String,
      totalCoinAmount: json['totalCoinAmount'] as num,
      totalMoneyAmount: json['totalMoneyAmount'] as num,
      channels: (json['channels'] as List<dynamic>)
          .map((e) => AdMyChannleModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      takerDeals: (json['takerDeals'] as List<dynamic>)
          .map((e) => AdMyTakerModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_AdMyModelToJson(_$_AdMyModel instance) =>
    <String, dynamic>{
      'reference': instance.reference,
      'username': instance.username,
      'amount': instance.amount,
      'coin': _$CryptocurrencyEnumMap[instance.coin]!,
      'money': _$FiatcurrencyEnumMap[instance.money]!,
      'submitAmount': instance.submitAmount,
      'refRate': instance.refRate,
      'currentRate': instance.currentRate,
      'methods': instance.methods,
      'finalRate': instance.finalRate,
      'floatOffset': instance.floatOffset,
      'fixedRate': instance.fixedRate,
      'validTime': instance.validTime,
      'state': instance.state,
      'sell': instance.sell,
      'createdTime': instance.createdTime,
      'totalCoinAmount': instance.totalCoinAmount,
      'totalMoneyAmount': instance.totalMoneyAmount,
      'channels': instance.channels,
      'takerDeals': instance.takerDeals,
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

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'address.model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_AddressModel _$$_AddressModelFromJson(Map<String, dynamic> json) =>
    _$_AddressModel(
      title: json['title'] as String,
      remark: json['remark'] as String,
      reference: json['reference'] as String,
      username: json['username'] as String,
      wallet: json['wallet'] as String,
      currency: $enumDecode(_$CryptocurrencyEnumMap, json['currency']),
      blockchain: $enumDecode(_$BlockchainEnumMap, json['blockchain']),
      createdTime: json['createdTime'] as String,
    );

Map<String, dynamic> _$$_AddressModelToJson(_$_AddressModel instance) =>
    <String, dynamic>{
      'title': instance.title,
      'remark': instance.remark,
      'reference': instance.reference,
      'username': instance.username,
      'wallet': instance.wallet,
      'currency': _$CryptocurrencyEnumMap[instance.currency]!,
      'blockchain': _$BlockchainEnumMap[instance.blockchain]!,
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

const _$BlockchainEnumMap = {
  Blockchain.ETH: 'ETH',
  Blockchain.BSC: 'BSC',
  Blockchain.TRON: 'TRON',
  Blockchain.BTC: 'BTC',
};

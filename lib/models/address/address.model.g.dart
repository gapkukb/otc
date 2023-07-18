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
      blockchain: $enumDecode(_$BlockChainEnumMap, json['blockchain']),
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
      'blockchain': _$BlockChainEnumMap[instance.blockchain]!,
      'createdTime': instance.createdTime,
    };

const _$CryptocurrencyEnumMap = {
  Cryptocurrency.USDT: 'USDT',
  Cryptocurrency.TRX: 'TRX',
  Cryptocurrency.BNB: 'BNB',
  Cryptocurrency.ETH: 'ETH',
};

const _$BlockChainEnumMap = {
  BlockChain.BSC: 'BSC',
  BlockChain.ETH: 'ETH',
  BlockChain.TRON: 'TRON',
};

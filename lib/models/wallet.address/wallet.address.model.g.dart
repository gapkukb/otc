// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'wallet.address.model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_WalletAddressModel _$$_WalletAddressModelFromJson(
        Map<String, dynamic> json) =>
    _$_WalletAddressModel(
      reference: json['reference'] as String,
      title: json['title'] as String,
      username: json['username'] as String,
      content: json['content'] as String,
      account: json['account'] as String,
      paymentMethod: json['paymentMethod'] as String,
      name: json['name'] as String,
      defaultUse: json['defaultUse'] as bool,
    );

Map<String, dynamic> _$$_WalletAddressModelToJson(
        _$_WalletAddressModel instance) =>
    <String, dynamic>{
      'reference': instance.reference,
      'title': instance.title,
      'username': instance.username,
      'content': instance.content,
      'account': instance.account,
      'paymentMethod': instance.paymentMethod,
      'name': instance.name,
      'defaultUse': instance.defaultUse,
    };

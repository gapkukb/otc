// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'wallet.bank.model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_WalletBankModel _$$_WalletBankModelFromJson(Map<String, dynamic> json) =>
    _$_WalletBankModel(
      reference: json['reference'] as String,
      title: json['title'] as String,
      cardNumber: json['cardNumber'] as String,
      account: json['account'] as String,
      bank: json['bank'] as String,
      bankBranch: json['bankBranch'] as String,
      defaultUsed: json['defaultUsed'] as bool,
      name: json['name'] as String,
    );

Map<String, dynamic> _$$_WalletBankModelToJson(_$_WalletBankModel instance) =>
    <String, dynamic>{
      'reference': instance.reference,
      'title': instance.title,
      'cardNumber': instance.cardNumber,
      'account': instance.account,
      'bank': instance.bank,
      'bankBranch': instance.bankBranch,
      'defaultUsed': instance.defaultUsed,
      'name': instance.name,
    };

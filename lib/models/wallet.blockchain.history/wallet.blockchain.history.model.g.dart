// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'wallet.blockchain.history.model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_WalletBlockchainHistoryModel _$$_WalletBlockchainHistoryModelFromJson(
        Map<String, dynamic> json) =>
    _$_WalletBlockchainHistoryModel(
      reference: json['reference'] as String,
      createdTime: json['createdTime'] as String,
      deposit: json['deposit'] as bool,
      currency: json['currency'] as String,
      amount: json['amount'] as num,
      fromAddress: json['fromAddress'] as String,
      toAddress: json['toAddress'] as String,
      transactionIndex: json['transactionIndex'] as num,
      transactionHash: json['transactionHash'] as String,
      confirmed: json['confirmed'] as String?,
    );

Map<String, dynamic> _$$_WalletBlockchainHistoryModelToJson(
        _$_WalletBlockchainHistoryModel instance) =>
    <String, dynamic>{
      'reference': instance.reference,
      'createdTime': instance.createdTime,
      'deposit': instance.deposit,
      'currency': instance.currency,
      'amount': instance.amount,
      'fromAddress': instance.fromAddress,
      'toAddress': instance.toAddress,
      'transactionIndex': instance.transactionIndex,
      'transactionHash': instance.transactionHash,
      'confirmed': instance.confirmed,
    };

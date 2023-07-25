// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'wallet.transfer.history.model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_WalletTransferHistoryModel _$$_WalletTransferHistoryModelFromJson(
        Map<String, dynamic> json) =>
    _$_WalletTransferHistoryModel(
      id: json['id'] as num,
      reference: json['reference'] as String,
      incomne: json['in'] as bool,
      fromUsername: json['fromUsername'] as String,
      toUsername: json['toUsername'] as String,
      fromBalanceBefore: json['fromBalanceBefore'] as num,
      fromBalanceAfter: json['fromBalanceAfter'] as num,
      toBalanceBefore: json['toBalanceBefore'] as num,
      toBalanceAfter: json['toBalanceAfter'] as num,
      currency: json['currency'] as String,
      amount: json['amount'] as num,
      createdTime: json['createdTime'] as String,
    );

Map<String, dynamic> _$$_WalletTransferHistoryModelToJson(
        _$_WalletTransferHistoryModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'reference': instance.reference,
      'in': instance.incomne,
      'fromUsername': instance.fromUsername,
      'toUsername': instance.toUsername,
      'fromBalanceBefore': instance.fromBalanceBefore,
      'fromBalanceAfter': instance.fromBalanceAfter,
      'toBalanceBefore': instance.toBalanceBefore,
      'toBalanceAfter': instance.toBalanceAfter,
      'currency': instance.currency,
      'amount': instance.amount,
      'createdTime': instance.createdTime,
    };

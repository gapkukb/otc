// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'kyc.model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_KycModel _$$_KycModelFromJson(Map<String, dynamic> json) => _$_KycModel(
      username: json['username'] as String,
      reference: json['reference'] as String,
      identity: json['identity'] as String,
      status: json['status'] as String,
      used: json['used'] as bool,
    );

Map<String, dynamic> _$$_KycModelToJson(_$_KycModel instance) =>
    <String, dynamic>{
      'username': instance.username,
      'reference': instance.reference,
      'identity': instance.identity,
      'status': instance.status,
      'used': instance.used,
    };

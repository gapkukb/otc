// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'kyc.model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_KycModel _$$_KycModelFromJson(Map<String, dynamic> json) => _$_KycModel(
      username: json['username'] as String,
      reference: json['reference'] as String,
      identity: json['identity'] as String,
      name: json['name'] as String,
      age: json['age'] as int,
      used: json['used'] as bool,
      idFrontPicture: json['idFrontPicture'] as String,
      idBackPicture: json['idBackPicture'] as String,
      idHoldPicture: json['idHoldPicture'] as String,
      idHoldVideo: json['idHoldVideo'] as String,
      lv1Status: $enumDecode(_$KycStatusEnumMap, json['lv1Status']),
      lv2Status: $enumDecode(_$KycStatusEnumMap, json['lv2Status']),
      lv3Status: $enumDecode(_$KycStatusEnumMap, json['lv3Status']),
    );

Map<String, dynamic> _$$_KycModelToJson(_$_KycModel instance) =>
    <String, dynamic>{
      'username': instance.username,
      'reference': instance.reference,
      'identity': instance.identity,
      'name': instance.name,
      'age': instance.age,
      'used': instance.used,
      'idFrontPicture': instance.idFrontPicture,
      'idBackPicture': instance.idBackPicture,
      'idHoldPicture': instance.idHoldPicture,
      'idHoldVideo': instance.idHoldVideo,
      'lv1Status': _$KycStatusEnumMap[instance.lv1Status]!,
      'lv2Status': _$KycStatusEnumMap[instance.lv2Status]!,
      'lv3Status': _$KycStatusEnumMap[instance.lv3Status]!,
    };

const _$KycStatusEnumMap = {
  KycStatus.pending: 'pending',
  KycStatus.pass: 'pass',
  KycStatus.reject: 'reject',
};

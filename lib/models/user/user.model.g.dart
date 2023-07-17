// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_UserModel _$$_UserModelFromJson(Map<String, dynamic> json) => _$_UserModel(
      base: UserBaseModel.fromJson(json['customer'] as Map<String, dynamic>),
      stats: UserStatsModel.fromJson(json['data'] as Map<String, dynamic>),
      kyc: json['kyc'] == null
          ? null
          : KycModel.fromJson(json['kyc'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_UserModelToJson(_$_UserModel instance) =>
    <String, dynamic>{
      'customer': instance.base,
      'data': instance.stats,
      'kyc': instance.kyc,
    };

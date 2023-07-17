// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_stats.model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_UserStatsModel _$$_UserStatsModelFromJson(Map<String, dynamic> json) =>
    _$_UserStatsModel(
      username: json['username'] as String,
      makerTimes: json['makerTimes'] as String,
      takerTimes: json['takerTimes'] as String,
      makerSuccessTotal: json['makerSuccessTotal'] as String,
      takerSuccessTotal: json['takerSuccessTotal'] as String,
      commissionTotal: json['commissionTotal'] as num,
      makerCommissionTotal: json['makerCommissionTotal'] as num,
      loginTimes: json['loginTimes'] as String,
      loginSuccessTimes: json['loginSuccessTimes'] as String,
      lastLoggedTime: json['lastLoggedTime'] as String,
      lastLoggedIp: json['lastLoggedIp'] as String,
    );

Map<String, dynamic> _$$_UserStatsModelToJson(_$_UserStatsModel instance) =>
    <String, dynamic>{
      'username': instance.username,
      'makerTimes': instance.makerTimes,
      'takerTimes': instance.takerTimes,
      'makerSuccessTotal': instance.makerSuccessTotal,
      'takerSuccessTotal': instance.takerSuccessTotal,
      'commissionTotal': instance.commissionTotal,
      'makerCommissionTotal': instance.makerCommissionTotal,
      'loginTimes': instance.loginTimes,
      'loginSuccessTimes': instance.loginSuccessTimes,
      'lastLoggedTime': instance.lastLoggedTime,
      'lastLoggedIp': instance.lastLoggedIp,
    };

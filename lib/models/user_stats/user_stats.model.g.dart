// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_stats.model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_UserStatsModel _$$_UserStatsModelFromJson(Map<String, dynamic> json) =>
    _$_UserStatsModel(
      username: json['username'] as String,
      makerTimes: json['makerTimes'] as int,
      takerTimes: json['takerTimes'] as int,
      makerSuccessTotal: json['makerSuccessTotal'] as int,
      takerSuccessTotal: json['takerSuccessTotal'] as int,
      commissionTotal: json['commissionTotal'] as num,
      makerCommissionTotal: json['makerCommissionTotal'] as num,
      loginTimes: json['loginTimes'] as int,
      loginSuccessTimes: json['loginSuccessTimes'] as int,
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

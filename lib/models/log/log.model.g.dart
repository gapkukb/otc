// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'log.model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_LogModel _$$_LogModelFromJson(Map<String, dynamic> json) => _$_LogModel(
      username: json['username'] as String,
      ip: json['ip'] as String,
      logged: json['logged'] as bool,
      device: json['device'] as String,
      referer: json['referer'] as String,
      type: json['type'] as String,
      createdTime: json['createdTime'] as String,
    );

Map<String, dynamic> _$$_LogModelToJson(_$_LogModel instance) =>
    <String, dynamic>{
      'username': instance.username,
      'ip': instance.ip,
      'logged': instance.logged,
      'device': instance.device,
      'referer': instance.referer,
      'type': instance.type,
      'createdTime': instance.createdTime,
    };

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_UserModel _$$_UserModelFromJson(Map<String, dynamic> json) => _$_UserModel(
      id: json['id'] as String,
      username: json['username'] as String,
      email: json['email'] as String?,
      phone: json['phone'] as String?,
      regIp: json['regIp'] as String,
      regServerName: json['regServerName'] as String,
      regReferer: json['regReferer'] as String,
      regDevice: json['regDevice'] as String,
      emailValid: json['emailValid'] as bool,
      idValid: json['idValid'] as bool,
      phoneValid: json['phoneValid'] as bool,
      nickname: json['nickname'] as String,
      avatar: json['avatar'] as String,
      disabled: json['disabled'] as bool,
      type: json['type'] as String,
      invitationCode: json['invitationCode'] as String,
      lockedUntil: json['lockedUntil'] as String?,
      locked: json['locked'] as bool,
      createdTime: json['createdTime'] as String,
      maker: json['maker'] as bool?,
    );

Map<String, dynamic> _$$_UserModelToJson(_$_UserModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'username': instance.username,
      'email': instance.email,
      'phone': instance.phone,
      'regIp': instance.regIp,
      'regServerName': instance.regServerName,
      'regReferer': instance.regReferer,
      'regDevice': instance.regDevice,
      'emailValid': instance.emailValid,
      'idValid': instance.idValid,
      'phoneValid': instance.phoneValid,
      'nickname': instance.nickname,
      'avatar': instance.avatar,
      'disabled': instance.disabled,
      'type': instance.type,
      'invitationCode': instance.invitationCode,
      'lockedUntil': instance.lockedUntil,
      'locked': instance.locked,
      'createdTime': instance.createdTime,
      'maker': instance.maker,
    };

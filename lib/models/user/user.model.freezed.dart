// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user.model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

UserModel _$UserModelFromJson(Map<String, dynamic> json) {
  return _UserModel.fromJson(json);
}

/// @nodoc
mixin _$UserModel {
  int get id => throw _privateConstructorUsedError;
  String get username => throw _privateConstructorUsedError;
  String? get email => throw _privateConstructorUsedError;
  String? get phone => throw _privateConstructorUsedError;
  String get regIp => throw _privateConstructorUsedError;
  String get regServerName => throw _privateConstructorUsedError;
  String get regReferer => throw _privateConstructorUsedError;
  String get regDevice => throw _privateConstructorUsedError;
  bool get emailValid => throw _privateConstructorUsedError;
  bool get idValid => throw _privateConstructorUsedError;
  bool get phoneValid => throw _privateConstructorUsedError;
  String get nickname => throw _privateConstructorUsedError;
  String get avatar => throw _privateConstructorUsedError;
  bool get disabled => throw _privateConstructorUsedError;
  String get type => throw _privateConstructorUsedError;
  String get invitationCode => throw _privateConstructorUsedError;
  String? get lockedUntil => throw _privateConstructorUsedError;
  bool get locked => throw _privateConstructorUsedError;
  String get createdTime => throw _privateConstructorUsedError;
  bool get maker => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserModelCopyWith<UserModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserModelCopyWith<$Res> {
  factory $UserModelCopyWith(UserModel value, $Res Function(UserModel) then) =
      _$UserModelCopyWithImpl<$Res, UserModel>;
  @useResult
  $Res call(
      {int id,
      String username,
      String? email,
      String? phone,
      String regIp,
      String regServerName,
      String regReferer,
      String regDevice,
      bool emailValid,
      bool idValid,
      bool phoneValid,
      String nickname,
      String avatar,
      bool disabled,
      String type,
      String invitationCode,
      String? lockedUntil,
      bool locked,
      String createdTime,
      bool maker});
}

/// @nodoc
class _$UserModelCopyWithImpl<$Res, $Val extends UserModel>
    implements $UserModelCopyWith<$Res> {
  _$UserModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? username = null,
    Object? email = freezed,
    Object? phone = freezed,
    Object? regIp = null,
    Object? regServerName = null,
    Object? regReferer = null,
    Object? regDevice = null,
    Object? emailValid = null,
    Object? idValid = null,
    Object? phoneValid = null,
    Object? nickname = null,
    Object? avatar = null,
    Object? disabled = null,
    Object? type = null,
    Object? invitationCode = null,
    Object? lockedUntil = freezed,
    Object? locked = null,
    Object? createdTime = null,
    Object? maker = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      username: null == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      phone: freezed == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String?,
      regIp: null == regIp
          ? _value.regIp
          : regIp // ignore: cast_nullable_to_non_nullable
              as String,
      regServerName: null == regServerName
          ? _value.regServerName
          : regServerName // ignore: cast_nullable_to_non_nullable
              as String,
      regReferer: null == regReferer
          ? _value.regReferer
          : regReferer // ignore: cast_nullable_to_non_nullable
              as String,
      regDevice: null == regDevice
          ? _value.regDevice
          : regDevice // ignore: cast_nullable_to_non_nullable
              as String,
      emailValid: null == emailValid
          ? _value.emailValid
          : emailValid // ignore: cast_nullable_to_non_nullable
              as bool,
      idValid: null == idValid
          ? _value.idValid
          : idValid // ignore: cast_nullable_to_non_nullable
              as bool,
      phoneValid: null == phoneValid
          ? _value.phoneValid
          : phoneValid // ignore: cast_nullable_to_non_nullable
              as bool,
      nickname: null == nickname
          ? _value.nickname
          : nickname // ignore: cast_nullable_to_non_nullable
              as String,
      avatar: null == avatar
          ? _value.avatar
          : avatar // ignore: cast_nullable_to_non_nullable
              as String,
      disabled: null == disabled
          ? _value.disabled
          : disabled // ignore: cast_nullable_to_non_nullable
              as bool,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      invitationCode: null == invitationCode
          ? _value.invitationCode
          : invitationCode // ignore: cast_nullable_to_non_nullable
              as String,
      lockedUntil: freezed == lockedUntil
          ? _value.lockedUntil
          : lockedUntil // ignore: cast_nullable_to_non_nullable
              as String?,
      locked: null == locked
          ? _value.locked
          : locked // ignore: cast_nullable_to_non_nullable
              as bool,
      createdTime: null == createdTime
          ? _value.createdTime
          : createdTime // ignore: cast_nullable_to_non_nullable
              as String,
      maker: null == maker
          ? _value.maker
          : maker // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_UserModelCopyWith<$Res> implements $UserModelCopyWith<$Res> {
  factory _$$_UserModelCopyWith(
          _$_UserModel value, $Res Function(_$_UserModel) then) =
      __$$_UserModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      String username,
      String? email,
      String? phone,
      String regIp,
      String regServerName,
      String regReferer,
      String regDevice,
      bool emailValid,
      bool idValid,
      bool phoneValid,
      String nickname,
      String avatar,
      bool disabled,
      String type,
      String invitationCode,
      String? lockedUntil,
      bool locked,
      String createdTime,
      bool maker});
}

/// @nodoc
class __$$_UserModelCopyWithImpl<$Res>
    extends _$UserModelCopyWithImpl<$Res, _$_UserModel>
    implements _$$_UserModelCopyWith<$Res> {
  __$$_UserModelCopyWithImpl(
      _$_UserModel _value, $Res Function(_$_UserModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? username = null,
    Object? email = freezed,
    Object? phone = freezed,
    Object? regIp = null,
    Object? regServerName = null,
    Object? regReferer = null,
    Object? regDevice = null,
    Object? emailValid = null,
    Object? idValid = null,
    Object? phoneValid = null,
    Object? nickname = null,
    Object? avatar = null,
    Object? disabled = null,
    Object? type = null,
    Object? invitationCode = null,
    Object? lockedUntil = freezed,
    Object? locked = null,
    Object? createdTime = null,
    Object? maker = null,
  }) {
    return _then(_$_UserModel(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      username: null == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      phone: freezed == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String?,
      regIp: null == regIp
          ? _value.regIp
          : regIp // ignore: cast_nullable_to_non_nullable
              as String,
      regServerName: null == regServerName
          ? _value.regServerName
          : regServerName // ignore: cast_nullable_to_non_nullable
              as String,
      regReferer: null == regReferer
          ? _value.regReferer
          : regReferer // ignore: cast_nullable_to_non_nullable
              as String,
      regDevice: null == regDevice
          ? _value.regDevice
          : regDevice // ignore: cast_nullable_to_non_nullable
              as String,
      emailValid: null == emailValid
          ? _value.emailValid
          : emailValid // ignore: cast_nullable_to_non_nullable
              as bool,
      idValid: null == idValid
          ? _value.idValid
          : idValid // ignore: cast_nullable_to_non_nullable
              as bool,
      phoneValid: null == phoneValid
          ? _value.phoneValid
          : phoneValid // ignore: cast_nullable_to_non_nullable
              as bool,
      nickname: null == nickname
          ? _value.nickname
          : nickname // ignore: cast_nullable_to_non_nullable
              as String,
      avatar: null == avatar
          ? _value.avatar
          : avatar // ignore: cast_nullable_to_non_nullable
              as String,
      disabled: null == disabled
          ? _value.disabled
          : disabled // ignore: cast_nullable_to_non_nullable
              as bool,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      invitationCode: null == invitationCode
          ? _value.invitationCode
          : invitationCode // ignore: cast_nullable_to_non_nullable
              as String,
      lockedUntil: freezed == lockedUntil
          ? _value.lockedUntil
          : lockedUntil // ignore: cast_nullable_to_non_nullable
              as String?,
      locked: null == locked
          ? _value.locked
          : locked // ignore: cast_nullable_to_non_nullable
              as bool,
      createdTime: null == createdTime
          ? _value.createdTime
          : createdTime // ignore: cast_nullable_to_non_nullable
              as String,
      maker: null == maker
          ? _value.maker
          : maker // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_UserModel implements _UserModel {
  const _$_UserModel(
      {required this.id,
      required this.username,
      required this.email,
      required this.phone,
      required this.regIp,
      required this.regServerName,
      required this.regReferer,
      required this.regDevice,
      required this.emailValid,
      required this.idValid,
      required this.phoneValid,
      required this.nickname,
      required this.avatar,
      required this.disabled,
      required this.type,
      required this.invitationCode,
      required this.lockedUntil,
      required this.locked,
      required this.createdTime,
      required this.maker});

  factory _$_UserModel.fromJson(Map<String, dynamic> json) =>
      _$$_UserModelFromJson(json);

  @override
  final int id;
  @override
  final String username;
  @override
  final String? email;
  @override
  final String? phone;
  @override
  final String regIp;
  @override
  final String regServerName;
  @override
  final String regReferer;
  @override
  final String regDevice;
  @override
  final bool emailValid;
  @override
  final bool idValid;
  @override
  final bool phoneValid;
  @override
  final String nickname;
  @override
  final String avatar;
  @override
  final bool disabled;
  @override
  final String type;
  @override
  final String invitationCode;
  @override
  final String? lockedUntil;
  @override
  final bool locked;
  @override
  final String createdTime;
  @override
  final bool maker;

  @override
  String toString() {
    return 'UserModel(id: $id, username: $username, email: $email, phone: $phone, regIp: $regIp, regServerName: $regServerName, regReferer: $regReferer, regDevice: $regDevice, emailValid: $emailValid, idValid: $idValid, phoneValid: $phoneValid, nickname: $nickname, avatar: $avatar, disabled: $disabled, type: $type, invitationCode: $invitationCode, lockedUntil: $lockedUntil, locked: $locked, createdTime: $createdTime, maker: $maker)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_UserModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.username, username) ||
                other.username == username) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.phone, phone) || other.phone == phone) &&
            (identical(other.regIp, regIp) || other.regIp == regIp) &&
            (identical(other.regServerName, regServerName) ||
                other.regServerName == regServerName) &&
            (identical(other.regReferer, regReferer) ||
                other.regReferer == regReferer) &&
            (identical(other.regDevice, regDevice) ||
                other.regDevice == regDevice) &&
            (identical(other.emailValid, emailValid) ||
                other.emailValid == emailValid) &&
            (identical(other.idValid, idValid) || other.idValid == idValid) &&
            (identical(other.phoneValid, phoneValid) ||
                other.phoneValid == phoneValid) &&
            (identical(other.nickname, nickname) ||
                other.nickname == nickname) &&
            (identical(other.avatar, avatar) || other.avatar == avatar) &&
            (identical(other.disabled, disabled) ||
                other.disabled == disabled) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.invitationCode, invitationCode) ||
                other.invitationCode == invitationCode) &&
            (identical(other.lockedUntil, lockedUntil) ||
                other.lockedUntil == lockedUntil) &&
            (identical(other.locked, locked) || other.locked == locked) &&
            (identical(other.createdTime, createdTime) ||
                other.createdTime == createdTime) &&
            (identical(other.maker, maker) || other.maker == maker));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        id,
        username,
        email,
        phone,
        regIp,
        regServerName,
        regReferer,
        regDevice,
        emailValid,
        idValid,
        phoneValid,
        nickname,
        avatar,
        disabled,
        type,
        invitationCode,
        lockedUntil,
        locked,
        createdTime,
        maker
      ]);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_UserModelCopyWith<_$_UserModel> get copyWith =>
      __$$_UserModelCopyWithImpl<_$_UserModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_UserModelToJson(
      this,
    );
  }
}

abstract class _UserModel implements UserModel {
  const factory _UserModel(
      {required final int id,
      required final String username,
      required final String? email,
      required final String? phone,
      required final String regIp,
      required final String regServerName,
      required final String regReferer,
      required final String regDevice,
      required final bool emailValid,
      required final bool idValid,
      required final bool phoneValid,
      required final String nickname,
      required final String avatar,
      required final bool disabled,
      required final String type,
      required final String invitationCode,
      required final String? lockedUntil,
      required final bool locked,
      required final String createdTime,
      required final bool maker}) = _$_UserModel;

  factory _UserModel.fromJson(Map<String, dynamic> json) =
      _$_UserModel.fromJson;

  @override
  int get id;
  @override
  String get username;
  @override
  String? get email;
  @override
  String? get phone;
  @override
  String get regIp;
  @override
  String get regServerName;
  @override
  String get regReferer;
  @override
  String get regDevice;
  @override
  bool get emailValid;
  @override
  bool get idValid;
  @override
  bool get phoneValid;
  @override
  String get nickname;
  @override
  String get avatar;
  @override
  bool get disabled;
  @override
  String get type;
  @override
  String get invitationCode;
  @override
  String? get lockedUntil;
  @override
  bool get locked;
  @override
  String get createdTime;
  @override
  bool get maker;
  @override
  @JsonKey(ignore: true)
  _$$_UserModelCopyWith<_$_UserModel> get copyWith =>
      throw _privateConstructorUsedError;
}

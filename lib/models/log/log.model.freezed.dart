// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'log.model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

LogModel _$LogModelFromJson(Map<String, dynamic> json) {
  return _LogModel.fromJson(json);
}

/// @nodoc
mixin _$LogModel {
  String get username => throw _privateConstructorUsedError;
  String get ip => throw _privateConstructorUsedError;
  bool get logged => throw _privateConstructorUsedError;
  String get device => throw _privateConstructorUsedError;
  String get referer => throw _privateConstructorUsedError;
  String get type => throw _privateConstructorUsedError;
  String get createdTime => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $LogModelCopyWith<LogModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LogModelCopyWith<$Res> {
  factory $LogModelCopyWith(LogModel value, $Res Function(LogModel) then) =
      _$LogModelCopyWithImpl<$Res, LogModel>;
  @useResult
  $Res call(
      {String username,
      String ip,
      bool logged,
      String device,
      String referer,
      String type,
      String createdTime});
}

/// @nodoc
class _$LogModelCopyWithImpl<$Res, $Val extends LogModel>
    implements $LogModelCopyWith<$Res> {
  _$LogModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? username = null,
    Object? ip = null,
    Object? logged = null,
    Object? device = null,
    Object? referer = null,
    Object? type = null,
    Object? createdTime = null,
  }) {
    return _then(_value.copyWith(
      username: null == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String,
      ip: null == ip
          ? _value.ip
          : ip // ignore: cast_nullable_to_non_nullable
              as String,
      logged: null == logged
          ? _value.logged
          : logged // ignore: cast_nullable_to_non_nullable
              as bool,
      device: null == device
          ? _value.device
          : device // ignore: cast_nullable_to_non_nullable
              as String,
      referer: null == referer
          ? _value.referer
          : referer // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      createdTime: null == createdTime
          ? _value.createdTime
          : createdTime // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_LogModelCopyWith<$Res> implements $LogModelCopyWith<$Res> {
  factory _$$_LogModelCopyWith(
          _$_LogModel value, $Res Function(_$_LogModel) then) =
      __$$_LogModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String username,
      String ip,
      bool logged,
      String device,
      String referer,
      String type,
      String createdTime});
}

/// @nodoc
class __$$_LogModelCopyWithImpl<$Res>
    extends _$LogModelCopyWithImpl<$Res, _$_LogModel>
    implements _$$_LogModelCopyWith<$Res> {
  __$$_LogModelCopyWithImpl(
      _$_LogModel _value, $Res Function(_$_LogModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? username = null,
    Object? ip = null,
    Object? logged = null,
    Object? device = null,
    Object? referer = null,
    Object? type = null,
    Object? createdTime = null,
  }) {
    return _then(_$_LogModel(
      username: null == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String,
      ip: null == ip
          ? _value.ip
          : ip // ignore: cast_nullable_to_non_nullable
              as String,
      logged: null == logged
          ? _value.logged
          : logged // ignore: cast_nullable_to_non_nullable
              as bool,
      device: null == device
          ? _value.device
          : device // ignore: cast_nullable_to_non_nullable
              as String,
      referer: null == referer
          ? _value.referer
          : referer // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      createdTime: null == createdTime
          ? _value.createdTime
          : createdTime // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_LogModel implements _LogModel {
  const _$_LogModel(
      {required this.username,
      required this.ip,
      required this.logged,
      required this.device,
      required this.referer,
      required this.type,
      required this.createdTime});

  factory _$_LogModel.fromJson(Map<String, dynamic> json) =>
      _$$_LogModelFromJson(json);

  @override
  final String username;
  @override
  final String ip;
  @override
  final bool logged;
  @override
  final String device;
  @override
  final String referer;
  @override
  final String type;
  @override
  final String createdTime;

  @override
  String toString() {
    return 'LogModel(username: $username, ip: $ip, logged: $logged, device: $device, referer: $referer, type: $type, createdTime: $createdTime)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_LogModel &&
            (identical(other.username, username) ||
                other.username == username) &&
            (identical(other.ip, ip) || other.ip == ip) &&
            (identical(other.logged, logged) || other.logged == logged) &&
            (identical(other.device, device) || other.device == device) &&
            (identical(other.referer, referer) || other.referer == referer) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.createdTime, createdTime) ||
                other.createdTime == createdTime));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, username, ip, logged, device, referer, type, createdTime);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_LogModelCopyWith<_$_LogModel> get copyWith =>
      __$$_LogModelCopyWithImpl<_$_LogModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_LogModelToJson(
      this,
    );
  }
}

abstract class _LogModel implements LogModel {
  const factory _LogModel(
      {required final String username,
      required final String ip,
      required final bool logged,
      required final String device,
      required final String referer,
      required final String type,
      required final String createdTime}) = _$_LogModel;

  factory _LogModel.fromJson(Map<String, dynamic> json) = _$_LogModel.fromJson;

  @override
  String get username;
  @override
  String get ip;
  @override
  bool get logged;
  @override
  String get device;
  @override
  String get referer;
  @override
  String get type;
  @override
  String get createdTime;
  @override
  @JsonKey(ignore: true)
  _$$_LogModelCopyWith<_$_LogModel> get copyWith =>
      throw _privateConstructorUsedError;
}

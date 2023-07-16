// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_stats.model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

UserStatsModel _$UserStatsModelFromJson(Map<String, dynamic> json) {
  return _UserStatsModel.fromJson(json);
}

/// @nodoc
mixin _$UserStatsModel {
  ///	用户名
  String get username => throw _privateConstructorUsedError;

  ///	Maker总次数
  int get makerTimes => throw _privateConstructorUsedError;

  ///	Taker总次数
  int get takerTimes => throw _privateConstructorUsedError;

  ///	Maker成单总次数
  int get makerSuccessTotal => throw _privateConstructorUsedError;

  ///	Taker成单总次数
  int get takerSuccessTotal => throw _privateConstructorUsedError;

  ///	总佣金
  num get commissionTotal => throw _privateConstructorUsedError;

  ///	Maker总佣金
  num get makerCommissionTotal => throw _privateConstructorUsedError;

  ///	登录次数
  int get loginTimes => throw _privateConstructorUsedError;

  ///	成功登录次数
  int get loginSuccessTimes => throw _privateConstructorUsedError;

  ///	最后登录时间
  String get lastLoggedTime => throw _privateConstructorUsedError;

  ///	最后登录IP
  String get lastLoggedIp => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserStatsModelCopyWith<UserStatsModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserStatsModelCopyWith<$Res> {
  factory $UserStatsModelCopyWith(
          UserStatsModel value, $Res Function(UserStatsModel) then) =
      _$UserStatsModelCopyWithImpl<$Res, UserStatsModel>;
  @useResult
  $Res call(
      {String username,
      int makerTimes,
      int takerTimes,
      int makerSuccessTotal,
      int takerSuccessTotal,
      num commissionTotal,
      num makerCommissionTotal,
      int loginTimes,
      int loginSuccessTimes,
      String lastLoggedTime,
      String lastLoggedIp});
}

/// @nodoc
class _$UserStatsModelCopyWithImpl<$Res, $Val extends UserStatsModel>
    implements $UserStatsModelCopyWith<$Res> {
  _$UserStatsModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? username = null,
    Object? makerTimes = null,
    Object? takerTimes = null,
    Object? makerSuccessTotal = null,
    Object? takerSuccessTotal = null,
    Object? commissionTotal = null,
    Object? makerCommissionTotal = null,
    Object? loginTimes = null,
    Object? loginSuccessTimes = null,
    Object? lastLoggedTime = null,
    Object? lastLoggedIp = null,
  }) {
    return _then(_value.copyWith(
      username: null == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String,
      makerTimes: null == makerTimes
          ? _value.makerTimes
          : makerTimes // ignore: cast_nullable_to_non_nullable
              as int,
      takerTimes: null == takerTimes
          ? _value.takerTimes
          : takerTimes // ignore: cast_nullable_to_non_nullable
              as int,
      makerSuccessTotal: null == makerSuccessTotal
          ? _value.makerSuccessTotal
          : makerSuccessTotal // ignore: cast_nullable_to_non_nullable
              as int,
      takerSuccessTotal: null == takerSuccessTotal
          ? _value.takerSuccessTotal
          : takerSuccessTotal // ignore: cast_nullable_to_non_nullable
              as int,
      commissionTotal: null == commissionTotal
          ? _value.commissionTotal
          : commissionTotal // ignore: cast_nullable_to_non_nullable
              as num,
      makerCommissionTotal: null == makerCommissionTotal
          ? _value.makerCommissionTotal
          : makerCommissionTotal // ignore: cast_nullable_to_non_nullable
              as num,
      loginTimes: null == loginTimes
          ? _value.loginTimes
          : loginTimes // ignore: cast_nullable_to_non_nullable
              as int,
      loginSuccessTimes: null == loginSuccessTimes
          ? _value.loginSuccessTimes
          : loginSuccessTimes // ignore: cast_nullable_to_non_nullable
              as int,
      lastLoggedTime: null == lastLoggedTime
          ? _value.lastLoggedTime
          : lastLoggedTime // ignore: cast_nullable_to_non_nullable
              as String,
      lastLoggedIp: null == lastLoggedIp
          ? _value.lastLoggedIp
          : lastLoggedIp // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_UserStatsModelCopyWith<$Res>
    implements $UserStatsModelCopyWith<$Res> {
  factory _$$_UserStatsModelCopyWith(
          _$_UserStatsModel value, $Res Function(_$_UserStatsModel) then) =
      __$$_UserStatsModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String username,
      int makerTimes,
      int takerTimes,
      int makerSuccessTotal,
      int takerSuccessTotal,
      num commissionTotal,
      num makerCommissionTotal,
      int loginTimes,
      int loginSuccessTimes,
      String lastLoggedTime,
      String lastLoggedIp});
}

/// @nodoc
class __$$_UserStatsModelCopyWithImpl<$Res>
    extends _$UserStatsModelCopyWithImpl<$Res, _$_UserStatsModel>
    implements _$$_UserStatsModelCopyWith<$Res> {
  __$$_UserStatsModelCopyWithImpl(
      _$_UserStatsModel _value, $Res Function(_$_UserStatsModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? username = null,
    Object? makerTimes = null,
    Object? takerTimes = null,
    Object? makerSuccessTotal = null,
    Object? takerSuccessTotal = null,
    Object? commissionTotal = null,
    Object? makerCommissionTotal = null,
    Object? loginTimes = null,
    Object? loginSuccessTimes = null,
    Object? lastLoggedTime = null,
    Object? lastLoggedIp = null,
  }) {
    return _then(_$_UserStatsModel(
      username: null == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String,
      makerTimes: null == makerTimes
          ? _value.makerTimes
          : makerTimes // ignore: cast_nullable_to_non_nullable
              as int,
      takerTimes: null == takerTimes
          ? _value.takerTimes
          : takerTimes // ignore: cast_nullable_to_non_nullable
              as int,
      makerSuccessTotal: null == makerSuccessTotal
          ? _value.makerSuccessTotal
          : makerSuccessTotal // ignore: cast_nullable_to_non_nullable
              as int,
      takerSuccessTotal: null == takerSuccessTotal
          ? _value.takerSuccessTotal
          : takerSuccessTotal // ignore: cast_nullable_to_non_nullable
              as int,
      commissionTotal: null == commissionTotal
          ? _value.commissionTotal
          : commissionTotal // ignore: cast_nullable_to_non_nullable
              as num,
      makerCommissionTotal: null == makerCommissionTotal
          ? _value.makerCommissionTotal
          : makerCommissionTotal // ignore: cast_nullable_to_non_nullable
              as num,
      loginTimes: null == loginTimes
          ? _value.loginTimes
          : loginTimes // ignore: cast_nullable_to_non_nullable
              as int,
      loginSuccessTimes: null == loginSuccessTimes
          ? _value.loginSuccessTimes
          : loginSuccessTimes // ignore: cast_nullable_to_non_nullable
              as int,
      lastLoggedTime: null == lastLoggedTime
          ? _value.lastLoggedTime
          : lastLoggedTime // ignore: cast_nullable_to_non_nullable
              as String,
      lastLoggedIp: null == lastLoggedIp
          ? _value.lastLoggedIp
          : lastLoggedIp // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_UserStatsModel implements _UserStatsModel {
  const _$_UserStatsModel(
      {required this.username,
      required this.makerTimes,
      required this.takerTimes,
      required this.makerSuccessTotal,
      required this.takerSuccessTotal,
      required this.commissionTotal,
      required this.makerCommissionTotal,
      required this.loginTimes,
      required this.loginSuccessTimes,
      required this.lastLoggedTime,
      required this.lastLoggedIp});

  factory _$_UserStatsModel.fromJson(Map<String, dynamic> json) =>
      _$$_UserStatsModelFromJson(json);

  ///	用户名
  @override
  final String username;

  ///	Maker总次数
  @override
  final int makerTimes;

  ///	Taker总次数
  @override
  final int takerTimes;

  ///	Maker成单总次数
  @override
  final int makerSuccessTotal;

  ///	Taker成单总次数
  @override
  final int takerSuccessTotal;

  ///	总佣金
  @override
  final num commissionTotal;

  ///	Maker总佣金
  @override
  final num makerCommissionTotal;

  ///	登录次数
  @override
  final int loginTimes;

  ///	成功登录次数
  @override
  final int loginSuccessTimes;

  ///	最后登录时间
  @override
  final String lastLoggedTime;

  ///	最后登录IP
  @override
  final String lastLoggedIp;

  @override
  String toString() {
    return 'UserStatsModel(username: $username, makerTimes: $makerTimes, takerTimes: $takerTimes, makerSuccessTotal: $makerSuccessTotal, takerSuccessTotal: $takerSuccessTotal, commissionTotal: $commissionTotal, makerCommissionTotal: $makerCommissionTotal, loginTimes: $loginTimes, loginSuccessTimes: $loginSuccessTimes, lastLoggedTime: $lastLoggedTime, lastLoggedIp: $lastLoggedIp)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_UserStatsModel &&
            (identical(other.username, username) ||
                other.username == username) &&
            (identical(other.makerTimes, makerTimes) ||
                other.makerTimes == makerTimes) &&
            (identical(other.takerTimes, takerTimes) ||
                other.takerTimes == takerTimes) &&
            (identical(other.makerSuccessTotal, makerSuccessTotal) ||
                other.makerSuccessTotal == makerSuccessTotal) &&
            (identical(other.takerSuccessTotal, takerSuccessTotal) ||
                other.takerSuccessTotal == takerSuccessTotal) &&
            (identical(other.commissionTotal, commissionTotal) ||
                other.commissionTotal == commissionTotal) &&
            (identical(other.makerCommissionTotal, makerCommissionTotal) ||
                other.makerCommissionTotal == makerCommissionTotal) &&
            (identical(other.loginTimes, loginTimes) ||
                other.loginTimes == loginTimes) &&
            (identical(other.loginSuccessTimes, loginSuccessTimes) ||
                other.loginSuccessTimes == loginSuccessTimes) &&
            (identical(other.lastLoggedTime, lastLoggedTime) ||
                other.lastLoggedTime == lastLoggedTime) &&
            (identical(other.lastLoggedIp, lastLoggedIp) ||
                other.lastLoggedIp == lastLoggedIp));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      username,
      makerTimes,
      takerTimes,
      makerSuccessTotal,
      takerSuccessTotal,
      commissionTotal,
      makerCommissionTotal,
      loginTimes,
      loginSuccessTimes,
      lastLoggedTime,
      lastLoggedIp);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_UserStatsModelCopyWith<_$_UserStatsModel> get copyWith =>
      __$$_UserStatsModelCopyWithImpl<_$_UserStatsModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_UserStatsModelToJson(
      this,
    );
  }
}

abstract class _UserStatsModel implements UserStatsModel {
  const factory _UserStatsModel(
      {required final String username,
      required final int makerTimes,
      required final int takerTimes,
      required final int makerSuccessTotal,
      required final int takerSuccessTotal,
      required final num commissionTotal,
      required final num makerCommissionTotal,
      required final int loginTimes,
      required final int loginSuccessTimes,
      required final String lastLoggedTime,
      required final String lastLoggedIp}) = _$_UserStatsModel;

  factory _UserStatsModel.fromJson(Map<String, dynamic> json) =
      _$_UserStatsModel.fromJson;

  @override

  ///	用户名
  String get username;
  @override

  ///	Maker总次数
  int get makerTimes;
  @override

  ///	Taker总次数
  int get takerTimes;
  @override

  ///	Maker成单总次数
  int get makerSuccessTotal;
  @override

  ///	Taker成单总次数
  int get takerSuccessTotal;
  @override

  ///	总佣金
  num get commissionTotal;
  @override

  ///	Maker总佣金
  num get makerCommissionTotal;
  @override

  ///	登录次数
  int get loginTimes;
  @override

  ///	成功登录次数
  int get loginSuccessTimes;
  @override

  ///	最后登录时间
  String get lastLoggedTime;
  @override

  ///	最后登录IP
  String get lastLoggedIp;
  @override
  @JsonKey(ignore: true)
  _$$_UserStatsModelCopyWith<_$_UserStatsModel> get copyWith =>
      throw _privateConstructorUsedError;
}

// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'otc.model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

OtcModel _$OtcModelFromJson(Map<String, dynamic> json) {
  return _OtcModel.fromJson(json);
}

/// @nodoc
mixin _$OtcModel {
  ///是否启用
  bool get enabled => throw _privateConstructorUsedError;

  /// kyc等级
  int get kycLevel => throw _privateConstructorUsedError;

  /// 银行卡最小限收
  num get bankcardReceiptMin => throw _privateConstructorUsedError;

  /// 银行卡最大限收
  num get bankcardReceiptMax => throw _privateConstructorUsedError;

  /// 银行卡每日收收
  num get bankcardReceiptDaily => throw _privateConstructorUsedError;

  /// 微信最小限收
  num get wechatReceiptMin => throw _privateConstructorUsedError;

  /// 微信最大限收
  num get wechatReceiptMax => throw _privateConstructorUsedError;

  /// 微信每日限收
  num get wechatReceiptDaily => throw _privateConstructorUsedError;

  /// 支付宝最小限收
  num get aliReceiptMin => throw _privateConstructorUsedError;

  /// 支付宝最大限收
  num get aliReceiptMax => throw _privateConstructorUsedError;

  /// 支付宝每日限收
  num get aliReceiptDaily => throw _privateConstructorUsedError;

  /// 银行卡最小限出
  num get bankcardPayoutMin => throw _privateConstructorUsedError;

  /// 银行卡最大限出
  num get bankcardPayoutMax => throw _privateConstructorUsedError;

  /// 微信最小限出
  num get wechatPayoutMin => throw _privateConstructorUsedError;

  /// 微信最大限出
  num get wechatPayoutMax => throw _privateConstructorUsedError;

  /// 支付宝最小限出
  num get aliPayoutMin => throw _privateConstructorUsedError;

  /// 支付宝最大限出
  num get aliPayoutMax => throw _privateConstructorUsedError;

  /// 银行卡每日限出
  num get bankcardPayoutDaily => throw _privateConstructorUsedError;

  /// 微信每日限出
  num get wechatPayoutDaily => throw _privateConstructorUsedError;

  /// 支付宝每日限出
  num get aliPayoutDaily => throw _privateConstructorUsedError;

  /// 最低返佣额度
  num get lowestCommission => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $OtcModelCopyWith<OtcModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OtcModelCopyWith<$Res> {
  factory $OtcModelCopyWith(OtcModel value, $Res Function(OtcModel) then) =
      _$OtcModelCopyWithImpl<$Res, OtcModel>;
  @useResult
  $Res call(
      {bool enabled,
      int kycLevel,
      num bankcardReceiptMin,
      num bankcardReceiptMax,
      num bankcardReceiptDaily,
      num wechatReceiptMin,
      num wechatReceiptMax,
      num wechatReceiptDaily,
      num aliReceiptMin,
      num aliReceiptMax,
      num aliReceiptDaily,
      num bankcardPayoutMin,
      num bankcardPayoutMax,
      num wechatPayoutMin,
      num wechatPayoutMax,
      num aliPayoutMin,
      num aliPayoutMax,
      num bankcardPayoutDaily,
      num wechatPayoutDaily,
      num aliPayoutDaily,
      num lowestCommission});
}

/// @nodoc
class _$OtcModelCopyWithImpl<$Res, $Val extends OtcModel>
    implements $OtcModelCopyWith<$Res> {
  _$OtcModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? enabled = null,
    Object? kycLevel = null,
    Object? bankcardReceiptMin = null,
    Object? bankcardReceiptMax = null,
    Object? bankcardReceiptDaily = null,
    Object? wechatReceiptMin = null,
    Object? wechatReceiptMax = null,
    Object? wechatReceiptDaily = null,
    Object? aliReceiptMin = null,
    Object? aliReceiptMax = null,
    Object? aliReceiptDaily = null,
    Object? bankcardPayoutMin = null,
    Object? bankcardPayoutMax = null,
    Object? wechatPayoutMin = null,
    Object? wechatPayoutMax = null,
    Object? aliPayoutMin = null,
    Object? aliPayoutMax = null,
    Object? bankcardPayoutDaily = null,
    Object? wechatPayoutDaily = null,
    Object? aliPayoutDaily = null,
    Object? lowestCommission = null,
  }) {
    return _then(_value.copyWith(
      enabled: null == enabled
          ? _value.enabled
          : enabled // ignore: cast_nullable_to_non_nullable
              as bool,
      kycLevel: null == kycLevel
          ? _value.kycLevel
          : kycLevel // ignore: cast_nullable_to_non_nullable
              as int,
      bankcardReceiptMin: null == bankcardReceiptMin
          ? _value.bankcardReceiptMin
          : bankcardReceiptMin // ignore: cast_nullable_to_non_nullable
              as num,
      bankcardReceiptMax: null == bankcardReceiptMax
          ? _value.bankcardReceiptMax
          : bankcardReceiptMax // ignore: cast_nullable_to_non_nullable
              as num,
      bankcardReceiptDaily: null == bankcardReceiptDaily
          ? _value.bankcardReceiptDaily
          : bankcardReceiptDaily // ignore: cast_nullable_to_non_nullable
              as num,
      wechatReceiptMin: null == wechatReceiptMin
          ? _value.wechatReceiptMin
          : wechatReceiptMin // ignore: cast_nullable_to_non_nullable
              as num,
      wechatReceiptMax: null == wechatReceiptMax
          ? _value.wechatReceiptMax
          : wechatReceiptMax // ignore: cast_nullable_to_non_nullable
              as num,
      wechatReceiptDaily: null == wechatReceiptDaily
          ? _value.wechatReceiptDaily
          : wechatReceiptDaily // ignore: cast_nullable_to_non_nullable
              as num,
      aliReceiptMin: null == aliReceiptMin
          ? _value.aliReceiptMin
          : aliReceiptMin // ignore: cast_nullable_to_non_nullable
              as num,
      aliReceiptMax: null == aliReceiptMax
          ? _value.aliReceiptMax
          : aliReceiptMax // ignore: cast_nullable_to_non_nullable
              as num,
      aliReceiptDaily: null == aliReceiptDaily
          ? _value.aliReceiptDaily
          : aliReceiptDaily // ignore: cast_nullable_to_non_nullable
              as num,
      bankcardPayoutMin: null == bankcardPayoutMin
          ? _value.bankcardPayoutMin
          : bankcardPayoutMin // ignore: cast_nullable_to_non_nullable
              as num,
      bankcardPayoutMax: null == bankcardPayoutMax
          ? _value.bankcardPayoutMax
          : bankcardPayoutMax // ignore: cast_nullable_to_non_nullable
              as num,
      wechatPayoutMin: null == wechatPayoutMin
          ? _value.wechatPayoutMin
          : wechatPayoutMin // ignore: cast_nullable_to_non_nullable
              as num,
      wechatPayoutMax: null == wechatPayoutMax
          ? _value.wechatPayoutMax
          : wechatPayoutMax // ignore: cast_nullable_to_non_nullable
              as num,
      aliPayoutMin: null == aliPayoutMin
          ? _value.aliPayoutMin
          : aliPayoutMin // ignore: cast_nullable_to_non_nullable
              as num,
      aliPayoutMax: null == aliPayoutMax
          ? _value.aliPayoutMax
          : aliPayoutMax // ignore: cast_nullable_to_non_nullable
              as num,
      bankcardPayoutDaily: null == bankcardPayoutDaily
          ? _value.bankcardPayoutDaily
          : bankcardPayoutDaily // ignore: cast_nullable_to_non_nullable
              as num,
      wechatPayoutDaily: null == wechatPayoutDaily
          ? _value.wechatPayoutDaily
          : wechatPayoutDaily // ignore: cast_nullable_to_non_nullable
              as num,
      aliPayoutDaily: null == aliPayoutDaily
          ? _value.aliPayoutDaily
          : aliPayoutDaily // ignore: cast_nullable_to_non_nullable
              as num,
      lowestCommission: null == lowestCommission
          ? _value.lowestCommission
          : lowestCommission // ignore: cast_nullable_to_non_nullable
              as num,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_OtcModelCopyWith<$Res> implements $OtcModelCopyWith<$Res> {
  factory _$$_OtcModelCopyWith(
          _$_OtcModel value, $Res Function(_$_OtcModel) then) =
      __$$_OtcModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool enabled,
      int kycLevel,
      num bankcardReceiptMin,
      num bankcardReceiptMax,
      num bankcardReceiptDaily,
      num wechatReceiptMin,
      num wechatReceiptMax,
      num wechatReceiptDaily,
      num aliReceiptMin,
      num aliReceiptMax,
      num aliReceiptDaily,
      num bankcardPayoutMin,
      num bankcardPayoutMax,
      num wechatPayoutMin,
      num wechatPayoutMax,
      num aliPayoutMin,
      num aliPayoutMax,
      num bankcardPayoutDaily,
      num wechatPayoutDaily,
      num aliPayoutDaily,
      num lowestCommission});
}

/// @nodoc
class __$$_OtcModelCopyWithImpl<$Res>
    extends _$OtcModelCopyWithImpl<$Res, _$_OtcModel>
    implements _$$_OtcModelCopyWith<$Res> {
  __$$_OtcModelCopyWithImpl(
      _$_OtcModel _value, $Res Function(_$_OtcModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? enabled = null,
    Object? kycLevel = null,
    Object? bankcardReceiptMin = null,
    Object? bankcardReceiptMax = null,
    Object? bankcardReceiptDaily = null,
    Object? wechatReceiptMin = null,
    Object? wechatReceiptMax = null,
    Object? wechatReceiptDaily = null,
    Object? aliReceiptMin = null,
    Object? aliReceiptMax = null,
    Object? aliReceiptDaily = null,
    Object? bankcardPayoutMin = null,
    Object? bankcardPayoutMax = null,
    Object? wechatPayoutMin = null,
    Object? wechatPayoutMax = null,
    Object? aliPayoutMin = null,
    Object? aliPayoutMax = null,
    Object? bankcardPayoutDaily = null,
    Object? wechatPayoutDaily = null,
    Object? aliPayoutDaily = null,
    Object? lowestCommission = null,
  }) {
    return _then(_$_OtcModel(
      enabled: null == enabled
          ? _value.enabled
          : enabled // ignore: cast_nullable_to_non_nullable
              as bool,
      kycLevel: null == kycLevel
          ? _value.kycLevel
          : kycLevel // ignore: cast_nullable_to_non_nullable
              as int,
      bankcardReceiptMin: null == bankcardReceiptMin
          ? _value.bankcardReceiptMin
          : bankcardReceiptMin // ignore: cast_nullable_to_non_nullable
              as num,
      bankcardReceiptMax: null == bankcardReceiptMax
          ? _value.bankcardReceiptMax
          : bankcardReceiptMax // ignore: cast_nullable_to_non_nullable
              as num,
      bankcardReceiptDaily: null == bankcardReceiptDaily
          ? _value.bankcardReceiptDaily
          : bankcardReceiptDaily // ignore: cast_nullable_to_non_nullable
              as num,
      wechatReceiptMin: null == wechatReceiptMin
          ? _value.wechatReceiptMin
          : wechatReceiptMin // ignore: cast_nullable_to_non_nullable
              as num,
      wechatReceiptMax: null == wechatReceiptMax
          ? _value.wechatReceiptMax
          : wechatReceiptMax // ignore: cast_nullable_to_non_nullable
              as num,
      wechatReceiptDaily: null == wechatReceiptDaily
          ? _value.wechatReceiptDaily
          : wechatReceiptDaily // ignore: cast_nullable_to_non_nullable
              as num,
      aliReceiptMin: null == aliReceiptMin
          ? _value.aliReceiptMin
          : aliReceiptMin // ignore: cast_nullable_to_non_nullable
              as num,
      aliReceiptMax: null == aliReceiptMax
          ? _value.aliReceiptMax
          : aliReceiptMax // ignore: cast_nullable_to_non_nullable
              as num,
      aliReceiptDaily: null == aliReceiptDaily
          ? _value.aliReceiptDaily
          : aliReceiptDaily // ignore: cast_nullable_to_non_nullable
              as num,
      bankcardPayoutMin: null == bankcardPayoutMin
          ? _value.bankcardPayoutMin
          : bankcardPayoutMin // ignore: cast_nullable_to_non_nullable
              as num,
      bankcardPayoutMax: null == bankcardPayoutMax
          ? _value.bankcardPayoutMax
          : bankcardPayoutMax // ignore: cast_nullable_to_non_nullable
              as num,
      wechatPayoutMin: null == wechatPayoutMin
          ? _value.wechatPayoutMin
          : wechatPayoutMin // ignore: cast_nullable_to_non_nullable
              as num,
      wechatPayoutMax: null == wechatPayoutMax
          ? _value.wechatPayoutMax
          : wechatPayoutMax // ignore: cast_nullable_to_non_nullable
              as num,
      aliPayoutMin: null == aliPayoutMin
          ? _value.aliPayoutMin
          : aliPayoutMin // ignore: cast_nullable_to_non_nullable
              as num,
      aliPayoutMax: null == aliPayoutMax
          ? _value.aliPayoutMax
          : aliPayoutMax // ignore: cast_nullable_to_non_nullable
              as num,
      bankcardPayoutDaily: null == bankcardPayoutDaily
          ? _value.bankcardPayoutDaily
          : bankcardPayoutDaily // ignore: cast_nullable_to_non_nullable
              as num,
      wechatPayoutDaily: null == wechatPayoutDaily
          ? _value.wechatPayoutDaily
          : wechatPayoutDaily // ignore: cast_nullable_to_non_nullable
              as num,
      aliPayoutDaily: null == aliPayoutDaily
          ? _value.aliPayoutDaily
          : aliPayoutDaily // ignore: cast_nullable_to_non_nullable
              as num,
      lowestCommission: null == lowestCommission
          ? _value.lowestCommission
          : lowestCommission // ignore: cast_nullable_to_non_nullable
              as num,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_OtcModel implements _OtcModel {
  const _$_OtcModel(
      {required this.enabled,
      required this.kycLevel,
      required this.bankcardReceiptMin,
      required this.bankcardReceiptMax,
      required this.bankcardReceiptDaily,
      required this.wechatReceiptMin,
      required this.wechatReceiptMax,
      required this.wechatReceiptDaily,
      required this.aliReceiptMin,
      required this.aliReceiptMax,
      required this.aliReceiptDaily,
      required this.bankcardPayoutMin,
      required this.bankcardPayoutMax,
      required this.wechatPayoutMin,
      required this.wechatPayoutMax,
      required this.aliPayoutMin,
      required this.aliPayoutMax,
      required this.bankcardPayoutDaily,
      required this.wechatPayoutDaily,
      required this.aliPayoutDaily,
      required this.lowestCommission});

  factory _$_OtcModel.fromJson(Map<String, dynamic> json) =>
      _$$_OtcModelFromJson(json);

  ///是否启用
  @override
  final bool enabled;

  /// kyc等级
  @override
  final int kycLevel;

  /// 银行卡最小限收
  @override
  final num bankcardReceiptMin;

  /// 银行卡最大限收
  @override
  final num bankcardReceiptMax;

  /// 银行卡每日收收
  @override
  final num bankcardReceiptDaily;

  /// 微信最小限收
  @override
  final num wechatReceiptMin;

  /// 微信最大限收
  @override
  final num wechatReceiptMax;

  /// 微信每日限收
  @override
  final num wechatReceiptDaily;

  /// 支付宝最小限收
  @override
  final num aliReceiptMin;

  /// 支付宝最大限收
  @override
  final num aliReceiptMax;

  /// 支付宝每日限收
  @override
  final num aliReceiptDaily;

  /// 银行卡最小限出
  @override
  final num bankcardPayoutMin;

  /// 银行卡最大限出
  @override
  final num bankcardPayoutMax;

  /// 微信最小限出
  @override
  final num wechatPayoutMin;

  /// 微信最大限出
  @override
  final num wechatPayoutMax;

  /// 支付宝最小限出
  @override
  final num aliPayoutMin;

  /// 支付宝最大限出
  @override
  final num aliPayoutMax;

  /// 银行卡每日限出
  @override
  final num bankcardPayoutDaily;

  /// 微信每日限出
  @override
  final num wechatPayoutDaily;

  /// 支付宝每日限出
  @override
  final num aliPayoutDaily;

  /// 最低返佣额度
  @override
  final num lowestCommission;

  @override
  String toString() {
    return 'OtcModel(enabled: $enabled, kycLevel: $kycLevel, bankcardReceiptMin: $bankcardReceiptMin, bankcardReceiptMax: $bankcardReceiptMax, bankcardReceiptDaily: $bankcardReceiptDaily, wechatReceiptMin: $wechatReceiptMin, wechatReceiptMax: $wechatReceiptMax, wechatReceiptDaily: $wechatReceiptDaily, aliReceiptMin: $aliReceiptMin, aliReceiptMax: $aliReceiptMax, aliReceiptDaily: $aliReceiptDaily, bankcardPayoutMin: $bankcardPayoutMin, bankcardPayoutMax: $bankcardPayoutMax, wechatPayoutMin: $wechatPayoutMin, wechatPayoutMax: $wechatPayoutMax, aliPayoutMin: $aliPayoutMin, aliPayoutMax: $aliPayoutMax, bankcardPayoutDaily: $bankcardPayoutDaily, wechatPayoutDaily: $wechatPayoutDaily, aliPayoutDaily: $aliPayoutDaily, lowestCommission: $lowestCommission)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_OtcModel &&
            (identical(other.enabled, enabled) || other.enabled == enabled) &&
            (identical(other.kycLevel, kycLevel) ||
                other.kycLevel == kycLevel) &&
            (identical(other.bankcardReceiptMin, bankcardReceiptMin) ||
                other.bankcardReceiptMin == bankcardReceiptMin) &&
            (identical(other.bankcardReceiptMax, bankcardReceiptMax) ||
                other.bankcardReceiptMax == bankcardReceiptMax) &&
            (identical(other.bankcardReceiptDaily, bankcardReceiptDaily) ||
                other.bankcardReceiptDaily == bankcardReceiptDaily) &&
            (identical(other.wechatReceiptMin, wechatReceiptMin) ||
                other.wechatReceiptMin == wechatReceiptMin) &&
            (identical(other.wechatReceiptMax, wechatReceiptMax) ||
                other.wechatReceiptMax == wechatReceiptMax) &&
            (identical(other.wechatReceiptDaily, wechatReceiptDaily) ||
                other.wechatReceiptDaily == wechatReceiptDaily) &&
            (identical(other.aliReceiptMin, aliReceiptMin) ||
                other.aliReceiptMin == aliReceiptMin) &&
            (identical(other.aliReceiptMax, aliReceiptMax) ||
                other.aliReceiptMax == aliReceiptMax) &&
            (identical(other.aliReceiptDaily, aliReceiptDaily) ||
                other.aliReceiptDaily == aliReceiptDaily) &&
            (identical(other.bankcardPayoutMin, bankcardPayoutMin) ||
                other.bankcardPayoutMin == bankcardPayoutMin) &&
            (identical(other.bankcardPayoutMax, bankcardPayoutMax) ||
                other.bankcardPayoutMax == bankcardPayoutMax) &&
            (identical(other.wechatPayoutMin, wechatPayoutMin) ||
                other.wechatPayoutMin == wechatPayoutMin) &&
            (identical(other.wechatPayoutMax, wechatPayoutMax) ||
                other.wechatPayoutMax == wechatPayoutMax) &&
            (identical(other.aliPayoutMin, aliPayoutMin) ||
                other.aliPayoutMin == aliPayoutMin) &&
            (identical(other.aliPayoutMax, aliPayoutMax) ||
                other.aliPayoutMax == aliPayoutMax) &&
            (identical(other.bankcardPayoutDaily, bankcardPayoutDaily) ||
                other.bankcardPayoutDaily == bankcardPayoutDaily) &&
            (identical(other.wechatPayoutDaily, wechatPayoutDaily) ||
                other.wechatPayoutDaily == wechatPayoutDaily) &&
            (identical(other.aliPayoutDaily, aliPayoutDaily) ||
                other.aliPayoutDaily == aliPayoutDaily) &&
            (identical(other.lowestCommission, lowestCommission) ||
                other.lowestCommission == lowestCommission));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        enabled,
        kycLevel,
        bankcardReceiptMin,
        bankcardReceiptMax,
        bankcardReceiptDaily,
        wechatReceiptMin,
        wechatReceiptMax,
        wechatReceiptDaily,
        aliReceiptMin,
        aliReceiptMax,
        aliReceiptDaily,
        bankcardPayoutMin,
        bankcardPayoutMax,
        wechatPayoutMin,
        wechatPayoutMax,
        aliPayoutMin,
        aliPayoutMax,
        bankcardPayoutDaily,
        wechatPayoutDaily,
        aliPayoutDaily,
        lowestCommission
      ]);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_OtcModelCopyWith<_$_OtcModel> get copyWith =>
      __$$_OtcModelCopyWithImpl<_$_OtcModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_OtcModelToJson(
      this,
    );
  }
}

abstract class _OtcModel implements OtcModel {
  const factory _OtcModel(
      {required final bool enabled,
      required final int kycLevel,
      required final num bankcardReceiptMin,
      required final num bankcardReceiptMax,
      required final num bankcardReceiptDaily,
      required final num wechatReceiptMin,
      required final num wechatReceiptMax,
      required final num wechatReceiptDaily,
      required final num aliReceiptMin,
      required final num aliReceiptMax,
      required final num aliReceiptDaily,
      required final num bankcardPayoutMin,
      required final num bankcardPayoutMax,
      required final num wechatPayoutMin,
      required final num wechatPayoutMax,
      required final num aliPayoutMin,
      required final num aliPayoutMax,
      required final num bankcardPayoutDaily,
      required final num wechatPayoutDaily,
      required final num aliPayoutDaily,
      required final num lowestCommission}) = _$_OtcModel;

  factory _OtcModel.fromJson(Map<String, dynamic> json) = _$_OtcModel.fromJson;

  @override

  ///是否启用
  bool get enabled;
  @override

  /// kyc等级
  int get kycLevel;
  @override

  /// 银行卡最小限收
  num get bankcardReceiptMin;
  @override

  /// 银行卡最大限收
  num get bankcardReceiptMax;
  @override

  /// 银行卡每日收收
  num get bankcardReceiptDaily;
  @override

  /// 微信最小限收
  num get wechatReceiptMin;
  @override

  /// 微信最大限收
  num get wechatReceiptMax;
  @override

  /// 微信每日限收
  num get wechatReceiptDaily;
  @override

  /// 支付宝最小限收
  num get aliReceiptMin;
  @override

  /// 支付宝最大限收
  num get aliReceiptMax;
  @override

  /// 支付宝每日限收
  num get aliReceiptDaily;
  @override

  /// 银行卡最小限出
  num get bankcardPayoutMin;
  @override

  /// 银行卡最大限出
  num get bankcardPayoutMax;
  @override

  /// 微信最小限出
  num get wechatPayoutMin;
  @override

  /// 微信最大限出
  num get wechatPayoutMax;
  @override

  /// 支付宝最小限出
  num get aliPayoutMin;
  @override

  /// 支付宝最大限出
  num get aliPayoutMax;
  @override

  /// 银行卡每日限出
  num get bankcardPayoutDaily;
  @override

  /// 微信每日限出
  num get wechatPayoutDaily;
  @override

  /// 支付宝每日限出
  num get aliPayoutDaily;
  @override

  /// 最低返佣额度
  num get lowestCommission;
  @override
  @JsonKey(ignore: true)
  _$$_OtcModelCopyWith<_$_OtcModel> get copyWith =>
      throw _privateConstructorUsedError;
}

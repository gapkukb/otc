// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'otc.monthly.stat.model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

OtcMonthlyStatModel _$OtcMonthlyStatModelFromJson(Map<String, dynamic> json) {
  return _OtcMonthlyStatModel.fromJson(json);
}

/// @nodoc
mixin _$OtcMonthlyStatModel {
  /// 	挂单数	integer
  String get makerCount => throw _privateConstructorUsedError;
  OtcMonthlyStatRangeModel get range => throw _privateConstructorUsedError;

  /// 	成单数	integer
  num get makerPaidCount => throw _privateConstructorUsedError;

  /// 	星级成单数	integer
  num get makerPaidStarCount => throw _privateConstructorUsedError;

  /// 	佣金	number
  num get makerCommission => throw _privateConstructorUsedError;

  /// 	taker 单数
  num get takerCount => throw _privateConstructorUsedError;

  /// 	taker 成单数
  num get takerPaidCount => throw _privateConstructorUsedError;

  /// 	maker 打款时间
  num get makerNotifyTimes => throw _privateConstructorUsedError;

  /// 	maker 放行时间
  num get makerConfirmTimes => throw _privateConstructorUsedError;

  /// 	taker 打款时间
  num get takerNotifyTimes => throw _privateConstructorUsedError;

  /// 	taker 放行时间
  num get takerConfirmTimes => throw _privateConstructorUsedError;

  /// 	历史总挂单	integer
  num get historyMakerCount => throw _privateConstructorUsedError;

  /// 	历史总taker单数	integer
  num get historyTakerCount => throw _privateConstructorUsedError;

  /// 	历史总Maker成单数	integer
  num get historyMakerPaidCount => throw _privateConstructorUsedError;

  /// 	历史总taker成单数	integer
  num get historyTakerPaidCount => throw _privateConstructorUsedError;

  /// 	历史总佣金
  num get historyMakerCommission => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $OtcMonthlyStatModelCopyWith<OtcMonthlyStatModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OtcMonthlyStatModelCopyWith<$Res> {
  factory $OtcMonthlyStatModelCopyWith(
          OtcMonthlyStatModel value, $Res Function(OtcMonthlyStatModel) then) =
      _$OtcMonthlyStatModelCopyWithImpl<$Res, OtcMonthlyStatModel>;
  @useResult
  $Res call(
      {String makerCount,
      OtcMonthlyStatRangeModel range,
      num makerPaidCount,
      num makerPaidStarCount,
      num makerCommission,
      num takerCount,
      num takerPaidCount,
      num makerNotifyTimes,
      num makerConfirmTimes,
      num takerNotifyTimes,
      num takerConfirmTimes,
      num historyMakerCount,
      num historyTakerCount,
      num historyMakerPaidCount,
      num historyTakerPaidCount,
      num historyMakerCommission});

  $OtcMonthlyStatRangeModelCopyWith<$Res> get range;
}

/// @nodoc
class _$OtcMonthlyStatModelCopyWithImpl<$Res, $Val extends OtcMonthlyStatModel>
    implements $OtcMonthlyStatModelCopyWith<$Res> {
  _$OtcMonthlyStatModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? makerCount = null,
    Object? range = null,
    Object? makerPaidCount = null,
    Object? makerPaidStarCount = null,
    Object? makerCommission = null,
    Object? takerCount = null,
    Object? takerPaidCount = null,
    Object? makerNotifyTimes = null,
    Object? makerConfirmTimes = null,
    Object? takerNotifyTimes = null,
    Object? takerConfirmTimes = null,
    Object? historyMakerCount = null,
    Object? historyTakerCount = null,
    Object? historyMakerPaidCount = null,
    Object? historyTakerPaidCount = null,
    Object? historyMakerCommission = null,
  }) {
    return _then(_value.copyWith(
      makerCount: null == makerCount
          ? _value.makerCount
          : makerCount // ignore: cast_nullable_to_non_nullable
              as String,
      range: null == range
          ? _value.range
          : range // ignore: cast_nullable_to_non_nullable
              as OtcMonthlyStatRangeModel,
      makerPaidCount: null == makerPaidCount
          ? _value.makerPaidCount
          : makerPaidCount // ignore: cast_nullable_to_non_nullable
              as num,
      makerPaidStarCount: null == makerPaidStarCount
          ? _value.makerPaidStarCount
          : makerPaidStarCount // ignore: cast_nullable_to_non_nullable
              as num,
      makerCommission: null == makerCommission
          ? _value.makerCommission
          : makerCommission // ignore: cast_nullable_to_non_nullable
              as num,
      takerCount: null == takerCount
          ? _value.takerCount
          : takerCount // ignore: cast_nullable_to_non_nullable
              as num,
      takerPaidCount: null == takerPaidCount
          ? _value.takerPaidCount
          : takerPaidCount // ignore: cast_nullable_to_non_nullable
              as num,
      makerNotifyTimes: null == makerNotifyTimes
          ? _value.makerNotifyTimes
          : makerNotifyTimes // ignore: cast_nullable_to_non_nullable
              as num,
      makerConfirmTimes: null == makerConfirmTimes
          ? _value.makerConfirmTimes
          : makerConfirmTimes // ignore: cast_nullable_to_non_nullable
              as num,
      takerNotifyTimes: null == takerNotifyTimes
          ? _value.takerNotifyTimes
          : takerNotifyTimes // ignore: cast_nullable_to_non_nullable
              as num,
      takerConfirmTimes: null == takerConfirmTimes
          ? _value.takerConfirmTimes
          : takerConfirmTimes // ignore: cast_nullable_to_non_nullable
              as num,
      historyMakerCount: null == historyMakerCount
          ? _value.historyMakerCount
          : historyMakerCount // ignore: cast_nullable_to_non_nullable
              as num,
      historyTakerCount: null == historyTakerCount
          ? _value.historyTakerCount
          : historyTakerCount // ignore: cast_nullable_to_non_nullable
              as num,
      historyMakerPaidCount: null == historyMakerPaidCount
          ? _value.historyMakerPaidCount
          : historyMakerPaidCount // ignore: cast_nullable_to_non_nullable
              as num,
      historyTakerPaidCount: null == historyTakerPaidCount
          ? _value.historyTakerPaidCount
          : historyTakerPaidCount // ignore: cast_nullable_to_non_nullable
              as num,
      historyMakerCommission: null == historyMakerCommission
          ? _value.historyMakerCommission
          : historyMakerCommission // ignore: cast_nullable_to_non_nullable
              as num,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $OtcMonthlyStatRangeModelCopyWith<$Res> get range {
    return $OtcMonthlyStatRangeModelCopyWith<$Res>(_value.range, (value) {
      return _then(_value.copyWith(range: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_OtcMonthlyStatModelCopyWith<$Res>
    implements $OtcMonthlyStatModelCopyWith<$Res> {
  factory _$$_OtcMonthlyStatModelCopyWith(_$_OtcMonthlyStatModel value,
          $Res Function(_$_OtcMonthlyStatModel) then) =
      __$$_OtcMonthlyStatModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String makerCount,
      OtcMonthlyStatRangeModel range,
      num makerPaidCount,
      num makerPaidStarCount,
      num makerCommission,
      num takerCount,
      num takerPaidCount,
      num makerNotifyTimes,
      num makerConfirmTimes,
      num takerNotifyTimes,
      num takerConfirmTimes,
      num historyMakerCount,
      num historyTakerCount,
      num historyMakerPaidCount,
      num historyTakerPaidCount,
      num historyMakerCommission});

  @override
  $OtcMonthlyStatRangeModelCopyWith<$Res> get range;
}

/// @nodoc
class __$$_OtcMonthlyStatModelCopyWithImpl<$Res>
    extends _$OtcMonthlyStatModelCopyWithImpl<$Res, _$_OtcMonthlyStatModel>
    implements _$$_OtcMonthlyStatModelCopyWith<$Res> {
  __$$_OtcMonthlyStatModelCopyWithImpl(_$_OtcMonthlyStatModel _value,
      $Res Function(_$_OtcMonthlyStatModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? makerCount = null,
    Object? range = null,
    Object? makerPaidCount = null,
    Object? makerPaidStarCount = null,
    Object? makerCommission = null,
    Object? takerCount = null,
    Object? takerPaidCount = null,
    Object? makerNotifyTimes = null,
    Object? makerConfirmTimes = null,
    Object? takerNotifyTimes = null,
    Object? takerConfirmTimes = null,
    Object? historyMakerCount = null,
    Object? historyTakerCount = null,
    Object? historyMakerPaidCount = null,
    Object? historyTakerPaidCount = null,
    Object? historyMakerCommission = null,
  }) {
    return _then(_$_OtcMonthlyStatModel(
      makerCount: null == makerCount
          ? _value.makerCount
          : makerCount // ignore: cast_nullable_to_non_nullable
              as String,
      range: null == range
          ? _value.range
          : range // ignore: cast_nullable_to_non_nullable
              as OtcMonthlyStatRangeModel,
      makerPaidCount: null == makerPaidCount
          ? _value.makerPaidCount
          : makerPaidCount // ignore: cast_nullable_to_non_nullable
              as num,
      makerPaidStarCount: null == makerPaidStarCount
          ? _value.makerPaidStarCount
          : makerPaidStarCount // ignore: cast_nullable_to_non_nullable
              as num,
      makerCommission: null == makerCommission
          ? _value.makerCommission
          : makerCommission // ignore: cast_nullable_to_non_nullable
              as num,
      takerCount: null == takerCount
          ? _value.takerCount
          : takerCount // ignore: cast_nullable_to_non_nullable
              as num,
      takerPaidCount: null == takerPaidCount
          ? _value.takerPaidCount
          : takerPaidCount // ignore: cast_nullable_to_non_nullable
              as num,
      makerNotifyTimes: null == makerNotifyTimes
          ? _value.makerNotifyTimes
          : makerNotifyTimes // ignore: cast_nullable_to_non_nullable
              as num,
      makerConfirmTimes: null == makerConfirmTimes
          ? _value.makerConfirmTimes
          : makerConfirmTimes // ignore: cast_nullable_to_non_nullable
              as num,
      takerNotifyTimes: null == takerNotifyTimes
          ? _value.takerNotifyTimes
          : takerNotifyTimes // ignore: cast_nullable_to_non_nullable
              as num,
      takerConfirmTimes: null == takerConfirmTimes
          ? _value.takerConfirmTimes
          : takerConfirmTimes // ignore: cast_nullable_to_non_nullable
              as num,
      historyMakerCount: null == historyMakerCount
          ? _value.historyMakerCount
          : historyMakerCount // ignore: cast_nullable_to_non_nullable
              as num,
      historyTakerCount: null == historyTakerCount
          ? _value.historyTakerCount
          : historyTakerCount // ignore: cast_nullable_to_non_nullable
              as num,
      historyMakerPaidCount: null == historyMakerPaidCount
          ? _value.historyMakerPaidCount
          : historyMakerPaidCount // ignore: cast_nullable_to_non_nullable
              as num,
      historyTakerPaidCount: null == historyTakerPaidCount
          ? _value.historyTakerPaidCount
          : historyTakerPaidCount // ignore: cast_nullable_to_non_nullable
              as num,
      historyMakerCommission: null == historyMakerCommission
          ? _value.historyMakerCommission
          : historyMakerCommission // ignore: cast_nullable_to_non_nullable
              as num,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_OtcMonthlyStatModel implements _OtcMonthlyStatModel {
  const _$_OtcMonthlyStatModel(
      {required this.makerCount,
      required this.range,
      required this.makerPaidCount,
      required this.makerPaidStarCount,
      required this.makerCommission,
      required this.takerCount,
      required this.takerPaidCount,
      required this.makerNotifyTimes,
      required this.makerConfirmTimes,
      required this.takerNotifyTimes,
      required this.takerConfirmTimes,
      required this.historyMakerCount,
      required this.historyTakerCount,
      required this.historyMakerPaidCount,
      required this.historyTakerPaidCount,
      required this.historyMakerCommission});

  factory _$_OtcMonthlyStatModel.fromJson(Map<String, dynamic> json) =>
      _$$_OtcMonthlyStatModelFromJson(json);

  /// 	挂单数	integer
  @override
  final String makerCount;
  @override
  final OtcMonthlyStatRangeModel range;

  /// 	成单数	integer
  @override
  final num makerPaidCount;

  /// 	星级成单数	integer
  @override
  final num makerPaidStarCount;

  /// 	佣金	number
  @override
  final num makerCommission;

  /// 	taker 单数
  @override
  final num takerCount;

  /// 	taker 成单数
  @override
  final num takerPaidCount;

  /// 	maker 打款时间
  @override
  final num makerNotifyTimes;

  /// 	maker 放行时间
  @override
  final num makerConfirmTimes;

  /// 	taker 打款时间
  @override
  final num takerNotifyTimes;

  /// 	taker 放行时间
  @override
  final num takerConfirmTimes;

  /// 	历史总挂单	integer
  @override
  final num historyMakerCount;

  /// 	历史总taker单数	integer
  @override
  final num historyTakerCount;

  /// 	历史总Maker成单数	integer
  @override
  final num historyMakerPaidCount;

  /// 	历史总taker成单数	integer
  @override
  final num historyTakerPaidCount;

  /// 	历史总佣金
  @override
  final num historyMakerCommission;

  @override
  String toString() {
    return 'OtcMonthlyStatModel(makerCount: $makerCount, range: $range, makerPaidCount: $makerPaidCount, makerPaidStarCount: $makerPaidStarCount, makerCommission: $makerCommission, takerCount: $takerCount, takerPaidCount: $takerPaidCount, makerNotifyTimes: $makerNotifyTimes, makerConfirmTimes: $makerConfirmTimes, takerNotifyTimes: $takerNotifyTimes, takerConfirmTimes: $takerConfirmTimes, historyMakerCount: $historyMakerCount, historyTakerCount: $historyTakerCount, historyMakerPaidCount: $historyMakerPaidCount, historyTakerPaidCount: $historyTakerPaidCount, historyMakerCommission: $historyMakerCommission)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_OtcMonthlyStatModel &&
            (identical(other.makerCount, makerCount) ||
                other.makerCount == makerCount) &&
            (identical(other.range, range) || other.range == range) &&
            (identical(other.makerPaidCount, makerPaidCount) ||
                other.makerPaidCount == makerPaidCount) &&
            (identical(other.makerPaidStarCount, makerPaidStarCount) ||
                other.makerPaidStarCount == makerPaidStarCount) &&
            (identical(other.makerCommission, makerCommission) ||
                other.makerCommission == makerCommission) &&
            (identical(other.takerCount, takerCount) ||
                other.takerCount == takerCount) &&
            (identical(other.takerPaidCount, takerPaidCount) ||
                other.takerPaidCount == takerPaidCount) &&
            (identical(other.makerNotifyTimes, makerNotifyTimes) ||
                other.makerNotifyTimes == makerNotifyTimes) &&
            (identical(other.makerConfirmTimes, makerConfirmTimes) ||
                other.makerConfirmTimes == makerConfirmTimes) &&
            (identical(other.takerNotifyTimes, takerNotifyTimes) ||
                other.takerNotifyTimes == takerNotifyTimes) &&
            (identical(other.takerConfirmTimes, takerConfirmTimes) ||
                other.takerConfirmTimes == takerConfirmTimes) &&
            (identical(other.historyMakerCount, historyMakerCount) ||
                other.historyMakerCount == historyMakerCount) &&
            (identical(other.historyTakerCount, historyTakerCount) ||
                other.historyTakerCount == historyTakerCount) &&
            (identical(other.historyMakerPaidCount, historyMakerPaidCount) ||
                other.historyMakerPaidCount == historyMakerPaidCount) &&
            (identical(other.historyTakerPaidCount, historyTakerPaidCount) ||
                other.historyTakerPaidCount == historyTakerPaidCount) &&
            (identical(other.historyMakerCommission, historyMakerCommission) ||
                other.historyMakerCommission == historyMakerCommission));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      makerCount,
      range,
      makerPaidCount,
      makerPaidStarCount,
      makerCommission,
      takerCount,
      takerPaidCount,
      makerNotifyTimes,
      makerConfirmTimes,
      takerNotifyTimes,
      takerConfirmTimes,
      historyMakerCount,
      historyTakerCount,
      historyMakerPaidCount,
      historyTakerPaidCount,
      historyMakerCommission);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_OtcMonthlyStatModelCopyWith<_$_OtcMonthlyStatModel> get copyWith =>
      __$$_OtcMonthlyStatModelCopyWithImpl<_$_OtcMonthlyStatModel>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_OtcMonthlyStatModelToJson(
      this,
    );
  }
}

abstract class _OtcMonthlyStatModel implements OtcMonthlyStatModel {
  const factory _OtcMonthlyStatModel(
      {required final String makerCount,
      required final OtcMonthlyStatRangeModel range,
      required final num makerPaidCount,
      required final num makerPaidStarCount,
      required final num makerCommission,
      required final num takerCount,
      required final num takerPaidCount,
      required final num makerNotifyTimes,
      required final num makerConfirmTimes,
      required final num takerNotifyTimes,
      required final num takerConfirmTimes,
      required final num historyMakerCount,
      required final num historyTakerCount,
      required final num historyMakerPaidCount,
      required final num historyTakerPaidCount,
      required final num historyMakerCommission}) = _$_OtcMonthlyStatModel;

  factory _OtcMonthlyStatModel.fromJson(Map<String, dynamic> json) =
      _$_OtcMonthlyStatModel.fromJson;

  @override

  /// 	挂单数	integer
  String get makerCount;
  @override
  OtcMonthlyStatRangeModel get range;
  @override

  /// 	成单数	integer
  num get makerPaidCount;
  @override

  /// 	星级成单数	integer
  num get makerPaidStarCount;
  @override

  /// 	佣金	number
  num get makerCommission;
  @override

  /// 	taker 单数
  num get takerCount;
  @override

  /// 	taker 成单数
  num get takerPaidCount;
  @override

  /// 	maker 打款时间
  num get makerNotifyTimes;
  @override

  /// 	maker 放行时间
  num get makerConfirmTimes;
  @override

  /// 	taker 打款时间
  num get takerNotifyTimes;
  @override

  /// 	taker 放行时间
  num get takerConfirmTimes;
  @override

  /// 	历史总挂单	integer
  num get historyMakerCount;
  @override

  /// 	历史总taker单数	integer
  num get historyTakerCount;
  @override

  /// 	历史总Maker成单数	integer
  num get historyMakerPaidCount;
  @override

  /// 	历史总taker成单数	integer
  num get historyTakerPaidCount;
  @override

  /// 	历史总佣金
  num get historyMakerCommission;
  @override
  @JsonKey(ignore: true)
  _$$_OtcMonthlyStatModelCopyWith<_$_OtcMonthlyStatModel> get copyWith =>
      throw _privateConstructorUsedError;
}

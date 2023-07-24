// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'otc.monthly.stat.range.model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

OtcMonthlyStatRangeModel _$OtcMonthlyStatRangeModelFromJson(
    Map<String, dynamic> json) {
  return _OtcMonthlyStatRangeModel.fromJson(json);
}

/// @nodoc
mixin _$OtcMonthlyStatRangeModel {
  String get firstName => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $OtcMonthlyStatRangeModelCopyWith<OtcMonthlyStatRangeModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OtcMonthlyStatRangeModelCopyWith<$Res> {
  factory $OtcMonthlyStatRangeModelCopyWith(OtcMonthlyStatRangeModel value,
          $Res Function(OtcMonthlyStatRangeModel) then) =
      _$OtcMonthlyStatRangeModelCopyWithImpl<$Res, OtcMonthlyStatRangeModel>;
  @useResult
  $Res call({String firstName});
}

/// @nodoc
class _$OtcMonthlyStatRangeModelCopyWithImpl<$Res,
        $Val extends OtcMonthlyStatRangeModel>
    implements $OtcMonthlyStatRangeModelCopyWith<$Res> {
  _$OtcMonthlyStatRangeModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? firstName = null,
  }) {
    return _then(_value.copyWith(
      firstName: null == firstName
          ? _value.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_OtcMonthlyStatRangeModelCopyWith<$Res>
    implements $OtcMonthlyStatRangeModelCopyWith<$Res> {
  factory _$$_OtcMonthlyStatRangeModelCopyWith(
          _$_OtcMonthlyStatRangeModel value,
          $Res Function(_$_OtcMonthlyStatRangeModel) then) =
      __$$_OtcMonthlyStatRangeModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String firstName});
}

/// @nodoc
class __$$_OtcMonthlyStatRangeModelCopyWithImpl<$Res>
    extends _$OtcMonthlyStatRangeModelCopyWithImpl<$Res,
        _$_OtcMonthlyStatRangeModel>
    implements _$$_OtcMonthlyStatRangeModelCopyWith<$Res> {
  __$$_OtcMonthlyStatRangeModelCopyWithImpl(_$_OtcMonthlyStatRangeModel _value,
      $Res Function(_$_OtcMonthlyStatRangeModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? firstName = null,
  }) {
    return _then(_$_OtcMonthlyStatRangeModel(
      firstName: null == firstName
          ? _value.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_OtcMonthlyStatRangeModel implements _OtcMonthlyStatRangeModel {
  const _$_OtcMonthlyStatRangeModel({required this.firstName});

  factory _$_OtcMonthlyStatRangeModel.fromJson(Map<String, dynamic> json) =>
      _$$_OtcMonthlyStatRangeModelFromJson(json);

  @override
  final String firstName;

  @override
  String toString() {
    return 'OtcMonthlyStatRangeModel(firstName: $firstName)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_OtcMonthlyStatRangeModel &&
            (identical(other.firstName, firstName) ||
                other.firstName == firstName));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, firstName);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_OtcMonthlyStatRangeModelCopyWith<_$_OtcMonthlyStatRangeModel>
      get copyWith => __$$_OtcMonthlyStatRangeModelCopyWithImpl<
          _$_OtcMonthlyStatRangeModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_OtcMonthlyStatRangeModelToJson(
      this,
    );
  }
}

abstract class _OtcMonthlyStatRangeModel implements OtcMonthlyStatRangeModel {
  const factory _OtcMonthlyStatRangeModel({required final String firstName}) =
      _$_OtcMonthlyStatRangeModel;

  factory _OtcMonthlyStatRangeModel.fromJson(Map<String, dynamic> json) =
      _$_OtcMonthlyStatRangeModel.fromJson;

  @override
  String get firstName;
  @override
  @JsonKey(ignore: true)
  _$$_OtcMonthlyStatRangeModelCopyWith<_$_OtcMonthlyStatRangeModel>
      get copyWith => throw _privateConstructorUsedError;
}

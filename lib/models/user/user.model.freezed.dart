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
  @JsonKey(name: "customer")
  UserBaseModel get base => throw _privateConstructorUsedError;
  @JsonKey(name: "data")
  UserStatsModel get stats => throw _privateConstructorUsedError;
  KycModel get kyc => throw _privateConstructorUsedError;

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
      {@JsonKey(name: "customer") UserBaseModel base,
      @JsonKey(name: "data") UserStatsModel stats,
      KycModel kyc});

  $UserBaseModelCopyWith<$Res> get base;
  $UserStatsModelCopyWith<$Res> get stats;
  $KycModelCopyWith<$Res> get kyc;
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
    Object? base = null,
    Object? stats = null,
    Object? kyc = null,
  }) {
    return _then(_value.copyWith(
      base: null == base
          ? _value.base
          : base // ignore: cast_nullable_to_non_nullable
              as UserBaseModel,
      stats: null == stats
          ? _value.stats
          : stats // ignore: cast_nullable_to_non_nullable
              as UserStatsModel,
      kyc: null == kyc
          ? _value.kyc
          : kyc // ignore: cast_nullable_to_non_nullable
              as KycModel,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $UserBaseModelCopyWith<$Res> get base {
    return $UserBaseModelCopyWith<$Res>(_value.base, (value) {
      return _then(_value.copyWith(base: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $UserStatsModelCopyWith<$Res> get stats {
    return $UserStatsModelCopyWith<$Res>(_value.stats, (value) {
      return _then(_value.copyWith(stats: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $KycModelCopyWith<$Res> get kyc {
    return $KycModelCopyWith<$Res>(_value.kyc, (value) {
      return _then(_value.copyWith(kyc: value) as $Val);
    });
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
      {@JsonKey(name: "customer") UserBaseModel base,
      @JsonKey(name: "data") UserStatsModel stats,
      KycModel kyc});

  @override
  $UserBaseModelCopyWith<$Res> get base;
  @override
  $UserStatsModelCopyWith<$Res> get stats;
  @override
  $KycModelCopyWith<$Res> get kyc;
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
    Object? base = null,
    Object? stats = null,
    Object? kyc = null,
  }) {
    return _then(_$_UserModel(
      base: null == base
          ? _value.base
          : base // ignore: cast_nullable_to_non_nullable
              as UserBaseModel,
      stats: null == stats
          ? _value.stats
          : stats // ignore: cast_nullable_to_non_nullable
              as UserStatsModel,
      kyc: null == kyc
          ? _value.kyc
          : kyc // ignore: cast_nullable_to_non_nullable
              as KycModel,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_UserModel implements _UserModel {
  const _$_UserModel(
      {@JsonKey(name: "customer") required this.base,
      @JsonKey(name: "data") required this.stats,
      required this.kyc});

  factory _$_UserModel.fromJson(Map<String, dynamic> json) =>
      _$$_UserModelFromJson(json);

  @override
  @JsonKey(name: "customer")
  final UserBaseModel base;
  @override
  @JsonKey(name: "data")
  final UserStatsModel stats;
  @override
  final KycModel kyc;

  @override
  String toString() {
    return 'UserModel(base: $base, stats: $stats, kyc: $kyc)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_UserModel &&
            (identical(other.base, base) || other.base == base) &&
            (identical(other.stats, stats) || other.stats == stats) &&
            (identical(other.kyc, kyc) || other.kyc == kyc));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, base, stats, kyc);

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
      {@JsonKey(name: "customer") required final UserBaseModel base,
      @JsonKey(name: "data") required final UserStatsModel stats,
      required final KycModel kyc}) = _$_UserModel;

  factory _UserModel.fromJson(Map<String, dynamic> json) =
      _$_UserModel.fromJson;

  @override
  @JsonKey(name: "customer")
  UserBaseModel get base;
  @override
  @JsonKey(name: "data")
  UserStatsModel get stats;
  @override
  KycModel get kyc;
  @override
  @JsonKey(ignore: true)
  _$$_UserModelCopyWith<_$_UserModel> get copyWith =>
      throw _privateConstructorUsedError;
}

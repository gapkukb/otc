// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'kyc.model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

KycModel _$KycModelFromJson(Map<String, dynamic> json) {
  return _KycModel.fromJson(json);
}

/// @nodoc
mixin _$KycModel {
  String get username => throw _privateConstructorUsedError;
  String get reference => throw _privateConstructorUsedError;
  String get identity => throw _privateConstructorUsedError;
  String get status => throw _privateConstructorUsedError;
  bool get used => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $KycModelCopyWith<KycModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $KycModelCopyWith<$Res> {
  factory $KycModelCopyWith(KycModel value, $Res Function(KycModel) then) =
      _$KycModelCopyWithImpl<$Res, KycModel>;
  @useResult
  $Res call(
      {String username,
      String reference,
      String identity,
      String status,
      bool used});
}

/// @nodoc
class _$KycModelCopyWithImpl<$Res, $Val extends KycModel>
    implements $KycModelCopyWith<$Res> {
  _$KycModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? username = null,
    Object? reference = null,
    Object? identity = null,
    Object? status = null,
    Object? used = null,
  }) {
    return _then(_value.copyWith(
      username: null == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String,
      reference: null == reference
          ? _value.reference
          : reference // ignore: cast_nullable_to_non_nullable
              as String,
      identity: null == identity
          ? _value.identity
          : identity // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      used: null == used
          ? _value.used
          : used // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_KycModelCopyWith<$Res> implements $KycModelCopyWith<$Res> {
  factory _$$_KycModelCopyWith(
          _$_KycModel value, $Res Function(_$_KycModel) then) =
      __$$_KycModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String username,
      String reference,
      String identity,
      String status,
      bool used});
}

/// @nodoc
class __$$_KycModelCopyWithImpl<$Res>
    extends _$KycModelCopyWithImpl<$Res, _$_KycModel>
    implements _$$_KycModelCopyWith<$Res> {
  __$$_KycModelCopyWithImpl(
      _$_KycModel _value, $Res Function(_$_KycModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? username = null,
    Object? reference = null,
    Object? identity = null,
    Object? status = null,
    Object? used = null,
  }) {
    return _then(_$_KycModel(
      username: null == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String,
      reference: null == reference
          ? _value.reference
          : reference // ignore: cast_nullable_to_non_nullable
              as String,
      identity: null == identity
          ? _value.identity
          : identity // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      used: null == used
          ? _value.used
          : used // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_KycModel implements _KycModel {
  const _$_KycModel(
      {required this.username,
      required this.reference,
      required this.identity,
      required this.status,
      required this.used});

  factory _$_KycModel.fromJson(Map<String, dynamic> json) =>
      _$$_KycModelFromJson(json);

  @override
  final String username;
  @override
  final String reference;
  @override
  final String identity;
  @override
  final String status;
  @override
  final bool used;

  @override
  String toString() {
    return 'KycModel(username: $username, reference: $reference, identity: $identity, status: $status, used: $used)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_KycModel &&
            (identical(other.username, username) ||
                other.username == username) &&
            (identical(other.reference, reference) ||
                other.reference == reference) &&
            (identical(other.identity, identity) ||
                other.identity == identity) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.used, used) || other.used == used));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, username, reference, identity, status, used);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_KycModelCopyWith<_$_KycModel> get copyWith =>
      __$$_KycModelCopyWithImpl<_$_KycModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_KycModelToJson(
      this,
    );
  }
}

abstract class _KycModel implements KycModel {
  const factory _KycModel(
      {required final String username,
      required final String reference,
      required final String identity,
      required final String status,
      required final bool used}) = _$_KycModel;

  factory _KycModel.fromJson(Map<String, dynamic> json) = _$_KycModel.fromJson;

  @override
  String get username;
  @override
  String get reference;
  @override
  String get identity;
  @override
  String get status;
  @override
  bool get used;
  @override
  @JsonKey(ignore: true)
  _$$_KycModelCopyWith<_$_KycModel> get copyWith =>
      throw _privateConstructorUsedError;
}

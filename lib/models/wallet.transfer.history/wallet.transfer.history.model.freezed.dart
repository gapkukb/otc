// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'wallet.transfer.history.model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

WalletTransferHistoryModel _$WalletTransferHistoryModelFromJson(
    Map<String, dynamic> json) {
  return _WalletTransferHistoryModel.fromJson(json);
}

/// @nodoc
mixin _$WalletTransferHistoryModel {
  num get id => throw _privateConstructorUsedError;
  String get reference => throw _privateConstructorUsedError;
  @JsonKey(name: "in")
  bool get incomne => throw _privateConstructorUsedError;
  String get fromUsername => throw _privateConstructorUsedError;
  String get toUsername => throw _privateConstructorUsedError;
  num get fromBalanceBefore => throw _privateConstructorUsedError;
  num get fromBalanceAfter => throw _privateConstructorUsedError;
  num get toBalanceBefore => throw _privateConstructorUsedError;
  num get toBalanceAfter => throw _privateConstructorUsedError;
  String get currency => throw _privateConstructorUsedError;
  num get amount => throw _privateConstructorUsedError;
  String get createdTime => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $WalletTransferHistoryModelCopyWith<WalletTransferHistoryModel>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WalletTransferHistoryModelCopyWith<$Res> {
  factory $WalletTransferHistoryModelCopyWith(WalletTransferHistoryModel value,
          $Res Function(WalletTransferHistoryModel) then) =
      _$WalletTransferHistoryModelCopyWithImpl<$Res,
          WalletTransferHistoryModel>;
  @useResult
  $Res call(
      {num id,
      String reference,
      @JsonKey(name: "in") bool incomne,
      String fromUsername,
      String toUsername,
      num fromBalanceBefore,
      num fromBalanceAfter,
      num toBalanceBefore,
      num toBalanceAfter,
      String currency,
      num amount,
      String createdTime});
}

/// @nodoc
class _$WalletTransferHistoryModelCopyWithImpl<$Res,
        $Val extends WalletTransferHistoryModel>
    implements $WalletTransferHistoryModelCopyWith<$Res> {
  _$WalletTransferHistoryModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? reference = null,
    Object? incomne = null,
    Object? fromUsername = null,
    Object? toUsername = null,
    Object? fromBalanceBefore = null,
    Object? fromBalanceAfter = null,
    Object? toBalanceBefore = null,
    Object? toBalanceAfter = null,
    Object? currency = null,
    Object? amount = null,
    Object? createdTime = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as num,
      reference: null == reference
          ? _value.reference
          : reference // ignore: cast_nullable_to_non_nullable
              as String,
      incomne: null == incomne
          ? _value.incomne
          : incomne // ignore: cast_nullable_to_non_nullable
              as bool,
      fromUsername: null == fromUsername
          ? _value.fromUsername
          : fromUsername // ignore: cast_nullable_to_non_nullable
              as String,
      toUsername: null == toUsername
          ? _value.toUsername
          : toUsername // ignore: cast_nullable_to_non_nullable
              as String,
      fromBalanceBefore: null == fromBalanceBefore
          ? _value.fromBalanceBefore
          : fromBalanceBefore // ignore: cast_nullable_to_non_nullable
              as num,
      fromBalanceAfter: null == fromBalanceAfter
          ? _value.fromBalanceAfter
          : fromBalanceAfter // ignore: cast_nullable_to_non_nullable
              as num,
      toBalanceBefore: null == toBalanceBefore
          ? _value.toBalanceBefore
          : toBalanceBefore // ignore: cast_nullable_to_non_nullable
              as num,
      toBalanceAfter: null == toBalanceAfter
          ? _value.toBalanceAfter
          : toBalanceAfter // ignore: cast_nullable_to_non_nullable
              as num,
      currency: null == currency
          ? _value.currency
          : currency // ignore: cast_nullable_to_non_nullable
              as String,
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as num,
      createdTime: null == createdTime
          ? _value.createdTime
          : createdTime // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_WalletTransferHistoryModelCopyWith<$Res>
    implements $WalletTransferHistoryModelCopyWith<$Res> {
  factory _$$_WalletTransferHistoryModelCopyWith(
          _$_WalletTransferHistoryModel value,
          $Res Function(_$_WalletTransferHistoryModel) then) =
      __$$_WalletTransferHistoryModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {num id,
      String reference,
      @JsonKey(name: "in") bool incomne,
      String fromUsername,
      String toUsername,
      num fromBalanceBefore,
      num fromBalanceAfter,
      num toBalanceBefore,
      num toBalanceAfter,
      String currency,
      num amount,
      String createdTime});
}

/// @nodoc
class __$$_WalletTransferHistoryModelCopyWithImpl<$Res>
    extends _$WalletTransferHistoryModelCopyWithImpl<$Res,
        _$_WalletTransferHistoryModel>
    implements _$$_WalletTransferHistoryModelCopyWith<$Res> {
  __$$_WalletTransferHistoryModelCopyWithImpl(
      _$_WalletTransferHistoryModel _value,
      $Res Function(_$_WalletTransferHistoryModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? reference = null,
    Object? incomne = null,
    Object? fromUsername = null,
    Object? toUsername = null,
    Object? fromBalanceBefore = null,
    Object? fromBalanceAfter = null,
    Object? toBalanceBefore = null,
    Object? toBalanceAfter = null,
    Object? currency = null,
    Object? amount = null,
    Object? createdTime = null,
  }) {
    return _then(_$_WalletTransferHistoryModel(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as num,
      reference: null == reference
          ? _value.reference
          : reference // ignore: cast_nullable_to_non_nullable
              as String,
      incomne: null == incomne
          ? _value.incomne
          : incomne // ignore: cast_nullable_to_non_nullable
              as bool,
      fromUsername: null == fromUsername
          ? _value.fromUsername
          : fromUsername // ignore: cast_nullable_to_non_nullable
              as String,
      toUsername: null == toUsername
          ? _value.toUsername
          : toUsername // ignore: cast_nullable_to_non_nullable
              as String,
      fromBalanceBefore: null == fromBalanceBefore
          ? _value.fromBalanceBefore
          : fromBalanceBefore // ignore: cast_nullable_to_non_nullable
              as num,
      fromBalanceAfter: null == fromBalanceAfter
          ? _value.fromBalanceAfter
          : fromBalanceAfter // ignore: cast_nullable_to_non_nullable
              as num,
      toBalanceBefore: null == toBalanceBefore
          ? _value.toBalanceBefore
          : toBalanceBefore // ignore: cast_nullable_to_non_nullable
              as num,
      toBalanceAfter: null == toBalanceAfter
          ? _value.toBalanceAfter
          : toBalanceAfter // ignore: cast_nullable_to_non_nullable
              as num,
      currency: null == currency
          ? _value.currency
          : currency // ignore: cast_nullable_to_non_nullable
              as String,
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as num,
      createdTime: null == createdTime
          ? _value.createdTime
          : createdTime // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_WalletTransferHistoryModel implements _WalletTransferHistoryModel {
  const _$_WalletTransferHistoryModel(
      {required this.id,
      required this.reference,
      @JsonKey(name: "in") required this.incomne,
      required this.fromUsername,
      required this.toUsername,
      required this.fromBalanceBefore,
      required this.fromBalanceAfter,
      required this.toBalanceBefore,
      required this.toBalanceAfter,
      required this.currency,
      required this.amount,
      required this.createdTime});

  factory _$_WalletTransferHistoryModel.fromJson(Map<String, dynamic> json) =>
      _$$_WalletTransferHistoryModelFromJson(json);

  @override
  final num id;
  @override
  final String reference;
  @override
  @JsonKey(name: "in")
  final bool incomne;
  @override
  final String fromUsername;
  @override
  final String toUsername;
  @override
  final num fromBalanceBefore;
  @override
  final num fromBalanceAfter;
  @override
  final num toBalanceBefore;
  @override
  final num toBalanceAfter;
  @override
  final String currency;
  @override
  final num amount;
  @override
  final String createdTime;

  @override
  String toString() {
    return 'WalletTransferHistoryModel(id: $id, reference: $reference, incomne: $incomne, fromUsername: $fromUsername, toUsername: $toUsername, fromBalanceBefore: $fromBalanceBefore, fromBalanceAfter: $fromBalanceAfter, toBalanceBefore: $toBalanceBefore, toBalanceAfter: $toBalanceAfter, currency: $currency, amount: $amount, createdTime: $createdTime)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_WalletTransferHistoryModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.reference, reference) ||
                other.reference == reference) &&
            (identical(other.incomne, incomne) || other.incomne == incomne) &&
            (identical(other.fromUsername, fromUsername) ||
                other.fromUsername == fromUsername) &&
            (identical(other.toUsername, toUsername) ||
                other.toUsername == toUsername) &&
            (identical(other.fromBalanceBefore, fromBalanceBefore) ||
                other.fromBalanceBefore == fromBalanceBefore) &&
            (identical(other.fromBalanceAfter, fromBalanceAfter) ||
                other.fromBalanceAfter == fromBalanceAfter) &&
            (identical(other.toBalanceBefore, toBalanceBefore) ||
                other.toBalanceBefore == toBalanceBefore) &&
            (identical(other.toBalanceAfter, toBalanceAfter) ||
                other.toBalanceAfter == toBalanceAfter) &&
            (identical(other.currency, currency) ||
                other.currency == currency) &&
            (identical(other.amount, amount) || other.amount == amount) &&
            (identical(other.createdTime, createdTime) ||
                other.createdTime == createdTime));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      reference,
      incomne,
      fromUsername,
      toUsername,
      fromBalanceBefore,
      fromBalanceAfter,
      toBalanceBefore,
      toBalanceAfter,
      currency,
      amount,
      createdTime);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_WalletTransferHistoryModelCopyWith<_$_WalletTransferHistoryModel>
      get copyWith => __$$_WalletTransferHistoryModelCopyWithImpl<
          _$_WalletTransferHistoryModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_WalletTransferHistoryModelToJson(
      this,
    );
  }
}

abstract class _WalletTransferHistoryModel
    implements WalletTransferHistoryModel {
  const factory _WalletTransferHistoryModel(
      {required final num id,
      required final String reference,
      @JsonKey(name: "in") required final bool incomne,
      required final String fromUsername,
      required final String toUsername,
      required final num fromBalanceBefore,
      required final num fromBalanceAfter,
      required final num toBalanceBefore,
      required final num toBalanceAfter,
      required final String currency,
      required final num amount,
      required final String createdTime}) = _$_WalletTransferHistoryModel;

  factory _WalletTransferHistoryModel.fromJson(Map<String, dynamic> json) =
      _$_WalletTransferHistoryModel.fromJson;

  @override
  num get id;
  @override
  String get reference;
  @override
  @JsonKey(name: "in")
  bool get incomne;
  @override
  String get fromUsername;
  @override
  String get toUsername;
  @override
  num get fromBalanceBefore;
  @override
  num get fromBalanceAfter;
  @override
  num get toBalanceBefore;
  @override
  num get toBalanceAfter;
  @override
  String get currency;
  @override
  num get amount;
  @override
  String get createdTime;
  @override
  @JsonKey(ignore: true)
  _$$_WalletTransferHistoryModelCopyWith<_$_WalletTransferHistoryModel>
      get copyWith => throw _privateConstructorUsedError;
}

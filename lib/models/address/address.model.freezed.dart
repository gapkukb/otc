// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'address.model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

AddressModel _$AddressModelFromJson(Map<String, dynamic> json) {
  return _AddressModel.fromJson(json);
}

/// @nodoc
mixin _$AddressModel {
  String get title => throw _privateConstructorUsedError;
  String get remark => throw _privateConstructorUsedError;
  String get reference => throw _privateConstructorUsedError;
  String get username => throw _privateConstructorUsedError;
  String get wallet => throw _privateConstructorUsedError;
  Cryptocurrency get currency => throw _privateConstructorUsedError;
  BlockChain get blockchain => throw _privateConstructorUsedError;
  String get createdTime => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AddressModelCopyWith<AddressModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AddressModelCopyWith<$Res> {
  factory $AddressModelCopyWith(
          AddressModel value, $Res Function(AddressModel) then) =
      _$AddressModelCopyWithImpl<$Res, AddressModel>;
  @useResult
  $Res call(
      {String title,
      String remark,
      String reference,
      String username,
      String wallet,
      Cryptocurrency currency,
      BlockChain blockchain,
      String createdTime});
}

/// @nodoc
class _$AddressModelCopyWithImpl<$Res, $Val extends AddressModel>
    implements $AddressModelCopyWith<$Res> {
  _$AddressModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? remark = null,
    Object? reference = null,
    Object? username = null,
    Object? wallet = null,
    Object? currency = null,
    Object? blockchain = null,
    Object? createdTime = null,
  }) {
    return _then(_value.copyWith(
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      remark: null == remark
          ? _value.remark
          : remark // ignore: cast_nullable_to_non_nullable
              as String,
      reference: null == reference
          ? _value.reference
          : reference // ignore: cast_nullable_to_non_nullable
              as String,
      username: null == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String,
      wallet: null == wallet
          ? _value.wallet
          : wallet // ignore: cast_nullable_to_non_nullable
              as String,
      currency: null == currency
          ? _value.currency
          : currency // ignore: cast_nullable_to_non_nullable
              as Cryptocurrency,
      blockchain: null == blockchain
          ? _value.blockchain
          : blockchain // ignore: cast_nullable_to_non_nullable
              as BlockChain,
      createdTime: null == createdTime
          ? _value.createdTime
          : createdTime // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_AddressModelCopyWith<$Res>
    implements $AddressModelCopyWith<$Res> {
  factory _$$_AddressModelCopyWith(
          _$_AddressModel value, $Res Function(_$_AddressModel) then) =
      __$$_AddressModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String title,
      String remark,
      String reference,
      String username,
      String wallet,
      Cryptocurrency currency,
      BlockChain blockchain,
      String createdTime});
}

/// @nodoc
class __$$_AddressModelCopyWithImpl<$Res>
    extends _$AddressModelCopyWithImpl<$Res, _$_AddressModel>
    implements _$$_AddressModelCopyWith<$Res> {
  __$$_AddressModelCopyWithImpl(
      _$_AddressModel _value, $Res Function(_$_AddressModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? remark = null,
    Object? reference = null,
    Object? username = null,
    Object? wallet = null,
    Object? currency = null,
    Object? blockchain = null,
    Object? createdTime = null,
  }) {
    return _then(_$_AddressModel(
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      remark: null == remark
          ? _value.remark
          : remark // ignore: cast_nullable_to_non_nullable
              as String,
      reference: null == reference
          ? _value.reference
          : reference // ignore: cast_nullable_to_non_nullable
              as String,
      username: null == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String,
      wallet: null == wallet
          ? _value.wallet
          : wallet // ignore: cast_nullable_to_non_nullable
              as String,
      currency: null == currency
          ? _value.currency
          : currency // ignore: cast_nullable_to_non_nullable
              as Cryptocurrency,
      blockchain: null == blockchain
          ? _value.blockchain
          : blockchain // ignore: cast_nullable_to_non_nullable
              as BlockChain,
      createdTime: null == createdTime
          ? _value.createdTime
          : createdTime // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_AddressModel implements _AddressModel {
  const _$_AddressModel(
      {required this.title,
      required this.remark,
      required this.reference,
      required this.username,
      required this.wallet,
      required this.currency,
      required this.blockchain,
      required this.createdTime});

  factory _$_AddressModel.fromJson(Map<String, dynamic> json) =>
      _$$_AddressModelFromJson(json);

  @override
  final String title;
  @override
  final String remark;
  @override
  final String reference;
  @override
  final String username;
  @override
  final String wallet;
  @override
  final Cryptocurrency currency;
  @override
  final BlockChain blockchain;
  @override
  final String createdTime;

  @override
  String toString() {
    return 'AddressModel(title: $title, remark: $remark, reference: $reference, username: $username, wallet: $wallet, currency: $currency, blockchain: $blockchain, createdTime: $createdTime)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AddressModel &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.remark, remark) || other.remark == remark) &&
            (identical(other.reference, reference) ||
                other.reference == reference) &&
            (identical(other.username, username) ||
                other.username == username) &&
            (identical(other.wallet, wallet) || other.wallet == wallet) &&
            (identical(other.currency, currency) ||
                other.currency == currency) &&
            (identical(other.blockchain, blockchain) ||
                other.blockchain == blockchain) &&
            (identical(other.createdTime, createdTime) ||
                other.createdTime == createdTime));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, title, remark, reference,
      username, wallet, currency, blockchain, createdTime);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_AddressModelCopyWith<_$_AddressModel> get copyWith =>
      __$$_AddressModelCopyWithImpl<_$_AddressModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_AddressModelToJson(
      this,
    );
  }
}

abstract class _AddressModel implements AddressModel {
  const factory _AddressModel(
      {required final String title,
      required final String remark,
      required final String reference,
      required final String username,
      required final String wallet,
      required final Cryptocurrency currency,
      required final BlockChain blockchain,
      required final String createdTime}) = _$_AddressModel;

  factory _AddressModel.fromJson(Map<String, dynamic> json) =
      _$_AddressModel.fromJson;

  @override
  String get title;
  @override
  String get remark;
  @override
  String get reference;
  @override
  String get username;
  @override
  String get wallet;
  @override
  Cryptocurrency get currency;
  @override
  BlockChain get blockchain;
  @override
  String get createdTime;
  @override
  @JsonKey(ignore: true)
  _$$_AddressModelCopyWith<_$_AddressModel> get copyWith =>
      throw _privateConstructorUsedError;
}

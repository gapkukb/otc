// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'wallet.address.model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

WalletAddressModel _$WalletAddressModelFromJson(Map<String, dynamic> json) {
  return _WalletAddressModel.fromJson(json);
}

/// @nodoc
mixin _$WalletAddressModel {
  ///	唯一标识
  String get reference => throw _privateConstructorUsedError;

  ///	标题
  String get title => throw _privateConstructorUsedError;

  ///	用户名
  String get username => throw _privateConstructorUsedError;

  ///	内容
  String get content => throw _privateConstructorUsedError;

  ///	二维码账号
  String get account => throw _privateConstructorUsedError;

  ///	银行,可用值:BANK_CARD_TRANSFER,ALIPAY_TRANSFER,WECHAT_TRANSFER
  String get paymentMethod => throw _privateConstructorUsedError;

  ///	名字
  String get name => throw _privateConstructorUsedError;

  ///	是否默认使用
  bool get defaultUse => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $WalletAddressModelCopyWith<WalletAddressModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WalletAddressModelCopyWith<$Res> {
  factory $WalletAddressModelCopyWith(
          WalletAddressModel value, $Res Function(WalletAddressModel) then) =
      _$WalletAddressModelCopyWithImpl<$Res, WalletAddressModel>;
  @useResult
  $Res call(
      {String reference,
      String title,
      String username,
      String content,
      String account,
      String paymentMethod,
      String name,
      bool defaultUse});
}

/// @nodoc
class _$WalletAddressModelCopyWithImpl<$Res, $Val extends WalletAddressModel>
    implements $WalletAddressModelCopyWith<$Res> {
  _$WalletAddressModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? reference = null,
    Object? title = null,
    Object? username = null,
    Object? content = null,
    Object? account = null,
    Object? paymentMethod = null,
    Object? name = null,
    Object? defaultUse = null,
  }) {
    return _then(_value.copyWith(
      reference: null == reference
          ? _value.reference
          : reference // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      username: null == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String,
      content: null == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
      account: null == account
          ? _value.account
          : account // ignore: cast_nullable_to_non_nullable
              as String,
      paymentMethod: null == paymentMethod
          ? _value.paymentMethod
          : paymentMethod // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      defaultUse: null == defaultUse
          ? _value.defaultUse
          : defaultUse // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_WalletAddressModelCopyWith<$Res>
    implements $WalletAddressModelCopyWith<$Res> {
  factory _$$_WalletAddressModelCopyWith(_$_WalletAddressModel value,
          $Res Function(_$_WalletAddressModel) then) =
      __$$_WalletAddressModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String reference,
      String title,
      String username,
      String content,
      String account,
      String paymentMethod,
      String name,
      bool defaultUse});
}

/// @nodoc
class __$$_WalletAddressModelCopyWithImpl<$Res>
    extends _$WalletAddressModelCopyWithImpl<$Res, _$_WalletAddressModel>
    implements _$$_WalletAddressModelCopyWith<$Res> {
  __$$_WalletAddressModelCopyWithImpl(
      _$_WalletAddressModel _value, $Res Function(_$_WalletAddressModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? reference = null,
    Object? title = null,
    Object? username = null,
    Object? content = null,
    Object? account = null,
    Object? paymentMethod = null,
    Object? name = null,
    Object? defaultUse = null,
  }) {
    return _then(_$_WalletAddressModel(
      reference: null == reference
          ? _value.reference
          : reference // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      username: null == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String,
      content: null == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
      account: null == account
          ? _value.account
          : account // ignore: cast_nullable_to_non_nullable
              as String,
      paymentMethod: null == paymentMethod
          ? _value.paymentMethod
          : paymentMethod // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      defaultUse: null == defaultUse
          ? _value.defaultUse
          : defaultUse // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_WalletAddressModel implements _WalletAddressModel {
  const _$_WalletAddressModel(
      {required this.reference,
      required this.title,
      required this.username,
      required this.content,
      required this.account,
      required this.paymentMethod,
      required this.name,
      required this.defaultUse});

  factory _$_WalletAddressModel.fromJson(Map<String, dynamic> json) =>
      _$$_WalletAddressModelFromJson(json);

  ///	唯一标识
  @override
  final String reference;

  ///	标题
  @override
  final String title;

  ///	用户名
  @override
  final String username;

  ///	内容
  @override
  final String content;

  ///	二维码账号
  @override
  final String account;

  ///	银行,可用值:BANK_CARD_TRANSFER,ALIPAY_TRANSFER,WECHAT_TRANSFER
  @override
  final String paymentMethod;

  ///	名字
  @override
  final String name;

  ///	是否默认使用
  @override
  final bool defaultUse;

  @override
  String toString() {
    return 'WalletAddressModel(reference: $reference, title: $title, username: $username, content: $content, account: $account, paymentMethod: $paymentMethod, name: $name, defaultUse: $defaultUse)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_WalletAddressModel &&
            (identical(other.reference, reference) ||
                other.reference == reference) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.username, username) ||
                other.username == username) &&
            (identical(other.content, content) || other.content == content) &&
            (identical(other.account, account) || other.account == account) &&
            (identical(other.paymentMethod, paymentMethod) ||
                other.paymentMethod == paymentMethod) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.defaultUse, defaultUse) ||
                other.defaultUse == defaultUse));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, reference, title, username,
      content, account, paymentMethod, name, defaultUse);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_WalletAddressModelCopyWith<_$_WalletAddressModel> get copyWith =>
      __$$_WalletAddressModelCopyWithImpl<_$_WalletAddressModel>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_WalletAddressModelToJson(
      this,
    );
  }
}

abstract class _WalletAddressModel implements WalletAddressModel {
  const factory _WalletAddressModel(
      {required final String reference,
      required final String title,
      required final String username,
      required final String content,
      required final String account,
      required final String paymentMethod,
      required final String name,
      required final bool defaultUse}) = _$_WalletAddressModel;

  factory _WalletAddressModel.fromJson(Map<String, dynamic> json) =
      _$_WalletAddressModel.fromJson;

  @override

  ///	唯一标识
  String get reference;
  @override

  ///	标题
  String get title;
  @override

  ///	用户名
  String get username;
  @override

  ///	内容
  String get content;
  @override

  ///	二维码账号
  String get account;
  @override

  ///	银行,可用值:BANK_CARD_TRANSFER,ALIPAY_TRANSFER,WECHAT_TRANSFER
  String get paymentMethod;
  @override

  ///	名字
  String get name;
  @override

  ///	是否默认使用
  bool get defaultUse;
  @override
  @JsonKey(ignore: true)
  _$$_WalletAddressModelCopyWith<_$_WalletAddressModel> get copyWith =>
      throw _privateConstructorUsedError;
}

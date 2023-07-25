// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'wallet.qrcode.model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

WalletQrcodeModel _$WalletQrcodeModelFromJson(Map<String, dynamic> json) {
  return _WalletQrcodeModel.fromJson(json);
}

/// @nodoc
mixin _$WalletQrcodeModel {
  /// 唯一标识
  String get reference => throw _privateConstructorUsedError;

  /// 标题
  String get title => throw _privateConstructorUsedError;

  /// 用户名
  String get username => throw _privateConstructorUsedError;

  /// 内容
  String get content => throw _privateConstructorUsedError;

  /// 二维码账号
  String get account => throw _privateConstructorUsedError;

  /// 银行,可用值:
  PaymentMethods get paymentMethod => throw _privateConstructorUsedError;

  /// 名字
  String get name => throw _privateConstructorUsedError;

  /// 是否默认使用
  bool get defaultUse => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $WalletQrcodeModelCopyWith<WalletQrcodeModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WalletQrcodeModelCopyWith<$Res> {
  factory $WalletQrcodeModelCopyWith(
          WalletQrcodeModel value, $Res Function(WalletQrcodeModel) then) =
      _$WalletQrcodeModelCopyWithImpl<$Res, WalletQrcodeModel>;
  @useResult
  $Res call(
      {String reference,
      String title,
      String username,
      String content,
      String account,
      PaymentMethods paymentMethod,
      String name,
      bool defaultUse});
}

/// @nodoc
class _$WalletQrcodeModelCopyWithImpl<$Res, $Val extends WalletQrcodeModel>
    implements $WalletQrcodeModelCopyWith<$Res> {
  _$WalletQrcodeModelCopyWithImpl(this._value, this._then);

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
              as PaymentMethods,
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
abstract class _$$_WalletQrcodeModelCopyWith<$Res>
    implements $WalletQrcodeModelCopyWith<$Res> {
  factory _$$_WalletQrcodeModelCopyWith(_$_WalletQrcodeModel value,
          $Res Function(_$_WalletQrcodeModel) then) =
      __$$_WalletQrcodeModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String reference,
      String title,
      String username,
      String content,
      String account,
      PaymentMethods paymentMethod,
      String name,
      bool defaultUse});
}

/// @nodoc
class __$$_WalletQrcodeModelCopyWithImpl<$Res>
    extends _$WalletQrcodeModelCopyWithImpl<$Res, _$_WalletQrcodeModel>
    implements _$$_WalletQrcodeModelCopyWith<$Res> {
  __$$_WalletQrcodeModelCopyWithImpl(
      _$_WalletQrcodeModel _value, $Res Function(_$_WalletQrcodeModel) _then)
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
    return _then(_$_WalletQrcodeModel(
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
              as PaymentMethods,
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
class _$_WalletQrcodeModel implements _WalletQrcodeModel {
  const _$_WalletQrcodeModel(
      {required this.reference,
      required this.title,
      required this.username,
      required this.content,
      required this.account,
      required this.paymentMethod,
      required this.name,
      required this.defaultUse});

  factory _$_WalletQrcodeModel.fromJson(Map<String, dynamic> json) =>
      _$$_WalletQrcodeModelFromJson(json);

  /// 唯一标识
  @override
  final String reference;

  /// 标题
  @override
  final String title;

  /// 用户名
  @override
  final String username;

  /// 内容
  @override
  final String content;

  /// 二维码账号
  @override
  final String account;

  /// 银行,可用值:
  @override
  final PaymentMethods paymentMethod;

  /// 名字
  @override
  final String name;

  /// 是否默认使用
  @override
  final bool defaultUse;

  @override
  String toString() {
    return 'WalletQrcodeModel(reference: $reference, title: $title, username: $username, content: $content, account: $account, paymentMethod: $paymentMethod, name: $name, defaultUse: $defaultUse)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_WalletQrcodeModel &&
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
  _$$_WalletQrcodeModelCopyWith<_$_WalletQrcodeModel> get copyWith =>
      __$$_WalletQrcodeModelCopyWithImpl<_$_WalletQrcodeModel>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_WalletQrcodeModelToJson(
      this,
    );
  }
}

abstract class _WalletQrcodeModel implements WalletQrcodeModel {
  const factory _WalletQrcodeModel(
      {required final String reference,
      required final String title,
      required final String username,
      required final String content,
      required final String account,
      required final PaymentMethods paymentMethod,
      required final String name,
      required final bool defaultUse}) = _$_WalletQrcodeModel;

  factory _WalletQrcodeModel.fromJson(Map<String, dynamic> json) =
      _$_WalletQrcodeModel.fromJson;

  @override

  /// 唯一标识
  String get reference;
  @override

  /// 标题
  String get title;
  @override

  /// 用户名
  String get username;
  @override

  /// 内容
  String get content;
  @override

  /// 二维码账号
  String get account;
  @override

  /// 银行,可用值:
  PaymentMethods get paymentMethod;
  @override

  /// 名字
  String get name;
  @override

  /// 是否默认使用
  bool get defaultUse;
  @override
  @JsonKey(ignore: true)
  _$$_WalletQrcodeModelCopyWith<_$_WalletQrcodeModel> get copyWith =>
      throw _privateConstructorUsedError;
}

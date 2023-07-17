// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'wallet.bank.model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

WalletBankModel _$WalletBankModelFromJson(Map<String, dynamic> json) {
  return _WalletBankModel.fromJson(json);
}

/// @nodoc
mixin _$WalletBankModel {
  /// 	唯一标识
  String get reference => throw _privateConstructorUsedError;

  /// 	标题
  String get title => throw _privateConstructorUsedError;

  /// 	用户名
  String get username => throw _privateConstructorUsedError;

  /// 	银行卡号
  String get cardNumber => throw _privateConstructorUsedError;

  /// 	银行卡户主名
  String get account => throw _privateConstructorUsedError;

  /// 	银行,可用值:CMB,ICBC,BOCOM,CCB,ABC,CEB,CMBC,PAB,SPDB,CIB,BOCSH,CITIC,BOB,NJCB,GDB,HXBC,PSBC,SDB,BEA,BOS,HSB,ZSB,BJAB,HZBC,NBBC,HBNNX,HKBC,NEBC,GDNX,GXNX,GZNX,HANNX,HENNX,HLJNX,EBCL,HBNX,HNNX,ZJNX,CQSB,QLSB,QHNX,SDNX,YKSB,YNNX,CSBC,SXNX,SHXNX,SRCB,JSBC,JXNX,JJBC,NYSBC,NMNX,LNNX,SCNX,BRCB,FJNX,GSNX,BSBC
  String get bank => throw _privateConstructorUsedError;

  /// 	支行地址
  String get bankBranch => throw _privateConstructorUsedError;

  /// 	是否默认使用
  bool get defaultUsed => throw _privateConstructorUsedError;

  /// 	户主名
  String get name => throw _privateConstructorUsedError;

  /// 	是否禁用
  bool get disabled => throw _privateConstructorUsedError;

  ///
  String get createdTime => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $WalletBankModelCopyWith<WalletBankModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WalletBankModelCopyWith<$Res> {
  factory $WalletBankModelCopyWith(
          WalletBankModel value, $Res Function(WalletBankModel) then) =
      _$WalletBankModelCopyWithImpl<$Res, WalletBankModel>;
  @useResult
  $Res call(
      {String reference,
      String title,
      String username,
      String cardNumber,
      String account,
      String bank,
      String bankBranch,
      bool defaultUsed,
      String name,
      bool disabled,
      String createdTime});
}

/// @nodoc
class _$WalletBankModelCopyWithImpl<$Res, $Val extends WalletBankModel>
    implements $WalletBankModelCopyWith<$Res> {
  _$WalletBankModelCopyWithImpl(this._value, this._then);

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
    Object? cardNumber = null,
    Object? account = null,
    Object? bank = null,
    Object? bankBranch = null,
    Object? defaultUsed = null,
    Object? name = null,
    Object? disabled = null,
    Object? createdTime = null,
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
      cardNumber: null == cardNumber
          ? _value.cardNumber
          : cardNumber // ignore: cast_nullable_to_non_nullable
              as String,
      account: null == account
          ? _value.account
          : account // ignore: cast_nullable_to_non_nullable
              as String,
      bank: null == bank
          ? _value.bank
          : bank // ignore: cast_nullable_to_non_nullable
              as String,
      bankBranch: null == bankBranch
          ? _value.bankBranch
          : bankBranch // ignore: cast_nullable_to_non_nullable
              as String,
      defaultUsed: null == defaultUsed
          ? _value.defaultUsed
          : defaultUsed // ignore: cast_nullable_to_non_nullable
              as bool,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      disabled: null == disabled
          ? _value.disabled
          : disabled // ignore: cast_nullable_to_non_nullable
              as bool,
      createdTime: null == createdTime
          ? _value.createdTime
          : createdTime // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_WalletBankModelCopyWith<$Res>
    implements $WalletBankModelCopyWith<$Res> {
  factory _$$_WalletBankModelCopyWith(
          _$_WalletBankModel value, $Res Function(_$_WalletBankModel) then) =
      __$$_WalletBankModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String reference,
      String title,
      String username,
      String cardNumber,
      String account,
      String bank,
      String bankBranch,
      bool defaultUsed,
      String name,
      bool disabled,
      String createdTime});
}

/// @nodoc
class __$$_WalletBankModelCopyWithImpl<$Res>
    extends _$WalletBankModelCopyWithImpl<$Res, _$_WalletBankModel>
    implements _$$_WalletBankModelCopyWith<$Res> {
  __$$_WalletBankModelCopyWithImpl(
      _$_WalletBankModel _value, $Res Function(_$_WalletBankModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? reference = null,
    Object? title = null,
    Object? username = null,
    Object? cardNumber = null,
    Object? account = null,
    Object? bank = null,
    Object? bankBranch = null,
    Object? defaultUsed = null,
    Object? name = null,
    Object? disabled = null,
    Object? createdTime = null,
  }) {
    return _then(_$_WalletBankModel(
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
      cardNumber: null == cardNumber
          ? _value.cardNumber
          : cardNumber // ignore: cast_nullable_to_non_nullable
              as String,
      account: null == account
          ? _value.account
          : account // ignore: cast_nullable_to_non_nullable
              as String,
      bank: null == bank
          ? _value.bank
          : bank // ignore: cast_nullable_to_non_nullable
              as String,
      bankBranch: null == bankBranch
          ? _value.bankBranch
          : bankBranch // ignore: cast_nullable_to_non_nullable
              as String,
      defaultUsed: null == defaultUsed
          ? _value.defaultUsed
          : defaultUsed // ignore: cast_nullable_to_non_nullable
              as bool,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      disabled: null == disabled
          ? _value.disabled
          : disabled // ignore: cast_nullable_to_non_nullable
              as bool,
      createdTime: null == createdTime
          ? _value.createdTime
          : createdTime // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_WalletBankModel implements _WalletBankModel {
  const _$_WalletBankModel(
      {required this.reference,
      required this.title,
      required this.username,
      required this.cardNumber,
      required this.account,
      required this.bank,
      required this.bankBranch,
      required this.defaultUsed,
      required this.name,
      required this.disabled,
      required this.createdTime});

  factory _$_WalletBankModel.fromJson(Map<String, dynamic> json) =>
      _$$_WalletBankModelFromJson(json);

  /// 	唯一标识
  @override
  final String reference;

  /// 	标题
  @override
  final String title;

  /// 	用户名
  @override
  final String username;

  /// 	银行卡号
  @override
  final String cardNumber;

  /// 	银行卡户主名
  @override
  final String account;

  /// 	银行,可用值:CMB,ICBC,BOCOM,CCB,ABC,CEB,CMBC,PAB,SPDB,CIB,BOCSH,CITIC,BOB,NJCB,GDB,HXBC,PSBC,SDB,BEA,BOS,HSB,ZSB,BJAB,HZBC,NBBC,HBNNX,HKBC,NEBC,GDNX,GXNX,GZNX,HANNX,HENNX,HLJNX,EBCL,HBNX,HNNX,ZJNX,CQSB,QLSB,QHNX,SDNX,YKSB,YNNX,CSBC,SXNX,SHXNX,SRCB,JSBC,JXNX,JJBC,NYSBC,NMNX,LNNX,SCNX,BRCB,FJNX,GSNX,BSBC
  @override
  final String bank;

  /// 	支行地址
  @override
  final String bankBranch;

  /// 	是否默认使用
  @override
  final bool defaultUsed;

  /// 	户主名
  @override
  final String name;

  /// 	是否禁用
  @override
  final bool disabled;

  ///
  @override
  final String createdTime;

  @override
  String toString() {
    return 'WalletBankModel(reference: $reference, title: $title, username: $username, cardNumber: $cardNumber, account: $account, bank: $bank, bankBranch: $bankBranch, defaultUsed: $defaultUsed, name: $name, disabled: $disabled, createdTime: $createdTime)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_WalletBankModel &&
            (identical(other.reference, reference) ||
                other.reference == reference) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.username, username) ||
                other.username == username) &&
            (identical(other.cardNumber, cardNumber) ||
                other.cardNumber == cardNumber) &&
            (identical(other.account, account) || other.account == account) &&
            (identical(other.bank, bank) || other.bank == bank) &&
            (identical(other.bankBranch, bankBranch) ||
                other.bankBranch == bankBranch) &&
            (identical(other.defaultUsed, defaultUsed) ||
                other.defaultUsed == defaultUsed) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.disabled, disabled) ||
                other.disabled == disabled) &&
            (identical(other.createdTime, createdTime) ||
                other.createdTime == createdTime));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      reference,
      title,
      username,
      cardNumber,
      account,
      bank,
      bankBranch,
      defaultUsed,
      name,
      disabled,
      createdTime);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_WalletBankModelCopyWith<_$_WalletBankModel> get copyWith =>
      __$$_WalletBankModelCopyWithImpl<_$_WalletBankModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_WalletBankModelToJson(
      this,
    );
  }
}

abstract class _WalletBankModel implements WalletBankModel {
  const factory _WalletBankModel(
      {required final String reference,
      required final String title,
      required final String username,
      required final String cardNumber,
      required final String account,
      required final String bank,
      required final String bankBranch,
      required final bool defaultUsed,
      required final String name,
      required final bool disabled,
      required final String createdTime}) = _$_WalletBankModel;

  factory _WalletBankModel.fromJson(Map<String, dynamic> json) =
      _$_WalletBankModel.fromJson;

  @override

  /// 	唯一标识
  String get reference;
  @override

  /// 	标题
  String get title;
  @override

  /// 	用户名
  String get username;
  @override

  /// 	银行卡号
  String get cardNumber;
  @override

  /// 	银行卡户主名
  String get account;
  @override

  /// 	银行,可用值:CMB,ICBC,BOCOM,CCB,ABC,CEB,CMBC,PAB,SPDB,CIB,BOCSH,CITIC,BOB,NJCB,GDB,HXBC,PSBC,SDB,BEA,BOS,HSB,ZSB,BJAB,HZBC,NBBC,HBNNX,HKBC,NEBC,GDNX,GXNX,GZNX,HANNX,HENNX,HLJNX,EBCL,HBNX,HNNX,ZJNX,CQSB,QLSB,QHNX,SDNX,YKSB,YNNX,CSBC,SXNX,SHXNX,SRCB,JSBC,JXNX,JJBC,NYSBC,NMNX,LNNX,SCNX,BRCB,FJNX,GSNX,BSBC
  String get bank;
  @override

  /// 	支行地址
  String get bankBranch;
  @override

  /// 	是否默认使用
  bool get defaultUsed;
  @override

  /// 	户主名
  String get name;
  @override

  /// 	是否禁用
  bool get disabled;
  @override

  ///
  String get createdTime;
  @override
  @JsonKey(ignore: true)
  _$$_WalletBankModelCopyWith<_$_WalletBankModel> get copyWith =>
      throw _privateConstructorUsedError;
}

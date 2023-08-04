// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'ad.my.channel.model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

AdMyChannleModel _$AdMyChannleModelFromJson(Map<String, dynamic> json) {
  return _AdMyChannleModel.fromJson(json);
}

/// @nodoc
mixin _$AdMyChannleModel {
  /// 	做市订单号
  String get makerDealReference => throw _privateConstructorUsedError;

  /// 	订单号
  String get reference => throw _privateConstructorUsedError;

  /// 	支付类型,可用值:BANK_CARD_TRANSFER,ALIPAY_TRANSFER,WECHAT_TRANSFER
  @JsonEnum(valueField: "value")
  PaymentMethods get paymentMethod => throw _privateConstructorUsedError;

  /// 	当时的标题
  String get title => throw _privateConstructorUsedError;

  /// 	最小收付
  num get amountMin => throw _privateConstructorUsedError;

  /// 	最大收付
  num get amountMax => throw _privateConstructorUsedError;

  /// 	收付渠道
  String get channelReference => throw _privateConstructorUsedError;

  /// 	收付标题
  String get channelTitle => throw _privateConstructorUsedError;

  /// 	收付账号
  String get channelAccount => throw _privateConstructorUsedError;

  /// 	收付户主
  String get channelName => throw _privateConstructorUsedError;

  /// 	启用中
  bool get enabled => throw _privateConstructorUsedError;

  /// 	创建时间
  String get createdTime => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AdMyChannleModelCopyWith<AdMyChannleModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AdMyChannleModelCopyWith<$Res> {
  factory $AdMyChannleModelCopyWith(
          AdMyChannleModel value, $Res Function(AdMyChannleModel) then) =
      _$AdMyChannleModelCopyWithImpl<$Res, AdMyChannleModel>;
  @useResult
  $Res call(
      {String makerDealReference,
      String reference,
      @JsonEnum(valueField: "value") PaymentMethods paymentMethod,
      String title,
      num amountMin,
      num amountMax,
      String channelReference,
      String channelTitle,
      String channelAccount,
      String channelName,
      bool enabled,
      String createdTime});
}

/// @nodoc
class _$AdMyChannleModelCopyWithImpl<$Res, $Val extends AdMyChannleModel>
    implements $AdMyChannleModelCopyWith<$Res> {
  _$AdMyChannleModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? makerDealReference = null,
    Object? reference = null,
    Object? paymentMethod = null,
    Object? title = null,
    Object? amountMin = null,
    Object? amountMax = null,
    Object? channelReference = null,
    Object? channelTitle = null,
    Object? channelAccount = null,
    Object? channelName = null,
    Object? enabled = null,
    Object? createdTime = null,
  }) {
    return _then(_value.copyWith(
      makerDealReference: null == makerDealReference
          ? _value.makerDealReference
          : makerDealReference // ignore: cast_nullable_to_non_nullable
              as String,
      reference: null == reference
          ? _value.reference
          : reference // ignore: cast_nullable_to_non_nullable
              as String,
      paymentMethod: null == paymentMethod
          ? _value.paymentMethod
          : paymentMethod // ignore: cast_nullable_to_non_nullable
              as PaymentMethods,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      amountMin: null == amountMin
          ? _value.amountMin
          : amountMin // ignore: cast_nullable_to_non_nullable
              as num,
      amountMax: null == amountMax
          ? _value.amountMax
          : amountMax // ignore: cast_nullable_to_non_nullable
              as num,
      channelReference: null == channelReference
          ? _value.channelReference
          : channelReference // ignore: cast_nullable_to_non_nullable
              as String,
      channelTitle: null == channelTitle
          ? _value.channelTitle
          : channelTitle // ignore: cast_nullable_to_non_nullable
              as String,
      channelAccount: null == channelAccount
          ? _value.channelAccount
          : channelAccount // ignore: cast_nullable_to_non_nullable
              as String,
      channelName: null == channelName
          ? _value.channelName
          : channelName // ignore: cast_nullable_to_non_nullable
              as String,
      enabled: null == enabled
          ? _value.enabled
          : enabled // ignore: cast_nullable_to_non_nullable
              as bool,
      createdTime: null == createdTime
          ? _value.createdTime
          : createdTime // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_AdMyChannleModelCopyWith<$Res>
    implements $AdMyChannleModelCopyWith<$Res> {
  factory _$$_AdMyChannleModelCopyWith(
          _$_AdMyChannleModel value, $Res Function(_$_AdMyChannleModel) then) =
      __$$_AdMyChannleModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String makerDealReference,
      String reference,
      @JsonEnum(valueField: "value") PaymentMethods paymentMethod,
      String title,
      num amountMin,
      num amountMax,
      String channelReference,
      String channelTitle,
      String channelAccount,
      String channelName,
      bool enabled,
      String createdTime});
}

/// @nodoc
class __$$_AdMyChannleModelCopyWithImpl<$Res>
    extends _$AdMyChannleModelCopyWithImpl<$Res, _$_AdMyChannleModel>
    implements _$$_AdMyChannleModelCopyWith<$Res> {
  __$$_AdMyChannleModelCopyWithImpl(
      _$_AdMyChannleModel _value, $Res Function(_$_AdMyChannleModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? makerDealReference = null,
    Object? reference = null,
    Object? paymentMethod = null,
    Object? title = null,
    Object? amountMin = null,
    Object? amountMax = null,
    Object? channelReference = null,
    Object? channelTitle = null,
    Object? channelAccount = null,
    Object? channelName = null,
    Object? enabled = null,
    Object? createdTime = null,
  }) {
    return _then(_$_AdMyChannleModel(
      makerDealReference: null == makerDealReference
          ? _value.makerDealReference
          : makerDealReference // ignore: cast_nullable_to_non_nullable
              as String,
      reference: null == reference
          ? _value.reference
          : reference // ignore: cast_nullable_to_non_nullable
              as String,
      paymentMethod: null == paymentMethod
          ? _value.paymentMethod
          : paymentMethod // ignore: cast_nullable_to_non_nullable
              as PaymentMethods,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      amountMin: null == amountMin
          ? _value.amountMin
          : amountMin // ignore: cast_nullable_to_non_nullable
              as num,
      amountMax: null == amountMax
          ? _value.amountMax
          : amountMax // ignore: cast_nullable_to_non_nullable
              as num,
      channelReference: null == channelReference
          ? _value.channelReference
          : channelReference // ignore: cast_nullable_to_non_nullable
              as String,
      channelTitle: null == channelTitle
          ? _value.channelTitle
          : channelTitle // ignore: cast_nullable_to_non_nullable
              as String,
      channelAccount: null == channelAccount
          ? _value.channelAccount
          : channelAccount // ignore: cast_nullable_to_non_nullable
              as String,
      channelName: null == channelName
          ? _value.channelName
          : channelName // ignore: cast_nullable_to_non_nullable
              as String,
      enabled: null == enabled
          ? _value.enabled
          : enabled // ignore: cast_nullable_to_non_nullable
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
class _$_AdMyChannleModel implements _AdMyChannleModel {
  const _$_AdMyChannleModel(
      {required this.makerDealReference,
      required this.reference,
      @JsonEnum(valueField: "value") required this.paymentMethod,
      required this.title,
      required this.amountMin,
      required this.amountMax,
      required this.channelReference,
      required this.channelTitle,
      required this.channelAccount,
      required this.channelName,
      required this.enabled,
      required this.createdTime});

  factory _$_AdMyChannleModel.fromJson(Map<String, dynamic> json) =>
      _$$_AdMyChannleModelFromJson(json);

  /// 	做市订单号
  @override
  final String makerDealReference;

  /// 	订单号
  @override
  final String reference;

  /// 	支付类型,可用值:BANK_CARD_TRANSFER,ALIPAY_TRANSFER,WECHAT_TRANSFER
  @override
  @JsonEnum(valueField: "value")
  final PaymentMethods paymentMethod;

  /// 	当时的标题
  @override
  final String title;

  /// 	最小收付
  @override
  final num amountMin;

  /// 	最大收付
  @override
  final num amountMax;

  /// 	收付渠道
  @override
  final String channelReference;

  /// 	收付标题
  @override
  final String channelTitle;

  /// 	收付账号
  @override
  final String channelAccount;

  /// 	收付户主
  @override
  final String channelName;

  /// 	启用中
  @override
  final bool enabled;

  /// 	创建时间
  @override
  final String createdTime;

  @override
  String toString() {
    return 'AdMyChannleModel(makerDealReference: $makerDealReference, reference: $reference, paymentMethod: $paymentMethod, title: $title, amountMin: $amountMin, amountMax: $amountMax, channelReference: $channelReference, channelTitle: $channelTitle, channelAccount: $channelAccount, channelName: $channelName, enabled: $enabled, createdTime: $createdTime)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AdMyChannleModel &&
            (identical(other.makerDealReference, makerDealReference) ||
                other.makerDealReference == makerDealReference) &&
            (identical(other.reference, reference) ||
                other.reference == reference) &&
            (identical(other.paymentMethod, paymentMethod) ||
                other.paymentMethod == paymentMethod) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.amountMin, amountMin) ||
                other.amountMin == amountMin) &&
            (identical(other.amountMax, amountMax) ||
                other.amountMax == amountMax) &&
            (identical(other.channelReference, channelReference) ||
                other.channelReference == channelReference) &&
            (identical(other.channelTitle, channelTitle) ||
                other.channelTitle == channelTitle) &&
            (identical(other.channelAccount, channelAccount) ||
                other.channelAccount == channelAccount) &&
            (identical(other.channelName, channelName) ||
                other.channelName == channelName) &&
            (identical(other.enabled, enabled) || other.enabled == enabled) &&
            (identical(other.createdTime, createdTime) ||
                other.createdTime == createdTime));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      makerDealReference,
      reference,
      paymentMethod,
      title,
      amountMin,
      amountMax,
      channelReference,
      channelTitle,
      channelAccount,
      channelName,
      enabled,
      createdTime);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_AdMyChannleModelCopyWith<_$_AdMyChannleModel> get copyWith =>
      __$$_AdMyChannleModelCopyWithImpl<_$_AdMyChannleModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_AdMyChannleModelToJson(
      this,
    );
  }
}

abstract class _AdMyChannleModel implements AdMyChannleModel {
  const factory _AdMyChannleModel(
      {required final String makerDealReference,
      required final String reference,
      @JsonEnum(valueField: "value")
          required final PaymentMethods paymentMethod,
      required final String title,
      required final num amountMin,
      required final num amountMax,
      required final String channelReference,
      required final String channelTitle,
      required final String channelAccount,
      required final String channelName,
      required final bool enabled,
      required final String createdTime}) = _$_AdMyChannleModel;

  factory _AdMyChannleModel.fromJson(Map<String, dynamic> json) =
      _$_AdMyChannleModel.fromJson;

  @override

  /// 	做市订单号
  String get makerDealReference;
  @override

  /// 	订单号
  String get reference;
  @override

  /// 	支付类型,可用值:BANK_CARD_TRANSFER,ALIPAY_TRANSFER,WECHAT_TRANSFER
  @JsonEnum(valueField: "value")
  PaymentMethods get paymentMethod;
  @override

  /// 	当时的标题
  String get title;
  @override

  /// 	最小收付
  num get amountMin;
  @override

  /// 	最大收付
  num get amountMax;
  @override

  /// 	收付渠道
  String get channelReference;
  @override

  /// 	收付标题
  String get channelTitle;
  @override

  /// 	收付账号
  String get channelAccount;
  @override

  /// 	收付户主
  String get channelName;
  @override

  /// 	启用中
  bool get enabled;
  @override

  /// 	创建时间
  String get createdTime;
  @override
  @JsonKey(ignore: true)
  _$$_AdMyChannleModelCopyWith<_$_AdMyChannleModel> get copyWith =>
      throw _privateConstructorUsedError;
}

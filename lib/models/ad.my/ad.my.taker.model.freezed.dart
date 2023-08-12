// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'ad.my.taker.model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

AdMyTakerModel _$AdMyTakerModelFromJson(Map<String, dynamic> json) {
  return _AdMyTakerModel.fromJson(json);
}

/// @nodoc
mixin _$AdMyTakerModel {
  ///
  String get reference => throw _privateConstructorUsedError;

  ///
  String get makerReference => throw _privateConstructorUsedError;

  ///
  String get makerChannelReference => throw _privateConstructorUsedError;

  ///
  String get merchantCode => throw _privateConstructorUsedError;
  String? get overTime => throw _privateConstructorUsedError;
  int get overTimeSeconds => throw _privateConstructorUsedError;

  ///
  bool get sell => throw _privateConstructorUsedError;

  /// 	可用值:CNY,USD,USDT,BTC,TRX,BNB,ETH
  String get coin => throw _privateConstructorUsedError;

  ///
  num get coinAmount => throw _privateConstructorUsedError;

  ///
  String get makerUsername => throw _privateConstructorUsedError;
  String? get takerAccountName => throw _privateConstructorUsedError;

  ///
  String get takerUsername => throw _privateConstructorUsedError;

  /// 	可用值:BANK_CARD_TRANSFER,ALIPAY_TRANSFER,WECHAT_TRANSFER
  String get paymentMethod => throw _privateConstructorUsedError;

  /// 	可用值:PENDING,NOTIFIED,PAID,BLOCKING,CANCELED
  String get state => throw _privateConstructorUsedError;

  /// 	可用值:NORMAL,STAR
  String get orderLevel => throw _privateConstructorUsedError;

  ///
  String get makerPaymentAccount => throw _privateConstructorUsedError;

  ///
  String get takerPaymentAccount => throw _privateConstructorUsedError;

  ///
  num get moneyAmount => throw _privateConstructorUsedError;

  /// 	可用值:CNY,USD,USDT,BTC,TRX,BNB,ETH
  String get money => throw _privateConstructorUsedError;

  ///
  num get rate => throw _privateConstructorUsedError;

  ///
  String? get notifyAt => throw _privateConstructorUsedError;

  ///
  int? get notifyTimes => throw _privateConstructorUsedError;

  ///
  String? get confirmAt => throw _privateConstructorUsedError;

  ///
  int? get confirmTimes => throw _privateConstructorUsedError;

  ///
  num? get commission => throw _privateConstructorUsedError;

  ///
  String get createdTime => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AdMyTakerModelCopyWith<AdMyTakerModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AdMyTakerModelCopyWith<$Res> {
  factory $AdMyTakerModelCopyWith(
          AdMyTakerModel value, $Res Function(AdMyTakerModel) then) =
      _$AdMyTakerModelCopyWithImpl<$Res, AdMyTakerModel>;
  @useResult
  $Res call(
      {String reference,
      String makerReference,
      String makerChannelReference,
      String merchantCode,
      String? overTime,
      int overTimeSeconds,
      bool sell,
      String coin,
      num coinAmount,
      String makerUsername,
      String? takerAccountName,
      String takerUsername,
      String paymentMethod,
      String state,
      String orderLevel,
      String makerPaymentAccount,
      String takerPaymentAccount,
      num moneyAmount,
      String money,
      num rate,
      String? notifyAt,
      int? notifyTimes,
      String? confirmAt,
      int? confirmTimes,
      num? commission,
      String createdTime});
}

/// @nodoc
class _$AdMyTakerModelCopyWithImpl<$Res, $Val extends AdMyTakerModel>
    implements $AdMyTakerModelCopyWith<$Res> {
  _$AdMyTakerModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? reference = null,
    Object? makerReference = null,
    Object? makerChannelReference = null,
    Object? merchantCode = null,
    Object? overTime = freezed,
    Object? overTimeSeconds = null,
    Object? sell = null,
    Object? coin = null,
    Object? coinAmount = null,
    Object? makerUsername = null,
    Object? takerAccountName = freezed,
    Object? takerUsername = null,
    Object? paymentMethod = null,
    Object? state = null,
    Object? orderLevel = null,
    Object? makerPaymentAccount = null,
    Object? takerPaymentAccount = null,
    Object? moneyAmount = null,
    Object? money = null,
    Object? rate = null,
    Object? notifyAt = freezed,
    Object? notifyTimes = freezed,
    Object? confirmAt = freezed,
    Object? confirmTimes = freezed,
    Object? commission = freezed,
    Object? createdTime = null,
  }) {
    return _then(_value.copyWith(
      reference: null == reference
          ? _value.reference
          : reference // ignore: cast_nullable_to_non_nullable
              as String,
      makerReference: null == makerReference
          ? _value.makerReference
          : makerReference // ignore: cast_nullable_to_non_nullable
              as String,
      makerChannelReference: null == makerChannelReference
          ? _value.makerChannelReference
          : makerChannelReference // ignore: cast_nullable_to_non_nullable
              as String,
      merchantCode: null == merchantCode
          ? _value.merchantCode
          : merchantCode // ignore: cast_nullable_to_non_nullable
              as String,
      overTime: freezed == overTime
          ? _value.overTime
          : overTime // ignore: cast_nullable_to_non_nullable
              as String?,
      overTimeSeconds: null == overTimeSeconds
          ? _value.overTimeSeconds
          : overTimeSeconds // ignore: cast_nullable_to_non_nullable
              as int,
      sell: null == sell
          ? _value.sell
          : sell // ignore: cast_nullable_to_non_nullable
              as bool,
      coin: null == coin
          ? _value.coin
          : coin // ignore: cast_nullable_to_non_nullable
              as String,
      coinAmount: null == coinAmount
          ? _value.coinAmount
          : coinAmount // ignore: cast_nullable_to_non_nullable
              as num,
      makerUsername: null == makerUsername
          ? _value.makerUsername
          : makerUsername // ignore: cast_nullable_to_non_nullable
              as String,
      takerAccountName: freezed == takerAccountName
          ? _value.takerAccountName
          : takerAccountName // ignore: cast_nullable_to_non_nullable
              as String?,
      takerUsername: null == takerUsername
          ? _value.takerUsername
          : takerUsername // ignore: cast_nullable_to_non_nullable
              as String,
      paymentMethod: null == paymentMethod
          ? _value.paymentMethod
          : paymentMethod // ignore: cast_nullable_to_non_nullable
              as String,
      state: null == state
          ? _value.state
          : state // ignore: cast_nullable_to_non_nullable
              as String,
      orderLevel: null == orderLevel
          ? _value.orderLevel
          : orderLevel // ignore: cast_nullable_to_non_nullable
              as String,
      makerPaymentAccount: null == makerPaymentAccount
          ? _value.makerPaymentAccount
          : makerPaymentAccount // ignore: cast_nullable_to_non_nullable
              as String,
      takerPaymentAccount: null == takerPaymentAccount
          ? _value.takerPaymentAccount
          : takerPaymentAccount // ignore: cast_nullable_to_non_nullable
              as String,
      moneyAmount: null == moneyAmount
          ? _value.moneyAmount
          : moneyAmount // ignore: cast_nullable_to_non_nullable
              as num,
      money: null == money
          ? _value.money
          : money // ignore: cast_nullable_to_non_nullable
              as String,
      rate: null == rate
          ? _value.rate
          : rate // ignore: cast_nullable_to_non_nullable
              as num,
      notifyAt: freezed == notifyAt
          ? _value.notifyAt
          : notifyAt // ignore: cast_nullable_to_non_nullable
              as String?,
      notifyTimes: freezed == notifyTimes
          ? _value.notifyTimes
          : notifyTimes // ignore: cast_nullable_to_non_nullable
              as int?,
      confirmAt: freezed == confirmAt
          ? _value.confirmAt
          : confirmAt // ignore: cast_nullable_to_non_nullable
              as String?,
      confirmTimes: freezed == confirmTimes
          ? _value.confirmTimes
          : confirmTimes // ignore: cast_nullable_to_non_nullable
              as int?,
      commission: freezed == commission
          ? _value.commission
          : commission // ignore: cast_nullable_to_non_nullable
              as num?,
      createdTime: null == createdTime
          ? _value.createdTime
          : createdTime // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_AdMyTakerModelCopyWith<$Res>
    implements $AdMyTakerModelCopyWith<$Res> {
  factory _$$_AdMyTakerModelCopyWith(
          _$_AdMyTakerModel value, $Res Function(_$_AdMyTakerModel) then) =
      __$$_AdMyTakerModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String reference,
      String makerReference,
      String makerChannelReference,
      String merchantCode,
      String? overTime,
      int overTimeSeconds,
      bool sell,
      String coin,
      num coinAmount,
      String makerUsername,
      String? takerAccountName,
      String takerUsername,
      String paymentMethod,
      String state,
      String orderLevel,
      String makerPaymentAccount,
      String takerPaymentAccount,
      num moneyAmount,
      String money,
      num rate,
      String? notifyAt,
      int? notifyTimes,
      String? confirmAt,
      int? confirmTimes,
      num? commission,
      String createdTime});
}

/// @nodoc
class __$$_AdMyTakerModelCopyWithImpl<$Res>
    extends _$AdMyTakerModelCopyWithImpl<$Res, _$_AdMyTakerModel>
    implements _$$_AdMyTakerModelCopyWith<$Res> {
  __$$_AdMyTakerModelCopyWithImpl(
      _$_AdMyTakerModel _value, $Res Function(_$_AdMyTakerModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? reference = null,
    Object? makerReference = null,
    Object? makerChannelReference = null,
    Object? merchantCode = null,
    Object? overTime = freezed,
    Object? overTimeSeconds = null,
    Object? sell = null,
    Object? coin = null,
    Object? coinAmount = null,
    Object? makerUsername = null,
    Object? takerAccountName = freezed,
    Object? takerUsername = null,
    Object? paymentMethod = null,
    Object? state = null,
    Object? orderLevel = null,
    Object? makerPaymentAccount = null,
    Object? takerPaymentAccount = null,
    Object? moneyAmount = null,
    Object? money = null,
    Object? rate = null,
    Object? notifyAt = freezed,
    Object? notifyTimes = freezed,
    Object? confirmAt = freezed,
    Object? confirmTimes = freezed,
    Object? commission = freezed,
    Object? createdTime = null,
  }) {
    return _then(_$_AdMyTakerModel(
      reference: null == reference
          ? _value.reference
          : reference // ignore: cast_nullable_to_non_nullable
              as String,
      makerReference: null == makerReference
          ? _value.makerReference
          : makerReference // ignore: cast_nullable_to_non_nullable
              as String,
      makerChannelReference: null == makerChannelReference
          ? _value.makerChannelReference
          : makerChannelReference // ignore: cast_nullable_to_non_nullable
              as String,
      merchantCode: null == merchantCode
          ? _value.merchantCode
          : merchantCode // ignore: cast_nullable_to_non_nullable
              as String,
      overTime: freezed == overTime
          ? _value.overTime
          : overTime // ignore: cast_nullable_to_non_nullable
              as String?,
      overTimeSeconds: null == overTimeSeconds
          ? _value.overTimeSeconds
          : overTimeSeconds // ignore: cast_nullable_to_non_nullable
              as int,
      sell: null == sell
          ? _value.sell
          : sell // ignore: cast_nullable_to_non_nullable
              as bool,
      coin: null == coin
          ? _value.coin
          : coin // ignore: cast_nullable_to_non_nullable
              as String,
      coinAmount: null == coinAmount
          ? _value.coinAmount
          : coinAmount // ignore: cast_nullable_to_non_nullable
              as num,
      makerUsername: null == makerUsername
          ? _value.makerUsername
          : makerUsername // ignore: cast_nullable_to_non_nullable
              as String,
      takerAccountName: freezed == takerAccountName
          ? _value.takerAccountName
          : takerAccountName // ignore: cast_nullable_to_non_nullable
              as String?,
      takerUsername: null == takerUsername
          ? _value.takerUsername
          : takerUsername // ignore: cast_nullable_to_non_nullable
              as String,
      paymentMethod: null == paymentMethod
          ? _value.paymentMethod
          : paymentMethod // ignore: cast_nullable_to_non_nullable
              as String,
      state: null == state
          ? _value.state
          : state // ignore: cast_nullable_to_non_nullable
              as String,
      orderLevel: null == orderLevel
          ? _value.orderLevel
          : orderLevel // ignore: cast_nullable_to_non_nullable
              as String,
      makerPaymentAccount: null == makerPaymentAccount
          ? _value.makerPaymentAccount
          : makerPaymentAccount // ignore: cast_nullable_to_non_nullable
              as String,
      takerPaymentAccount: null == takerPaymentAccount
          ? _value.takerPaymentAccount
          : takerPaymentAccount // ignore: cast_nullable_to_non_nullable
              as String,
      moneyAmount: null == moneyAmount
          ? _value.moneyAmount
          : moneyAmount // ignore: cast_nullable_to_non_nullable
              as num,
      money: null == money
          ? _value.money
          : money // ignore: cast_nullable_to_non_nullable
              as String,
      rate: null == rate
          ? _value.rate
          : rate // ignore: cast_nullable_to_non_nullable
              as num,
      notifyAt: freezed == notifyAt
          ? _value.notifyAt
          : notifyAt // ignore: cast_nullable_to_non_nullable
              as String?,
      notifyTimes: freezed == notifyTimes
          ? _value.notifyTimes
          : notifyTimes // ignore: cast_nullable_to_non_nullable
              as int?,
      confirmAt: freezed == confirmAt
          ? _value.confirmAt
          : confirmAt // ignore: cast_nullable_to_non_nullable
              as String?,
      confirmTimes: freezed == confirmTimes
          ? _value.confirmTimes
          : confirmTimes // ignore: cast_nullable_to_non_nullable
              as int?,
      commission: freezed == commission
          ? _value.commission
          : commission // ignore: cast_nullable_to_non_nullable
              as num?,
      createdTime: null == createdTime
          ? _value.createdTime
          : createdTime // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_AdMyTakerModel implements _AdMyTakerModel {
  const _$_AdMyTakerModel(
      {required this.reference,
      required this.makerReference,
      required this.makerChannelReference,
      required this.merchantCode,
      required this.overTime,
      required this.overTimeSeconds,
      required this.sell,
      required this.coin,
      required this.coinAmount,
      required this.makerUsername,
      required this.takerAccountName,
      required this.takerUsername,
      required this.paymentMethod,
      required this.state,
      required this.orderLevel,
      required this.makerPaymentAccount,
      required this.takerPaymentAccount,
      required this.moneyAmount,
      required this.money,
      required this.rate,
      required this.notifyAt,
      required this.notifyTimes,
      required this.confirmAt,
      required this.confirmTimes,
      required this.commission,
      required this.createdTime});

  factory _$_AdMyTakerModel.fromJson(Map<String, dynamic> json) =>
      _$$_AdMyTakerModelFromJson(json);

  ///
  @override
  final String reference;

  ///
  @override
  final String makerReference;

  ///
  @override
  final String makerChannelReference;

  ///
  @override
  final String merchantCode;
  @override
  final String? overTime;
  @override
  final int overTimeSeconds;

  ///
  @override
  final bool sell;

  /// 	可用值:CNY,USD,USDT,BTC,TRX,BNB,ETH
  @override
  final String coin;

  ///
  @override
  final num coinAmount;

  ///
  @override
  final String makerUsername;
  @override
  final String? takerAccountName;

  ///
  @override
  final String takerUsername;

  /// 	可用值:BANK_CARD_TRANSFER,ALIPAY_TRANSFER,WECHAT_TRANSFER
  @override
  final String paymentMethod;

  /// 	可用值:PENDING,NOTIFIED,PAID,BLOCKING,CANCELED
  @override
  final String state;

  /// 	可用值:NORMAL,STAR
  @override
  final String orderLevel;

  ///
  @override
  final String makerPaymentAccount;

  ///
  @override
  final String takerPaymentAccount;

  ///
  @override
  final num moneyAmount;

  /// 	可用值:CNY,USD,USDT,BTC,TRX,BNB,ETH
  @override
  final String money;

  ///
  @override
  final num rate;

  ///
  @override
  final String? notifyAt;

  ///
  @override
  final int? notifyTimes;

  ///
  @override
  final String? confirmAt;

  ///
  @override
  final int? confirmTimes;

  ///
  @override
  final num? commission;

  ///
  @override
  final String createdTime;

  @override
  String toString() {
    return 'AdMyTakerModel(reference: $reference, makerReference: $makerReference, makerChannelReference: $makerChannelReference, merchantCode: $merchantCode, overTime: $overTime, overTimeSeconds: $overTimeSeconds, sell: $sell, coin: $coin, coinAmount: $coinAmount, makerUsername: $makerUsername, takerAccountName: $takerAccountName, takerUsername: $takerUsername, paymentMethod: $paymentMethod, state: $state, orderLevel: $orderLevel, makerPaymentAccount: $makerPaymentAccount, takerPaymentAccount: $takerPaymentAccount, moneyAmount: $moneyAmount, money: $money, rate: $rate, notifyAt: $notifyAt, notifyTimes: $notifyTimes, confirmAt: $confirmAt, confirmTimes: $confirmTimes, commission: $commission, createdTime: $createdTime)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AdMyTakerModel &&
            (identical(other.reference, reference) ||
                other.reference == reference) &&
            (identical(other.makerReference, makerReference) ||
                other.makerReference == makerReference) &&
            (identical(other.makerChannelReference, makerChannelReference) ||
                other.makerChannelReference == makerChannelReference) &&
            (identical(other.merchantCode, merchantCode) ||
                other.merchantCode == merchantCode) &&
            (identical(other.overTime, overTime) ||
                other.overTime == overTime) &&
            (identical(other.overTimeSeconds, overTimeSeconds) ||
                other.overTimeSeconds == overTimeSeconds) &&
            (identical(other.sell, sell) || other.sell == sell) &&
            (identical(other.coin, coin) || other.coin == coin) &&
            (identical(other.coinAmount, coinAmount) ||
                other.coinAmount == coinAmount) &&
            (identical(other.makerUsername, makerUsername) ||
                other.makerUsername == makerUsername) &&
            (identical(other.takerAccountName, takerAccountName) ||
                other.takerAccountName == takerAccountName) &&
            (identical(other.takerUsername, takerUsername) ||
                other.takerUsername == takerUsername) &&
            (identical(other.paymentMethod, paymentMethod) ||
                other.paymentMethod == paymentMethod) &&
            (identical(other.state, state) || other.state == state) &&
            (identical(other.orderLevel, orderLevel) ||
                other.orderLevel == orderLevel) &&
            (identical(other.makerPaymentAccount, makerPaymentAccount) ||
                other.makerPaymentAccount == makerPaymentAccount) &&
            (identical(other.takerPaymentAccount, takerPaymentAccount) ||
                other.takerPaymentAccount == takerPaymentAccount) &&
            (identical(other.moneyAmount, moneyAmount) ||
                other.moneyAmount == moneyAmount) &&
            (identical(other.money, money) || other.money == money) &&
            (identical(other.rate, rate) || other.rate == rate) &&
            (identical(other.notifyAt, notifyAt) ||
                other.notifyAt == notifyAt) &&
            (identical(other.notifyTimes, notifyTimes) ||
                other.notifyTimes == notifyTimes) &&
            (identical(other.confirmAt, confirmAt) ||
                other.confirmAt == confirmAt) &&
            (identical(other.confirmTimes, confirmTimes) ||
                other.confirmTimes == confirmTimes) &&
            (identical(other.commission, commission) ||
                other.commission == commission) &&
            (identical(other.createdTime, createdTime) ||
                other.createdTime == createdTime));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        reference,
        makerReference,
        makerChannelReference,
        merchantCode,
        overTime,
        overTimeSeconds,
        sell,
        coin,
        coinAmount,
        makerUsername,
        takerAccountName,
        takerUsername,
        paymentMethod,
        state,
        orderLevel,
        makerPaymentAccount,
        takerPaymentAccount,
        moneyAmount,
        money,
        rate,
        notifyAt,
        notifyTimes,
        confirmAt,
        confirmTimes,
        commission,
        createdTime
      ]);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_AdMyTakerModelCopyWith<_$_AdMyTakerModel> get copyWith =>
      __$$_AdMyTakerModelCopyWithImpl<_$_AdMyTakerModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_AdMyTakerModelToJson(
      this,
    );
  }
}

abstract class _AdMyTakerModel implements AdMyTakerModel {
  const factory _AdMyTakerModel(
      {required final String reference,
      required final String makerReference,
      required final String makerChannelReference,
      required final String merchantCode,
      required final String? overTime,
      required final int overTimeSeconds,
      required final bool sell,
      required final String coin,
      required final num coinAmount,
      required final String makerUsername,
      required final String? takerAccountName,
      required final String takerUsername,
      required final String paymentMethod,
      required final String state,
      required final String orderLevel,
      required final String makerPaymentAccount,
      required final String takerPaymentAccount,
      required final num moneyAmount,
      required final String money,
      required final num rate,
      required final String? notifyAt,
      required final int? notifyTimes,
      required final String? confirmAt,
      required final int? confirmTimes,
      required final num? commission,
      required final String createdTime}) = _$_AdMyTakerModel;

  factory _AdMyTakerModel.fromJson(Map<String, dynamic> json) =
      _$_AdMyTakerModel.fromJson;

  @override

  ///
  String get reference;
  @override

  ///
  String get makerReference;
  @override

  ///
  String get makerChannelReference;
  @override

  ///
  String get merchantCode;
  @override
  String? get overTime;
  @override
  int get overTimeSeconds;
  @override

  ///
  bool get sell;
  @override

  /// 	可用值:CNY,USD,USDT,BTC,TRX,BNB,ETH
  String get coin;
  @override

  ///
  num get coinAmount;
  @override

  ///
  String get makerUsername;
  @override
  String? get takerAccountName;
  @override

  ///
  String get takerUsername;
  @override

  /// 	可用值:BANK_CARD_TRANSFER,ALIPAY_TRANSFER,WECHAT_TRANSFER
  String get paymentMethod;
  @override

  /// 	可用值:PENDING,NOTIFIED,PAID,BLOCKING,CANCELED
  String get state;
  @override

  /// 	可用值:NORMAL,STAR
  String get orderLevel;
  @override

  ///
  String get makerPaymentAccount;
  @override

  ///
  String get takerPaymentAccount;
  @override

  ///
  num get moneyAmount;
  @override

  /// 	可用值:CNY,USD,USDT,BTC,TRX,BNB,ETH
  String get money;
  @override

  ///
  num get rate;
  @override

  ///
  String? get notifyAt;
  @override

  ///
  int? get notifyTimes;
  @override

  ///
  String? get confirmAt;
  @override

  ///
  int? get confirmTimes;
  @override

  ///
  num? get commission;
  @override

  ///
  String get createdTime;
  @override
  @JsonKey(ignore: true)
  _$$_AdMyTakerModelCopyWith<_$_AdMyTakerModel> get copyWith =>
      throw _privateConstructorUsedError;
}

// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'ad.my.model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

AdMyModel _$AdMyModelFromJson(Map<String, dynamic> json) {
  return _AdMyModel.fromJson(json);
}

/// @nodoc
mixin _$AdMyModel {
  ///		String
  String get reference => throw _privateConstructorUsedError;

  ///		String
  String get username => throw _privateConstructorUsedError;

  ///		num
  num get amount => throw _privateConstructorUsedError;

  ///	可用值:CNY,USD,USDT,BTC,TRX,BNB,ETH	String
  Cryptocurrency get coin => throw _privateConstructorUsedError;
  Fiatcurrency get money => throw _privateConstructorUsedError;

  ///		num
  num get submitAmount => throw _privateConstructorUsedError;

  ///		num
  num get refRate => throw _privateConstructorUsedError;

  ///		num
  num get currentRate => throw _privateConstructorUsedError;
  List<String> get methods => throw _privateConstructorUsedError;

  ///		num
  num get finalRate => throw _privateConstructorUsedError;
  num get floatOffset => throw _privateConstructorUsedError;

  ///		bool
  bool get fixedRate => throw _privateConstructorUsedError;

  ///		int
  int get validTime => throw _privateConstructorUsedError;

  ///	可用值:RUNNING,STOPPED	String
  String get state => throw _privateConstructorUsedError;

  ///		bool
  bool get sell => throw _privateConstructorUsedError;

  ///		String
  String get createdTime => throw _privateConstructorUsedError;

  ///		num
  num get totalCoinAmount => throw _privateConstructorUsedError;

  ///		num
  num get totalMoneyAmount => throw _privateConstructorUsedError;
  List<AdMyChannleModel> get channels => throw _privateConstructorUsedError;
  List<AdMyTakerModel> get takerDeals => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AdMyModelCopyWith<AdMyModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AdMyModelCopyWith<$Res> {
  factory $AdMyModelCopyWith(AdMyModel value, $Res Function(AdMyModel) then) =
      _$AdMyModelCopyWithImpl<$Res, AdMyModel>;
  @useResult
  $Res call(
      {String reference,
      String username,
      num amount,
      Cryptocurrency coin,
      Fiatcurrency money,
      num submitAmount,
      num refRate,
      num currentRate,
      List<String> methods,
      num finalRate,
      num floatOffset,
      bool fixedRate,
      int validTime,
      String state,
      bool sell,
      String createdTime,
      num totalCoinAmount,
      num totalMoneyAmount,
      List<AdMyChannleModel> channels,
      List<AdMyTakerModel> takerDeals});
}

/// @nodoc
class _$AdMyModelCopyWithImpl<$Res, $Val extends AdMyModel>
    implements $AdMyModelCopyWith<$Res> {
  _$AdMyModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? reference = null,
    Object? username = null,
    Object? amount = null,
    Object? coin = null,
    Object? money = null,
    Object? submitAmount = null,
    Object? refRate = null,
    Object? currentRate = null,
    Object? methods = null,
    Object? finalRate = null,
    Object? floatOffset = null,
    Object? fixedRate = null,
    Object? validTime = null,
    Object? state = null,
    Object? sell = null,
    Object? createdTime = null,
    Object? totalCoinAmount = null,
    Object? totalMoneyAmount = null,
    Object? channels = null,
    Object? takerDeals = null,
  }) {
    return _then(_value.copyWith(
      reference: null == reference
          ? _value.reference
          : reference // ignore: cast_nullable_to_non_nullable
              as String,
      username: null == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String,
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as num,
      coin: null == coin
          ? _value.coin
          : coin // ignore: cast_nullable_to_non_nullable
              as Cryptocurrency,
      money: null == money
          ? _value.money
          : money // ignore: cast_nullable_to_non_nullable
              as Fiatcurrency,
      submitAmount: null == submitAmount
          ? _value.submitAmount
          : submitAmount // ignore: cast_nullable_to_non_nullable
              as num,
      refRate: null == refRate
          ? _value.refRate
          : refRate // ignore: cast_nullable_to_non_nullable
              as num,
      currentRate: null == currentRate
          ? _value.currentRate
          : currentRate // ignore: cast_nullable_to_non_nullable
              as num,
      methods: null == methods
          ? _value.methods
          : methods // ignore: cast_nullable_to_non_nullable
              as List<String>,
      finalRate: null == finalRate
          ? _value.finalRate
          : finalRate // ignore: cast_nullable_to_non_nullable
              as num,
      floatOffset: null == floatOffset
          ? _value.floatOffset
          : floatOffset // ignore: cast_nullable_to_non_nullable
              as num,
      fixedRate: null == fixedRate
          ? _value.fixedRate
          : fixedRate // ignore: cast_nullable_to_non_nullable
              as bool,
      validTime: null == validTime
          ? _value.validTime
          : validTime // ignore: cast_nullable_to_non_nullable
              as int,
      state: null == state
          ? _value.state
          : state // ignore: cast_nullable_to_non_nullable
              as String,
      sell: null == sell
          ? _value.sell
          : sell // ignore: cast_nullable_to_non_nullable
              as bool,
      createdTime: null == createdTime
          ? _value.createdTime
          : createdTime // ignore: cast_nullable_to_non_nullable
              as String,
      totalCoinAmount: null == totalCoinAmount
          ? _value.totalCoinAmount
          : totalCoinAmount // ignore: cast_nullable_to_non_nullable
              as num,
      totalMoneyAmount: null == totalMoneyAmount
          ? _value.totalMoneyAmount
          : totalMoneyAmount // ignore: cast_nullable_to_non_nullable
              as num,
      channels: null == channels
          ? _value.channels
          : channels // ignore: cast_nullable_to_non_nullable
              as List<AdMyChannleModel>,
      takerDeals: null == takerDeals
          ? _value.takerDeals
          : takerDeals // ignore: cast_nullable_to_non_nullable
              as List<AdMyTakerModel>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_AdMyModelCopyWith<$Res> implements $AdMyModelCopyWith<$Res> {
  factory _$$_AdMyModelCopyWith(
          _$_AdMyModel value, $Res Function(_$_AdMyModel) then) =
      __$$_AdMyModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String reference,
      String username,
      num amount,
      Cryptocurrency coin,
      Fiatcurrency money,
      num submitAmount,
      num refRate,
      num currentRate,
      List<String> methods,
      num finalRate,
      num floatOffset,
      bool fixedRate,
      int validTime,
      String state,
      bool sell,
      String createdTime,
      num totalCoinAmount,
      num totalMoneyAmount,
      List<AdMyChannleModel> channels,
      List<AdMyTakerModel> takerDeals});
}

/// @nodoc
class __$$_AdMyModelCopyWithImpl<$Res>
    extends _$AdMyModelCopyWithImpl<$Res, _$_AdMyModel>
    implements _$$_AdMyModelCopyWith<$Res> {
  __$$_AdMyModelCopyWithImpl(
      _$_AdMyModel _value, $Res Function(_$_AdMyModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? reference = null,
    Object? username = null,
    Object? amount = null,
    Object? coin = null,
    Object? money = null,
    Object? submitAmount = null,
    Object? refRate = null,
    Object? currentRate = null,
    Object? methods = null,
    Object? finalRate = null,
    Object? floatOffset = null,
    Object? fixedRate = null,
    Object? validTime = null,
    Object? state = null,
    Object? sell = null,
    Object? createdTime = null,
    Object? totalCoinAmount = null,
    Object? totalMoneyAmount = null,
    Object? channels = null,
    Object? takerDeals = null,
  }) {
    return _then(_$_AdMyModel(
      reference: null == reference
          ? _value.reference
          : reference // ignore: cast_nullable_to_non_nullable
              as String,
      username: null == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String,
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as num,
      coin: null == coin
          ? _value.coin
          : coin // ignore: cast_nullable_to_non_nullable
              as Cryptocurrency,
      money: null == money
          ? _value.money
          : money // ignore: cast_nullable_to_non_nullable
              as Fiatcurrency,
      submitAmount: null == submitAmount
          ? _value.submitAmount
          : submitAmount // ignore: cast_nullable_to_non_nullable
              as num,
      refRate: null == refRate
          ? _value.refRate
          : refRate // ignore: cast_nullable_to_non_nullable
              as num,
      currentRate: null == currentRate
          ? _value.currentRate
          : currentRate // ignore: cast_nullable_to_non_nullable
              as num,
      methods: null == methods
          ? _value._methods
          : methods // ignore: cast_nullable_to_non_nullable
              as List<String>,
      finalRate: null == finalRate
          ? _value.finalRate
          : finalRate // ignore: cast_nullable_to_non_nullable
              as num,
      floatOffset: null == floatOffset
          ? _value.floatOffset
          : floatOffset // ignore: cast_nullable_to_non_nullable
              as num,
      fixedRate: null == fixedRate
          ? _value.fixedRate
          : fixedRate // ignore: cast_nullable_to_non_nullable
              as bool,
      validTime: null == validTime
          ? _value.validTime
          : validTime // ignore: cast_nullable_to_non_nullable
              as int,
      state: null == state
          ? _value.state
          : state // ignore: cast_nullable_to_non_nullable
              as String,
      sell: null == sell
          ? _value.sell
          : sell // ignore: cast_nullable_to_non_nullable
              as bool,
      createdTime: null == createdTime
          ? _value.createdTime
          : createdTime // ignore: cast_nullable_to_non_nullable
              as String,
      totalCoinAmount: null == totalCoinAmount
          ? _value.totalCoinAmount
          : totalCoinAmount // ignore: cast_nullable_to_non_nullable
              as num,
      totalMoneyAmount: null == totalMoneyAmount
          ? _value.totalMoneyAmount
          : totalMoneyAmount // ignore: cast_nullable_to_non_nullable
              as num,
      channels: null == channels
          ? _value._channels
          : channels // ignore: cast_nullable_to_non_nullable
              as List<AdMyChannleModel>,
      takerDeals: null == takerDeals
          ? _value._takerDeals
          : takerDeals // ignore: cast_nullable_to_non_nullable
              as List<AdMyTakerModel>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_AdMyModel implements _AdMyModel {
  const _$_AdMyModel(
      {required this.reference,
      required this.username,
      required this.amount,
      required this.coin,
      required this.money,
      required this.submitAmount,
      required this.refRate,
      required this.currentRate,
      required final List<String> methods,
      required this.finalRate,
      required this.floatOffset,
      required this.fixedRate,
      required this.validTime,
      required this.state,
      required this.sell,
      required this.createdTime,
      required this.totalCoinAmount,
      required this.totalMoneyAmount,
      required final List<AdMyChannleModel> channels,
      required final List<AdMyTakerModel> takerDeals})
      : _methods = methods,
        _channels = channels,
        _takerDeals = takerDeals;

  factory _$_AdMyModel.fromJson(Map<String, dynamic> json) =>
      _$$_AdMyModelFromJson(json);

  ///		String
  @override
  final String reference;

  ///		String
  @override
  final String username;

  ///		num
  @override
  final num amount;

  ///	可用值:CNY,USD,USDT,BTC,TRX,BNB,ETH	String
  @override
  final Cryptocurrency coin;
  @override
  final Fiatcurrency money;

  ///		num
  @override
  final num submitAmount;

  ///		num
  @override
  final num refRate;

  ///		num
  @override
  final num currentRate;
  final List<String> _methods;
  @override
  List<String> get methods {
    if (_methods is EqualUnmodifiableListView) return _methods;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_methods);
  }

  ///		num
  @override
  final num finalRate;
  @override
  final num floatOffset;

  ///		bool
  @override
  final bool fixedRate;

  ///		int
  @override
  final int validTime;

  ///	可用值:RUNNING,STOPPED	String
  @override
  final String state;

  ///		bool
  @override
  final bool sell;

  ///		String
  @override
  final String createdTime;

  ///		num
  @override
  final num totalCoinAmount;

  ///		num
  @override
  final num totalMoneyAmount;
  final List<AdMyChannleModel> _channels;
  @override
  List<AdMyChannleModel> get channels {
    if (_channels is EqualUnmodifiableListView) return _channels;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_channels);
  }

  final List<AdMyTakerModel> _takerDeals;
  @override
  List<AdMyTakerModel> get takerDeals {
    if (_takerDeals is EqualUnmodifiableListView) return _takerDeals;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_takerDeals);
  }

  @override
  String toString() {
    return 'AdMyModel(reference: $reference, username: $username, amount: $amount, coin: $coin, money: $money, submitAmount: $submitAmount, refRate: $refRate, currentRate: $currentRate, methods: $methods, finalRate: $finalRate, floatOffset: $floatOffset, fixedRate: $fixedRate, validTime: $validTime, state: $state, sell: $sell, createdTime: $createdTime, totalCoinAmount: $totalCoinAmount, totalMoneyAmount: $totalMoneyAmount, channels: $channels, takerDeals: $takerDeals)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AdMyModel &&
            (identical(other.reference, reference) ||
                other.reference == reference) &&
            (identical(other.username, username) ||
                other.username == username) &&
            (identical(other.amount, amount) || other.amount == amount) &&
            (identical(other.coin, coin) || other.coin == coin) &&
            (identical(other.money, money) || other.money == money) &&
            (identical(other.submitAmount, submitAmount) ||
                other.submitAmount == submitAmount) &&
            (identical(other.refRate, refRate) || other.refRate == refRate) &&
            (identical(other.currentRate, currentRate) ||
                other.currentRate == currentRate) &&
            const DeepCollectionEquality().equals(other._methods, _methods) &&
            (identical(other.finalRate, finalRate) ||
                other.finalRate == finalRate) &&
            (identical(other.floatOffset, floatOffset) ||
                other.floatOffset == floatOffset) &&
            (identical(other.fixedRate, fixedRate) ||
                other.fixedRate == fixedRate) &&
            (identical(other.validTime, validTime) ||
                other.validTime == validTime) &&
            (identical(other.state, state) || other.state == state) &&
            (identical(other.sell, sell) || other.sell == sell) &&
            (identical(other.createdTime, createdTime) ||
                other.createdTime == createdTime) &&
            (identical(other.totalCoinAmount, totalCoinAmount) ||
                other.totalCoinAmount == totalCoinAmount) &&
            (identical(other.totalMoneyAmount, totalMoneyAmount) ||
                other.totalMoneyAmount == totalMoneyAmount) &&
            const DeepCollectionEquality().equals(other._channels, _channels) &&
            const DeepCollectionEquality()
                .equals(other._takerDeals, _takerDeals));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        reference,
        username,
        amount,
        coin,
        money,
        submitAmount,
        refRate,
        currentRate,
        const DeepCollectionEquality().hash(_methods),
        finalRate,
        floatOffset,
        fixedRate,
        validTime,
        state,
        sell,
        createdTime,
        totalCoinAmount,
        totalMoneyAmount,
        const DeepCollectionEquality().hash(_channels),
        const DeepCollectionEquality().hash(_takerDeals)
      ]);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_AdMyModelCopyWith<_$_AdMyModel> get copyWith =>
      __$$_AdMyModelCopyWithImpl<_$_AdMyModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_AdMyModelToJson(
      this,
    );
  }
}

abstract class _AdMyModel implements AdMyModel {
  const factory _AdMyModel(
      {required final String reference,
      required final String username,
      required final num amount,
      required final Cryptocurrency coin,
      required final Fiatcurrency money,
      required final num submitAmount,
      required final num refRate,
      required final num currentRate,
      required final List<String> methods,
      required final num finalRate,
      required final num floatOffset,
      required final bool fixedRate,
      required final int validTime,
      required final String state,
      required final bool sell,
      required final String createdTime,
      required final num totalCoinAmount,
      required final num totalMoneyAmount,
      required final List<AdMyChannleModel> channels,
      required final List<AdMyTakerModel> takerDeals}) = _$_AdMyModel;

  factory _AdMyModel.fromJson(Map<String, dynamic> json) =
      _$_AdMyModel.fromJson;

  @override

  ///		String
  String get reference;
  @override

  ///		String
  String get username;
  @override

  ///		num
  num get amount;
  @override

  ///	可用值:CNY,USD,USDT,BTC,TRX,BNB,ETH	String
  Cryptocurrency get coin;
  @override
  Fiatcurrency get money;
  @override

  ///		num
  num get submitAmount;
  @override

  ///		num
  num get refRate;
  @override

  ///		num
  num get currentRate;
  @override
  List<String> get methods;
  @override

  ///		num
  num get finalRate;
  @override
  num get floatOffset;
  @override

  ///		bool
  bool get fixedRate;
  @override

  ///		int
  int get validTime;
  @override

  ///	可用值:RUNNING,STOPPED	String
  String get state;
  @override

  ///		bool
  bool get sell;
  @override

  ///		String
  String get createdTime;
  @override

  ///		num
  num get totalCoinAmount;
  @override

  ///		num
  num get totalMoneyAmount;
  @override
  List<AdMyChannleModel> get channels;
  @override
  List<AdMyTakerModel> get takerDeals;
  @override
  @JsonKey(ignore: true)
  _$$_AdMyModelCopyWith<_$_AdMyModel> get copyWith =>
      throw _privateConstructorUsedError;
}

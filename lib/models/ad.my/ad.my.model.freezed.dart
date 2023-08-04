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
  String get currency => throw _privateConstructorUsedError;

  ///		num
  num get submitAmount => throw _privateConstructorUsedError;

  ///		num
  num get refRate => throw _privateConstructorUsedError;

  ///		num
  num get rate => throw _privateConstructorUsedError;

  ///		bool
  bool get fixedRate => throw _privateConstructorUsedError;

  ///		int
  int get validTime => throw _privateConstructorUsedError;

  ///	可用值:RUNNING,STOPPED	String
  String get state => throw _privateConstructorUsedError;

  ///		bool
  bool get sell => throw _privateConstructorUsedError;

  ///	可用值:CNY,USD,USDT,BTC,TRX,BNB,ETH	String
  String get changeCurrency => throw _privateConstructorUsedError;

  ///		String
  String get createdTime => throw _privateConstructorUsedError;

  ///		num
  num get totalAmount => throw _privateConstructorUsedError;

  ///		num
  num get totalChangeAmount => throw _privateConstructorUsedError;
  List<AdMyChannleModel> get channels => throw _privateConstructorUsedError;
  List<AdMyTakerModel> get akerDeals => throw _privateConstructorUsedError;

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
      String currency,
      num submitAmount,
      num refRate,
      num rate,
      bool fixedRate,
      int validTime,
      String state,
      bool sell,
      String changeCurrency,
      String createdTime,
      num totalAmount,
      num totalChangeAmount,
      List<AdMyChannleModel> channels,
      List<AdMyTakerModel> akerDeals});
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
    Object? currency = null,
    Object? submitAmount = null,
    Object? refRate = null,
    Object? rate = null,
    Object? fixedRate = null,
    Object? validTime = null,
    Object? state = null,
    Object? sell = null,
    Object? changeCurrency = null,
    Object? createdTime = null,
    Object? totalAmount = null,
    Object? totalChangeAmount = null,
    Object? channels = null,
    Object? akerDeals = null,
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
      currency: null == currency
          ? _value.currency
          : currency // ignore: cast_nullable_to_non_nullable
              as String,
      submitAmount: null == submitAmount
          ? _value.submitAmount
          : submitAmount // ignore: cast_nullable_to_non_nullable
              as num,
      refRate: null == refRate
          ? _value.refRate
          : refRate // ignore: cast_nullable_to_non_nullable
              as num,
      rate: null == rate
          ? _value.rate
          : rate // ignore: cast_nullable_to_non_nullable
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
      changeCurrency: null == changeCurrency
          ? _value.changeCurrency
          : changeCurrency // ignore: cast_nullable_to_non_nullable
              as String,
      createdTime: null == createdTime
          ? _value.createdTime
          : createdTime // ignore: cast_nullable_to_non_nullable
              as String,
      totalAmount: null == totalAmount
          ? _value.totalAmount
          : totalAmount // ignore: cast_nullable_to_non_nullable
              as num,
      totalChangeAmount: null == totalChangeAmount
          ? _value.totalChangeAmount
          : totalChangeAmount // ignore: cast_nullable_to_non_nullable
              as num,
      channels: null == channels
          ? _value.channels
          : channels // ignore: cast_nullable_to_non_nullable
              as List<AdMyChannleModel>,
      akerDeals: null == akerDeals
          ? _value.akerDeals
          : akerDeals // ignore: cast_nullable_to_non_nullable
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
      String currency,
      num submitAmount,
      num refRate,
      num rate,
      bool fixedRate,
      int validTime,
      String state,
      bool sell,
      String changeCurrency,
      String createdTime,
      num totalAmount,
      num totalChangeAmount,
      List<AdMyChannleModel> channels,
      List<AdMyTakerModel> akerDeals});
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
    Object? currency = null,
    Object? submitAmount = null,
    Object? refRate = null,
    Object? rate = null,
    Object? fixedRate = null,
    Object? validTime = null,
    Object? state = null,
    Object? sell = null,
    Object? changeCurrency = null,
    Object? createdTime = null,
    Object? totalAmount = null,
    Object? totalChangeAmount = null,
    Object? channels = null,
    Object? akerDeals = null,
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
      currency: null == currency
          ? _value.currency
          : currency // ignore: cast_nullable_to_non_nullable
              as String,
      submitAmount: null == submitAmount
          ? _value.submitAmount
          : submitAmount // ignore: cast_nullable_to_non_nullable
              as num,
      refRate: null == refRate
          ? _value.refRate
          : refRate // ignore: cast_nullable_to_non_nullable
              as num,
      rate: null == rate
          ? _value.rate
          : rate // ignore: cast_nullable_to_non_nullable
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
      changeCurrency: null == changeCurrency
          ? _value.changeCurrency
          : changeCurrency // ignore: cast_nullable_to_non_nullable
              as String,
      createdTime: null == createdTime
          ? _value.createdTime
          : createdTime // ignore: cast_nullable_to_non_nullable
              as String,
      totalAmount: null == totalAmount
          ? _value.totalAmount
          : totalAmount // ignore: cast_nullable_to_non_nullable
              as num,
      totalChangeAmount: null == totalChangeAmount
          ? _value.totalChangeAmount
          : totalChangeAmount // ignore: cast_nullable_to_non_nullable
              as num,
      channels: null == channels
          ? _value._channels
          : channels // ignore: cast_nullable_to_non_nullable
              as List<AdMyChannleModel>,
      akerDeals: null == akerDeals
          ? _value._akerDeals
          : akerDeals // ignore: cast_nullable_to_non_nullable
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
      required this.currency,
      required this.submitAmount,
      required this.refRate,
      required this.rate,
      required this.fixedRate,
      required this.validTime,
      required this.state,
      required this.sell,
      required this.changeCurrency,
      required this.createdTime,
      required this.totalAmount,
      required this.totalChangeAmount,
      required final List<AdMyChannleModel> channels,
      required final List<AdMyTakerModel> akerDeals})
      : _channels = channels,
        _akerDeals = akerDeals;

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
  final String currency;

  ///		num
  @override
  final num submitAmount;

  ///		num
  @override
  final num refRate;

  ///		num
  @override
  final num rate;

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

  ///	可用值:CNY,USD,USDT,BTC,TRX,BNB,ETH	String
  @override
  final String changeCurrency;

  ///		String
  @override
  final String createdTime;

  ///		num
  @override
  final num totalAmount;

  ///		num
  @override
  final num totalChangeAmount;
  final List<AdMyChannleModel> _channels;
  @override
  List<AdMyChannleModel> get channels {
    if (_channels is EqualUnmodifiableListView) return _channels;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_channels);
  }

  final List<AdMyTakerModel> _akerDeals;
  @override
  List<AdMyTakerModel> get akerDeals {
    if (_akerDeals is EqualUnmodifiableListView) return _akerDeals;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_akerDeals);
  }

  @override
  String toString() {
    return 'AdMyModel(reference: $reference, username: $username, amount: $amount, currency: $currency, submitAmount: $submitAmount, refRate: $refRate, rate: $rate, fixedRate: $fixedRate, validTime: $validTime, state: $state, sell: $sell, changeCurrency: $changeCurrency, createdTime: $createdTime, totalAmount: $totalAmount, totalChangeAmount: $totalChangeAmount, channels: $channels, akerDeals: $akerDeals)';
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
            (identical(other.currency, currency) ||
                other.currency == currency) &&
            (identical(other.submitAmount, submitAmount) ||
                other.submitAmount == submitAmount) &&
            (identical(other.refRate, refRate) || other.refRate == refRate) &&
            (identical(other.rate, rate) || other.rate == rate) &&
            (identical(other.fixedRate, fixedRate) ||
                other.fixedRate == fixedRate) &&
            (identical(other.validTime, validTime) ||
                other.validTime == validTime) &&
            (identical(other.state, state) || other.state == state) &&
            (identical(other.sell, sell) || other.sell == sell) &&
            (identical(other.changeCurrency, changeCurrency) ||
                other.changeCurrency == changeCurrency) &&
            (identical(other.createdTime, createdTime) ||
                other.createdTime == createdTime) &&
            (identical(other.totalAmount, totalAmount) ||
                other.totalAmount == totalAmount) &&
            (identical(other.totalChangeAmount, totalChangeAmount) ||
                other.totalChangeAmount == totalChangeAmount) &&
            const DeepCollectionEquality().equals(other._channels, _channels) &&
            const DeepCollectionEquality()
                .equals(other._akerDeals, _akerDeals));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      reference,
      username,
      amount,
      currency,
      submitAmount,
      refRate,
      rate,
      fixedRate,
      validTime,
      state,
      sell,
      changeCurrency,
      createdTime,
      totalAmount,
      totalChangeAmount,
      const DeepCollectionEquality().hash(_channels),
      const DeepCollectionEquality().hash(_akerDeals));

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
      required final String currency,
      required final num submitAmount,
      required final num refRate,
      required final num rate,
      required final bool fixedRate,
      required final int validTime,
      required final String state,
      required final bool sell,
      required final String changeCurrency,
      required final String createdTime,
      required final num totalAmount,
      required final num totalChangeAmount,
      required final List<AdMyChannleModel> channels,
      required final List<AdMyTakerModel> akerDeals}) = _$_AdMyModel;

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
  String get currency;
  @override

  ///		num
  num get submitAmount;
  @override

  ///		num
  num get refRate;
  @override

  ///		num
  num get rate;
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

  ///	可用值:CNY,USD,USDT,BTC,TRX,BNB,ETH	String
  String get changeCurrency;
  @override

  ///		String
  String get createdTime;
  @override

  ///		num
  num get totalAmount;
  @override

  ///		num
  num get totalChangeAmount;
  @override
  List<AdMyChannleModel> get channels;
  @override
  List<AdMyTakerModel> get akerDeals;
  @override
  @JsonKey(ignore: true)
  _$$_AdMyModelCopyWith<_$_AdMyModel> get copyWith =>
      throw _privateConstructorUsedError;
}

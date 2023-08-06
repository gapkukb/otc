import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:otc/constants/currency.dart';
import 'package:otc/models/ad.my/ad.my.channel.model.dart';
import 'package:otc/models/ad.my/ad.my.taker.model.dart';
part 'ad.my.model.freezed.dart';
part 'ad.my.model.g.dart';

@freezed
class AdMyModel with _$AdMyModel {
  const factory AdMyModel({
    ///		String
    required String reference,

    ///		String
    required String username,

    ///		num
    required num amount,

    ///	可用值:CNY,USD,USDT,BTC,TRX,BNB,ETH	String

    required Cryptocurrency coin,
    required Fiatcurrency money,

    ///		num
    required num submitAmount,

    ///		num
    required num refRate,

    ///		num
    required num currentRate,
    required List<String> methods,

    ///		num
    required num finalRate,
    required num floatOffset,

    ///		bool
    required bool fixedRate,

    ///		int
    required int validTime,

    ///	可用值:RUNNING,STOPPED	String
    required String state,

    ///		bool
    required bool sell,

    ///		String
    required String createdTime,

    ///		num
    required num totalCoinAmount,

    ///		num
    required num totalMoneyAmount,
    required List<AdMyChannleModel> channels,
    required List<AdMyTakerModel> takerDeals,
  }) = _AdMyModel;

  factory AdMyModel.fromJson(Map<String, Object?> json) => _$AdMyModelFromJson(json);
}

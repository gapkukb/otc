import 'package:freezed_annotation/freezed_annotation.dart';
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
    required String currency,

    ///		num
    required num submitAmount,

    ///		num
    required num refRate,

    ///		num
    required num rate,

    ///		bool
    required bool fixedRate,

    ///		int
    required int validTime,

    ///	可用值:RUNNING,STOPPED	String
    required String state,

    ///		bool
    required bool sell,

    ///	可用值:CNY,USD,USDT,BTC,TRX,BNB,ETH	String
    required String changeCurrency,

    ///		String
    required String createdTime,

    ///		num
    required num totalAmount,

    ///		num
    required num totalChangeAmount,
    required List<AdMyChannleModel> channels,
    required List<AdMyTakerModel> akerDeals,
  }) = _AdMyModel;

  factory AdMyModel.fromJson(Map<String, Object?> json) => _$AdMyModelFromJson(json);
}

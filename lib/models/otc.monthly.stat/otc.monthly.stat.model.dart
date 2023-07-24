import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:otc/models/otc.monthly.stat.range/otc.monthly.stat.range.model.dart';
part 'otc.monthly.stat.model.freezed.dart';
part 'otc.monthly.stat.model.g.dart';

@freezed
class OtcMonthlyStatModel with _$OtcMonthlyStatModel {
  const factory OtcMonthlyStatModel({
    /// 	挂单数	integer
    required String makerCount,
    required OtcMonthlyStatRangeModel range,

    /// 	成单数	integer
    required num makerPaidCount,

    /// 	星级成单数	integer
    required num makerPaidStarCount,

    /// 	佣金	number
    required num makerCommission,

    /// 	taker 单数
    required num takerCount,

    /// 	taker 成单数
    required num takerPaidCount,

    /// 	maker 打款时间
    required num makerNotifyTimes,

    /// 	maker 放行时间
    required num makerConfirmTimes,

    /// 	taker 打款时间
    required num takerNotifyTimes,

    /// 	taker 放行时间
    required num takerConfirmTimes,

    /// 	历史总挂单	integer
    required num historyMakerCount,

    /// 	历史总taker单数	integer
    required num historyTakerCount,

    /// 	历史总Maker成单数	integer
    required num historyMakerPaidCount,

    /// 	历史总taker成单数	integer
    required num historyTakerPaidCount,

    /// 	历史总佣金
    required num historyMakerCommission,
  }) = _OtcMonthlyStatModel;

  factory OtcMonthlyStatModel.fromJson(Map<String, Object?> json) => _$OtcMonthlyStatModelFromJson(json);
}

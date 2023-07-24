import 'package:freezed_annotation/freezed_annotation.dart';
part 'otc.monthly.stat.range.model.freezed.dart';
part 'otc.monthly.stat.range.model.g.dart';

@freezed
class OtcMonthlyStatRangeModel with _$OtcMonthlyStatRangeModel {
  const factory OtcMonthlyStatRangeModel({
    required String firstName,
  }) = _OtcMonthlyStatRangeModel;

  factory OtcMonthlyStatRangeModel.fromJson(Map<String, Object?> json) => _$OtcMonthlyStatRangeModelFromJson(json);
}

import 'package:freezed_annotation/freezed_annotation.dart';
part 'user_stats.model.freezed.dart';
part 'user_stats.model.g.dart';

@freezed
class UserStatsModel with _$UserStatsModel {
  const factory UserStatsModel({
    ///	用户名
    required String username,

    ///	Maker总次数
    required int makerTimes,

    ///	Taker总次数
    required int takerTimes,

    ///	Maker成单总次数
    required int makerSuccessTotal,

    ///	Taker成单总次数
    required int takerSuccessTotal,

    ///	总佣金
    required num commissionTotal,

    ///	Maker总佣金
    required num makerCommissionTotal,

    ///	登录次数
    required int loginTimes,

    ///	成功登录次数
    required int loginSuccessTimes,

    ///	最后登录时间
    required String lastLoggedTime,

    ///	最后登录IP
    required String lastLoggedIp,
  }) = _UserStatsModel;

  factory UserStatsModel.fromJson(Map<String, Object?> json) =>
      _$UserStatsModelFromJson(json);
}

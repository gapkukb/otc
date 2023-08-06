import 'package:json_annotation/json_annotation.dart';
import 'package:otc/constants/currency.dart';
part 'ad.all.model.g.dart';

@JsonSerializable()
class AdAllModel {
  final String reference;
  final String username;
  final String nickname;
  final String avatar;
  final num amount;
  @JsonEnum(valueField: "value")
  final Cryptocurrency coin;
  @JsonEnum(valueField: "value")
  final Fiatcurrency money;
  final num submitAmount;
  final num refRate;
  final num currentRate;
  final num finalRate;
  final num floatOffset;
  final bool fixedRate;
  final int validTime;
  final String state;
  final bool sell;
  final int makerTimes;
  final int makerSuccessTimes;
  final List<String> methods;
  final String createdTime;

  AdAllModel({
    required this.reference,
    required this.username,
    required this.nickname,
    required this.avatar,
    required this.amount,
    required this.coin,
    required this.money,
    required this.submitAmount,
    required this.refRate,
    required this.currentRate,
    required this.finalRate,
    required this.floatOffset,
    required this.fixedRate,
    required this.validTime,
    required this.state,
    required this.sell,
    required this.makerTimes,
    required this.makerSuccessTimes,
    required this.methods,
    required this.createdTime,
  });

  factory AdAllModel.fromJson(Map<String, dynamic> json) => _$AdAllModelFromJson(json);

  Map<String, dynamic> toJson() => _$AdAllModelToJson(this);
}

import 'dart:convert';

class RebateDetailModel {
  final int id;
  final String reference;
  final String makerReference;
  final String makerUsername;
  final String takerReference;
  final String takerUsername;
  final bool sell;
  final String rewardUsername;
  final int rate;
  final int minReward;
  final int subsidy;
  final int deservedReward;
  final int takerCoinAmount;
  final int takerMoneyAmount;
  final String money;
  final int changeRate;
  final int rewardAmount;
  final String paymentMethod;
  final String coin;
  final String state;
  final String createdTime;

  RebateDetailModel({
    required this.id,
    required this.reference,
    required this.makerReference,
    required this.makerUsername,
    required this.takerReference,
    required this.takerUsername,
    required this.sell,
    required this.rewardUsername,
    required this.rate,
    required this.minReward,
    required this.subsidy,
    required this.deservedReward,
    required this.takerCoinAmount,
    required this.takerMoneyAmount,
    required this.money,
    required this.changeRate,
    required this.rewardAmount,
    required this.paymentMethod,
    required this.coin,
    required this.state,
    required this.createdTime,
  });

  RebateDetailModel copyWith({
    int? id,
    String? reference,
    String? makerReference,
    String? makerUsername,
    String? takerReference,
    String? takerUsername,
    bool? sell,
    String? rewardUsername,
    int? rate,
    int? minReward,
    int? subsidy,
    int? deservedReward,
    int? takerCoinAmount,
    int? takerMoneyAmount,
    String? money,
    int? changeRate,
    int? rewardAmount,
    String? paymentMethod,
    String? coin,
    String? state,
    String? createdTime,
  }) =>
      RebateDetailModel(
        id: id ?? this.id,
        reference: reference ?? this.reference,
        makerReference: makerReference ?? this.makerReference,
        makerUsername: makerUsername ?? this.makerUsername,
        takerReference: takerReference ?? this.takerReference,
        takerUsername: takerUsername ?? this.takerUsername,
        sell: sell ?? this.sell,
        rewardUsername: rewardUsername ?? this.rewardUsername,
        rate: rate ?? this.rate,
        minReward: minReward ?? this.minReward,
        subsidy: subsidy ?? this.subsidy,
        deservedReward: deservedReward ?? this.deservedReward,
        takerCoinAmount: takerCoinAmount ?? this.takerCoinAmount,
        takerMoneyAmount: takerMoneyAmount ?? this.takerMoneyAmount,
        money: money ?? this.money,
        changeRate: changeRate ?? this.changeRate,
        rewardAmount: rewardAmount ?? this.rewardAmount,
        paymentMethod: paymentMethod ?? this.paymentMethod,
        coin: coin ?? this.coin,
        state: state ?? this.state,
        createdTime: createdTime ?? this.createdTime,
      );

  factory RebateDetailModel.fromRawJson(String str) => RebateDetailModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory RebateDetailModel.fromJson(Map<String, dynamic> json) => RebateDetailModel(
        id: json["id"],
        reference: json["reference"],
        makerReference: json["makerReference"],
        makerUsername: json["makerUsername"],
        takerReference: json["takerReference"],
        takerUsername: json["takerUsername"],
        sell: json["sell"],
        rewardUsername: json["rewardUsername"],
        rate: json["rate"],
        minReward: json["minReward"],
        subsidy: json["subsidy"],
        deservedReward: json["deservedReward"],
        takerCoinAmount: json["takerCoinAmount"],
        takerMoneyAmount: json["takerMoneyAmount"],
        money: json["money"],
        changeRate: json["changeRate"],
        rewardAmount: json["rewardAmount"],
        paymentMethod: json["paymentMethod"],
        coin: json["coin"],
        state: json["state"],
        createdTime: json["createdTime"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "reference": reference,
        "makerReference": makerReference,
        "makerUsername": makerUsername,
        "takerReference": takerReference,
        "takerUsername": takerUsername,
        "sell": sell,
        "rewardUsername": rewardUsername,
        "rate": rate,
        "minReward": minReward,
        "subsidy": subsidy,
        "deservedReward": deservedReward,
        "takerCoinAmount": takerCoinAmount,
        "takerMoneyAmount": takerMoneyAmount,
        "money": money,
        "changeRate": changeRate,
        "rewardAmount": rewardAmount,
        "paymentMethod": paymentMethod,
        "coin": coin,
        "state": state,
        "createdTime": createdTime,
      };
}

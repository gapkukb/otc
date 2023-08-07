import 'dart:convert';

class MerchantIncomeModel {
  final num id;
  final String reference;
  final String makerReference;
  final String makerUsername;
  final String takerReference;
  final String takerUsername;
  final bool sell;
  final String rewardUsername;
  final num rate;
  final num minReward;
  final num subsidy;
  final num deservedReward;
  final num takerCoinAmount;
  final num takerMoneyAmount;
  final String money;
  final num changeRate;
  final num rewardAmount;
  final String paymentMethod;
  final String coin;
  final String state;
  final String createdTime;

  MerchantIncomeModel({
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

  MerchantIncomeModel copyWith({
    num? id,
    String? reference,
    String? makerReference,
    String? makerUsername,
    String? takerReference,
    String? takerUsername,
    bool? sell,
    String? rewardUsername,
    num? rate,
    num? minReward,
    num? subsidy,
    num? deservedReward,
    num? takerCoinAmount,
    num? takerMoneyAmount,
    String? money,
    num? changeRate,
    num? rewardAmount,
    String? paymentMethod,
    String? coin,
    String? state,
    String? createdTime,
  }) =>
      MerchantIncomeModel(
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

  factory MerchantIncomeModel.fromRawJson(String str) => MerchantIncomeModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory MerchantIncomeModel.fromJson(Map<String, dynamic> json) => MerchantIncomeModel(
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

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:otc/apis/apis.dart';
import 'dart:convert';

class KycConfigurationNotifier extends StateNotifier<KycConfigurationModel> {
  KycConfigurationNotifier() : super(KycConfigurationModel()) {
    apis.kyc.fetchConfig().then((value) => state = KycConfigurationModel.fromJson(value));
  }
}

final kycConfigurationProvider = StateNotifierProvider<KycConfigurationNotifier, KycConfigurationModel>((ref) {
  return KycConfigurationNotifier();
});

class KycConfigurationModel {
  final num dailyWithdrawKycLv1;
  final num dailyWithdrawKycLv2;
  final num dailyWithdrawKycLv3;
  final num dailyTransferKycLv1;
  final num dailyTransferKycLv2;
  final num dailyTransferKycLv3;

  KycConfigurationModel({
    this.dailyWithdrawKycLv1 = 0,
    this.dailyWithdrawKycLv2 = 0,
    this.dailyWithdrawKycLv3 = 0,
    this.dailyTransferKycLv1 = 0,
    this.dailyTransferKycLv2 = 0,
    this.dailyTransferKycLv3 = 0,
  });

  KycConfigurationModel copyWith({
    num? dailyWithdrawKycLv1,
    num? dailyWithdrawKycLv2,
    num? dailyWithdrawKycLv3,
    num? dailyTransferKycLv1,
    num? dailyTransferKycLv2,
    num? dailyTransferKycLv3,
  }) =>
      KycConfigurationModel(
        dailyWithdrawKycLv1: dailyWithdrawKycLv1 ?? this.dailyWithdrawKycLv1,
        dailyWithdrawKycLv2: dailyWithdrawKycLv2 ?? this.dailyWithdrawKycLv2,
        dailyWithdrawKycLv3: dailyWithdrawKycLv3 ?? this.dailyWithdrawKycLv3,
        dailyTransferKycLv1: dailyTransferKycLv1 ?? this.dailyTransferKycLv1,
        dailyTransferKycLv2: dailyTransferKycLv2 ?? this.dailyTransferKycLv2,
        dailyTransferKycLv3: dailyTransferKycLv3 ?? this.dailyTransferKycLv3,
      );

  factory KycConfigurationModel.fromRawJson(String str) => KycConfigurationModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory KycConfigurationModel.fromJson(Map<String, dynamic> json) => KycConfigurationModel(
        dailyWithdrawKycLv1: json["dailyWithdrawKycLv1"],
        dailyWithdrawKycLv2: json["dailyWithdrawKycLv2"],
        dailyWithdrawKycLv3: json["dailyWithdrawKycLv3"],
        dailyTransferKycLv1: json["dailyTransferKycLv1"],
        dailyTransferKycLv2: json["dailyTransferKycLv2"],
        dailyTransferKycLv3: json["dailyTransferKycLv3"],
      );

  Map<String, dynamic> toJson() => {
        "dailyWithdrawKycLv1": dailyWithdrawKycLv1,
        "dailyWithdrawKycLv2": dailyWithdrawKycLv2,
        "dailyWithdrawKycLv3": dailyWithdrawKycLv3,
        "dailyTransferKycLv1": dailyTransferKycLv1,
        "dailyTransferKycLv2": dailyTransferKycLv2,
        "dailyTransferKycLv3": dailyTransferKycLv3,
      };
}

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:otc/apis/apis.dart';
import 'dart:convert';

class KycConfigurationNotifier extends StateNotifier<AuthConfigurationModel> {
  KycConfigurationNotifier() : super(AuthConfigurationModel()) {
    apis.kyc.fetchConfig().then((value) => state = AuthConfigurationModel.fromJson(value));
  }
}

final kycConfigurationProvider = StateNotifierProvider<KycConfigurationNotifier, AuthConfigurationModel>((ref) {
  return KycConfigurationNotifier();
});

class AuthConfigurationModel {
  final num dailyWithdrawKycLv1;
  final num dailyWithdrawKycLv2;
  final num dailyWithdrawKycLv3;
  final num dailyTransferKycLv1;
  final num dailyTransferKycLv2;
  final num dailyTransferKycLv3;

  AuthConfigurationModel({
    this.dailyWithdrawKycLv1 = 0,
    this.dailyWithdrawKycLv2 = 0,
    this.dailyWithdrawKycLv3 = 0,
    this.dailyTransferKycLv1 = 0,
    this.dailyTransferKycLv2 = 0,
    this.dailyTransferKycLv3 = 0,
  });

  AuthConfigurationModel copyWith({
    num? dailyWithdrawKycLv1,
    num? dailyWithdrawKycLv2,
    num? dailyWithdrawKycLv3,
    num? dailyTransferKycLv1,
    num? dailyTransferKycLv2,
    num? dailyTransferKycLv3,
  }) =>
      AuthConfigurationModel(
        dailyWithdrawKycLv1: dailyWithdrawKycLv1 ?? this.dailyWithdrawKycLv1,
        dailyWithdrawKycLv2: dailyWithdrawKycLv2 ?? this.dailyWithdrawKycLv2,
        dailyWithdrawKycLv3: dailyWithdrawKycLv3 ?? this.dailyWithdrawKycLv3,
        dailyTransferKycLv1: dailyTransferKycLv1 ?? this.dailyTransferKycLv1,
        dailyTransferKycLv2: dailyTransferKycLv2 ?? this.dailyTransferKycLv2,
        dailyTransferKycLv3: dailyTransferKycLv3 ?? this.dailyTransferKycLv3,
      );

  factory AuthConfigurationModel.fromRawJson(String str) => AuthConfigurationModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory AuthConfigurationModel.fromJson(Map<String, dynamic> json) => AuthConfigurationModel(
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

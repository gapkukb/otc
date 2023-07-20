import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:otc/models/kyc/kyc.model.dart';
import "../user_base/user_base.model.dart";
import "../user_stats/user_stats.model.dart";
part 'user.model.freezed.dart';
part 'user.model.g.dart';

@freezed
class UserModel with _$UserModel {
  const factory UserModel({
    @JsonKey(name: "customer") required UserBaseModel base,
    @JsonKey(name: "data") required UserStatsModel stats,
    required KycModel? kyc,
  }) = _UserModel;

  factory UserModel.fromJson(Map<String, Object?> json) =>
      _$UserModelFromJson(json);
}

UserModel fakerUser() {
  return const UserModel(
    base: UserBaseModel(
      id: 0,
      username: "",
      email: "",
      phone: "",
      regIp: "",
      regServerName: "",
      regReferer: "",
      regDevice: "",
      emailValid: false,
      idValid: false,
      phoneValid: false,
      nickname: "",
      avatar: "",
      disabled: false,
      type: "GENERAL",
      googleSecretValid: false,
      invitationCode: "",
      lockedUntil: "",
      locked: false,
      createdTime: "",
      maker: false,
      hasPaymentPassword: false,
    ),
    stats: UserStatsModel(
      username: "",
      makerTimes: 0,
      takerTimes: 0,
      makerSuccessTotal: 0,
      takerSuccessTotal: 0,
      commissionTotal: 0,
      makerCommissionTotal: 0,
      loginTimes: 0,
      loginSuccessTimes: 0,
      lastLoggedTime: "",
      lastLoggedIp: "",
    ),
    kyc: KycModel(
      username: "",
      reference: "",
      identity: "",
      name: "",
      age: 0,
      used: false,
      idFrontPicture: "",
      idBackPicture: "",
      idHoldPicture: "",
      idHoldVideo: "",
      lv1Status: KycStatus.reject,
      lv2Status: KycStatus.reject,
      lv3Status: KycStatus.reject,
    ),
  );
}

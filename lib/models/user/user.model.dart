import 'package:freezed_annotation/freezed_annotation.dart';
part 'user.model.freezed.dart';
part 'user.model.g.dart';

@freezed
class UserModel with _$UserModel {
  const factory UserModel({
    required int id,
    required String username,
    required String email,
    required String phone,
    required String regIp,
    required String regServerName,
    required String regReferer,
    required String regDevice,
    required bool emailValid,
    required bool idValid,
    required bool phoneValid,
    required String nickname,
    required String avatar,
    required bool disabled,
    required String type,
    required String invitationCode,
    required String lockedUntil,
    required bool locked,
    required String createdTime,
    required bool payPass,
  }) = _UserModel;

  factory UserModel.fromJson(Map<String, Object?> json) =>
      _$UserModelFromJson(json);
}

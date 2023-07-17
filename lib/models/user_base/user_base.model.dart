import 'package:freezed_annotation/freezed_annotation.dart';
part 'user_base.model.freezed.dart';
part 'user_base.model.g.dart';

@freezed
class UserBaseModel with _$UserBaseModel {
  const factory UserBaseModel({
    required String id,
    // required int id,
    required String username,
    required String? email,
    required String? phone,
    required String regIp,
    required String regServerName,
    required String regReferer,
    required String regDevice,
    required bool emailValid,
    required bool googleSecretValid,
    required bool idValid,
    required bool phoneValid,
    required String nickname,
    required String avatar,
    required bool disabled,
    required String type,
    required String invitationCode,
    required String? lockedUntil,
    required bool locked,
    required String createdTime,
    required bool? maker,
  }) = _UserBaseModel;

  factory UserBaseModel.fromJson(Map<String, Object?> json) =>
      _$UserBaseModelFromJson(json);
}

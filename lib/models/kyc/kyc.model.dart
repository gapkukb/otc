import 'package:freezed_annotation/freezed_annotation.dart';
part 'kyc.model.freezed.dart';
part 'kyc.model.g.dart';

@freezed
class KycModel with _$KycModel {
  const factory KycModel({
    required String username,
    required String reference,
    required String identity,
    required String name,
    required int age,
    required bool? used,
    required String? idFrontPicture,
    required String? idBackPicture,
    required String? idHoldPicture,
    required String? idHoldVideo,
    required KycStatus? lv1Status,
    required KycStatus? lv2Status,
    required KycStatus? lv3Status,
  }) = _KycModel;

  factory KycModel.fromJson(Map<String, Object?> json) => _$KycModelFromJson(json);
}

@JsonEnum(valueField: 'value')
enum KycStatus {
  pending('PENDING'),
  pass('PASS'),
  reject('REJECT');

  const KycStatus(this.value);
  final String value;
}

import 'package:freezed_annotation/freezed_annotation.dart';
part 'kyc.model.freezed.dart';
part 'kyc.model.g.dart';

@freezed
class KycModel with _$KycModel {
  const factory KycModel({
    required String username,
    required String reference,
    required String identity,
    required String status,
    required bool used,
  }) = _KycModel;

  factory KycModel.fromJson(Map<String, Object?> json) =>
      _$KycModelFromJson(json);
}

enum KycStatus {
  pending('PENDING'),
  pass('PASS'),
  reject('REJECT');

  const KycStatus(this.value);
  final String value;
}

import 'package:freezed_annotation/freezed_annotation.dart';
part 'log.model.freezed.dart';
part 'log.model.g.dart';

@freezed
class LogModel with _$LogModel {
  const factory LogModel({
    required String username,
    required String ip,
    required bool logged,
    required String device,
    required String referer,
    required String type,
    required String createdTime,
  }) = _LogModel;

  factory LogModel.fromJson(Map<String, Object?> json) =>
      _$LogModelFromJson(json);
}

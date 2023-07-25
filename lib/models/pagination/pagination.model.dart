import 'package:freezed_annotation/freezed_annotation.dart';
part 'pagination.model.freezed.dart';
part 'pagination.model.g.dart';

@freezed
class PaginationModel with _$PaginationModel {
  const factory PaginationModel({
    required num size,
    required num current,
    required num pages,
    required num total,
  }) = _PaginationModel;

  factory PaginationModel.fromJson(Map<String, Object?> json) => _$PaginationModelFromJson(json);
}

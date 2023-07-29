import 'package:freezed_annotation/freezed_annotation.dart';
part 'pagination.model.freezed.dart';
part 'pagination.model.g.dart';

@freezed
@JsonSerializable(genericArgumentFactories: true)
class PaginationModel<T> with _$PaginationModel<T> {
  const PaginationModel._();

  const factory PaginationModel({
    required int size,
    required int current,
    required int pages,
    required int total,
    @Default([]) List<T> records,
  }) = _PaginationModel<T>;

  //It only works with block bodies and not with expression bodies
  //I don't know why
  factory PaginationModel.fromJson(Map<String, dynamic> json, T Function(Object? json) fromJsonT) {
    return _$PaginationModelFromJson<T>(json, fromJsonT);
  }

  Map<String, dynamic> toJson(Object Function(T value) toJsonT) {
    return _$PaginationModelToJson<T>(this, toJsonT);
  }
}

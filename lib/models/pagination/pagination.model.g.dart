// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pagination.model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PaginationModel<T> _$PaginationModelFromJson<T>(
  Map<String, dynamic> json,
  T Function(Object? json) fromJsonT,
) =>
    PaginationModel<T>(
      size: json['size'] as int,
      current: json['current'] as int,
      pages: json['pages'] as int,
      total: json['total'] as int,
      records: (json['records'] as List<dynamic>).map(fromJsonT).toList(),
    );

Map<String, dynamic> _$PaginationModelToJson<T>(
  PaginationModel<T> instance,
  Object? Function(T value) toJsonT,
) =>
    <String, dynamic>{
      'size': instance.size,
      'current': instance.current,
      'pages': instance.pages,
      'total': instance.total,
      'records': instance.records.map(toJsonT).toList(),
    };

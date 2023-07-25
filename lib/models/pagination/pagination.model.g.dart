// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pagination.model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_PaginationModel _$$_PaginationModelFromJson(Map<String, dynamic> json) =>
    _$_PaginationModel(
      size: json['size'] as num,
      current: json['current'] as num,
      pages: json['pages'] as num,
      total: json['total'] as num,
    );

Map<String, dynamic> _$$_PaginationModelToJson(_$_PaginationModel instance) =>
    <String, dynamic>{
      'size': instance.size,
      'current': instance.current,
      'pages': instance.pages,
      'total': instance.total,
    };

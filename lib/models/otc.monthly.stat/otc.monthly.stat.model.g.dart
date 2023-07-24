// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'otc.monthly.stat.model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_OtcMonthlyStatModel _$$_OtcMonthlyStatModelFromJson(
        Map<String, dynamic> json) =>
    _$_OtcMonthlyStatModel(
      makerCount: json['makerCount'] as String,
      range: OtcMonthlyStatRangeModel.fromJson(
          json['range'] as Map<String, dynamic>),
      makerPaidCount: json['makerPaidCount'] as num,
      makerPaidStarCount: json['makerPaidStarCount'] as num,
      makerCommission: json['makerCommission'] as num,
      takerCount: json['takerCount'] as num,
      takerPaidCount: json['takerPaidCount'] as num,
      makerNotifyTimes: json['makerNotifyTimes'] as num,
      makerConfirmTimes: json['makerConfirmTimes'] as num,
      takerNotifyTimes: json['takerNotifyTimes'] as num,
      takerConfirmTimes: json['takerConfirmTimes'] as num,
      historyMakerCount: json['historyMakerCount'] as num,
      historyTakerCount: json['historyTakerCount'] as num,
      historyMakerPaidCount: json['historyMakerPaidCount'] as num,
      historyTakerPaidCount: json['historyTakerPaidCount'] as num,
      historyMakerCommission: json['historyMakerCommission'] as num,
    );

Map<String, dynamic> _$$_OtcMonthlyStatModelToJson(
        _$_OtcMonthlyStatModel instance) =>
    <String, dynamic>{
      'makerCount': instance.makerCount,
      'range': instance.range,
      'makerPaidCount': instance.makerPaidCount,
      'makerPaidStarCount': instance.makerPaidStarCount,
      'makerCommission': instance.makerCommission,
      'takerCount': instance.takerCount,
      'takerPaidCount': instance.takerPaidCount,
      'makerNotifyTimes': instance.makerNotifyTimes,
      'makerConfirmTimes': instance.makerConfirmTimes,
      'takerNotifyTimes': instance.takerNotifyTimes,
      'takerConfirmTimes': instance.takerConfirmTimes,
      'historyMakerCount': instance.historyMakerCount,
      'historyTakerCount': instance.historyTakerCount,
      'historyMakerPaidCount': instance.historyMakerPaidCount,
      'historyTakerPaidCount': instance.historyTakerPaidCount,
      'historyMakerCommission': instance.historyMakerCommission,
    };

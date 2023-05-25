// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'exoplanets_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ExoplanetsData _$ExoplanetsDataFromJson(Map<String, dynamic> json) =>
    ExoplanetsData(
      value: (json['value'] as num?)?.toDouble(),
      unit: json['unit'] as String?,
      errorMax: (json['error_max'] as num?)?.toDouble(),
      errorMin: (json['error_min'] as num?)?.toDouble(),
      bibcode: json['bibcode'] as String?,
    );

Map<String, dynamic> _$ExoplanetsDataToJson(ExoplanetsData instance) =>
    <String, dynamic>{
      'value': instance.value,
      'unit': instance.unit,
      'error_max': instance.errorMax,
      'error_min': instance.errorMin,
      'bibcode': instance.bibcode,
    };

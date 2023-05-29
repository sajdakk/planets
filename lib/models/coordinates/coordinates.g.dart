// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'coordinates.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Coordinates _$CoordinatesFromJson(Map<String, dynamic> json) => Coordinates(
      rightAscension: (json['right_ascension'] as num?)?.toDouble(),
      declination: (json['declination'] as num?)?.toDouble(),
      epoch: (json['epoch'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$CoordinatesToJson(Coordinates instance) =>
    <String, dynamic>{
      'right_ascension': instance.rightAscension,
      'declination': instance.declination,
      'epoch': instance.epoch,
    };

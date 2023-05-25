// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'equatorial_coordinates.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EquatorialCoordinates _$EquatorialCoordinatesFromJson(
        Map<String, dynamic> json) =>
    EquatorialCoordinates(
      rightAscension: (json['right_ascension'] as num?)?.toDouble(),
      declination: (json['declination'] as num?)?.toDouble(),
      epoch: (json['epoch'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$EquatorialCoordinatesToJson(
        EquatorialCoordinates instance) =>
    <String, dynamic>{
      'right_ascension': instance.rightAscension,
      'declination': instance.declination,
      'epoch': instance.epoch,
    };

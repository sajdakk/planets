import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:softnauts/models/equatorial_coordinates/equatorial_coordinates.dart';
import 'package:softnauts/models/exoplanets_data/exoplanets_data.dart';

import 'exoplanets_fields.dart';

part 'exoplanets.g.dart';

@JsonSerializable()
class Exoplanets extends Equatable {
  const Exoplanets({
    required this.name,
    required this.equatorialCoordinates,
    required this.mass,
    required this.radius,
    required this.inclination,
    required this.semiMajorAxis,
    required this.orbitalPeriod,
    required this.eccentricity,
    required this.omegaAngle,
    required this.anomalyAngle,
    required this.lambdaAngle,
    required this.timePeriastron,
    required this.timeConjonction,
    required this.angularDistance,
    required this.tzeroPrimaryTransit,
    required this.tzeroSecondaryTransit,
    required this.impactParameter,
    required this.tzeroRadialVelocity,
    required this.velocitySemiamplitude,
    required this.calculatedTemperature,
    required this.measuredTemperature,
    required this.hottestPointLongitude,
    required this.geometricAlbedo,
    required this.surfaceGravity,
    required this.detectionMethod,
    required this.massDetectionMethod,
    required this.radiusDetectionMethod,
    required this.parentStar,
  });

  factory Exoplanets.fromJson(Map<String, dynamic> json) {
    return _$ExoplanetsFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$ExoplanetsToJson(this);
  }

  @JsonKey(name: ExoplanetsFields.name)
  final String name;

  @JsonKey(name: ExoplanetsFields.equatorialCoordinates)
  final EquatorialCoordinates equatorialCoordinates;

  @JsonKey(name: ExoplanetsFields.mass)
  final ExoplanetsData? mass;

  @JsonKey(name: ExoplanetsFields.radius)
  final ExoplanetsData? radius;

  @JsonKey(name: ExoplanetsFields.inclination)
  final ExoplanetsData? inclination;

  @JsonKey(name: ExoplanetsFields.semiMajorAxis)
  final ExoplanetsData? semiMajorAxis;

  @JsonKey(name: ExoplanetsFields.orbitalPeriod)
  final ExoplanetsData? orbitalPeriod;

  @JsonKey(name: ExoplanetsFields.eccentricity)
  final ExoplanetsData? eccentricity;

  @JsonKey(name: ExoplanetsFields.omegaAngle)
  final ExoplanetsData? omegaAngle;

  @JsonKey(name: ExoplanetsFields.anomalyAngle)
  final ExoplanetsData? anomalyAngle;

  @JsonKey(name: ExoplanetsFields.lambdaAngle)
  final ExoplanetsData? lambdaAngle;

  @JsonKey(name: ExoplanetsFields.timePeriastron)
  final ExoplanetsData? timePeriastron;

  @JsonKey(name: ExoplanetsFields.timeConjonction)
  final ExoplanetsData? timeConjonction;

  @JsonKey(name: ExoplanetsFields.angularDistance)
  final ExoplanetsData? angularDistance;

  @JsonKey(name: ExoplanetsFields.tzeroPrimaryTransit)
  final ExoplanetsData? tzeroPrimaryTransit;

  @JsonKey(name: ExoplanetsFields.tzeroSecondaryTransit)
  final ExoplanetsData? tzeroSecondaryTransit;

  @JsonKey(name: ExoplanetsFields.impactParameter)
  final ExoplanetsData? impactParameter;

  @JsonKey(name: ExoplanetsFields.tzeroRadialVelocity)
  final ExoplanetsData? tzeroRadialVelocity;

  @JsonKey(name: ExoplanetsFields.velocitySemiamplitude)
  final ExoplanetsData? velocitySemiamplitude;

  @JsonKey(name: ExoplanetsFields.calculatedTemperature)
  final ExoplanetsData? calculatedTemperature;

  @JsonKey(name: ExoplanetsFields.measuredTemperature)
  final ExoplanetsData? measuredTemperature;

  @JsonKey(name: ExoplanetsFields.hottestPointLongitude)
  final ExoplanetsData? hottestPointLongitude;

  @JsonKey(name: ExoplanetsFields.geometricAlbedo)
  final ExoplanetsData? geometricAlbedo;

  @JsonKey(name: ExoplanetsFields.surfaceGravity)
  final ExoplanetsData? surfaceGravity;

  @JsonKey(name: ExoplanetsFields.detectionMethod)
  final String? detectionMethod;

  @JsonKey(name: ExoplanetsFields.massDetectionMethod)
  final String? massDetectionMethod;

  @JsonKey(name: ExoplanetsFields.radiusDetectionMethod)
  final String? radiusDetectionMethod;

  @JsonKey(name: ExoplanetsFields.parentStar)
  final String? parentStar;

  @override
  List<Object?> get props => <Object?>[
        name,
        equatorialCoordinates,
        mass,
        radius,
        inclination,
        semiMajorAxis,
        orbitalPeriod,
        eccentricity,
        omegaAngle,
        anomalyAngle,
        lambdaAngle,
        timePeriastron,
        timeConjonction,
        angularDistance,
        tzeroPrimaryTransit,
        tzeroSecondaryTransit,
        impactParameter,
        tzeroRadialVelocity,
        velocitySemiamplitude,
        calculatedTemperature,
        measuredTemperature,
        hottestPointLongitude,
        geometricAlbedo,
        surfaceGravity,
        detectionMethod,
        massDetectionMethod,
        radiusDetectionMethod,
        parentStar,
      ];
}

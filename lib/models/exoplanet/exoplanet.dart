import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:planets/planets.dart';

part 'exoplanet.g.dart';

@JsonSerializable()
class Exoplanet extends Equatable {
  const Exoplanet({
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

  factory Exoplanet.fromJson(Map<String, dynamic> json) {
    return _$ExoplanetFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$ExoplanetToJson(this);
  }

  @JsonKey(name: ExoplanetFields.name)
  final String name;

  @JsonKey(name: ExoplanetFields.equatorialCoordinates)
  final Coordinates equatorialCoordinates;

  @JsonKey(name: ExoplanetFields.mass)
  final ExoplanetData? mass;

  @JsonKey(name: ExoplanetFields.radius)
  final ExoplanetData? radius;

  @JsonKey(name: ExoplanetFields.inclination)
  final ExoplanetData? inclination;

  @JsonKey(name: ExoplanetFields.semiMajorAxis)
  final ExoplanetData? semiMajorAxis;

  @JsonKey(name: ExoplanetFields.orbitalPeriod)
  final ExoplanetData? orbitalPeriod;

  @JsonKey(name: ExoplanetFields.eccentricity)
  final ExoplanetData? eccentricity;

  @JsonKey(name: ExoplanetFields.omegaAngle)
  final ExoplanetData? omegaAngle;

  @JsonKey(name: ExoplanetFields.anomalyAngle)
  final ExoplanetData? anomalyAngle;

  @JsonKey(name: ExoplanetFields.lambdaAngle)
  final ExoplanetData? lambdaAngle;

  @JsonKey(name: ExoplanetFields.timePeriastron)
  final ExoplanetData? timePeriastron;

  @JsonKey(name: ExoplanetFields.timeConjonction)
  final ExoplanetData? timeConjonction;

  @JsonKey(name: ExoplanetFields.angularDistance)
  final ExoplanetData? angularDistance;

  @JsonKey(name: ExoplanetFields.tzeroPrimaryTransit)
  final ExoplanetData? tzeroPrimaryTransit;

  @JsonKey(name: ExoplanetFields.tzeroSecondaryTransit)
  final ExoplanetData? tzeroSecondaryTransit;

  @JsonKey(name: ExoplanetFields.impactParameter)
  final ExoplanetData? impactParameter;

  @JsonKey(name: ExoplanetFields.tzeroRadialVelocity)
  final ExoplanetData? tzeroRadialVelocity;

  @JsonKey(name: ExoplanetFields.velocitySemiamplitude)
  final ExoplanetData? velocitySemiamplitude;

  @JsonKey(name: ExoplanetFields.calculatedTemperature)
  final ExoplanetData? calculatedTemperature;

  @JsonKey(name: ExoplanetFields.measuredTemperature)
  final ExoplanetData? measuredTemperature;

  @JsonKey(name: ExoplanetFields.hottestPointLongitude)
  final ExoplanetData? hottestPointLongitude;

  @JsonKey(name: ExoplanetFields.geometricAlbedo)
  final ExoplanetData? geometricAlbedo;

  @JsonKey(name: ExoplanetFields.surfaceGravity)
  final ExoplanetData? surfaceGravity;

  @JsonKey(name: ExoplanetFields.detectionMethod)
  final String? detectionMethod;

  @JsonKey(name: ExoplanetFields.massDetectionMethod)
  final String? massDetectionMethod;

  @JsonKey(name: ExoplanetFields.radiusDetectionMethod)
  final String? radiusDetectionMethod;

  @JsonKey(name: ExoplanetFields.parentStar)
  final String? parentStar;

  String get displayName => name;

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

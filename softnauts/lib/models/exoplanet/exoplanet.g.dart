// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'exoplanet.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Exoplanet _$ExoplanetsFromJson(Map<String, dynamic> json) => Exoplanet(
      name: json['name'] as String,
      equatorialCoordinates: EquatorialCoordinates.fromJson(
          json['equatorial_coordinates'] as Map<String, dynamic>),
      mass: json['mass'] == null
          ? null
          : ExoplanetData.fromJson(json['mass'] as Map<String, dynamic>),
      radius: json['radius'] == null
          ? null
          : ExoplanetData.fromJson(json['radius'] as Map<String, dynamic>),
      inclination: json['inclination'] == null
          ? null
          : ExoplanetData.fromJson(
              json['inclination'] as Map<String, dynamic>),
      semiMajorAxis: json['semi_major_axis'] == null
          ? null
          : ExoplanetData.fromJson(
              json['semi_major_axis'] as Map<String, dynamic>),
      orbitalPeriod: json['orbital_period'] == null
          ? null
          : ExoplanetData.fromJson(
              json['orbital_period'] as Map<String, dynamic>),
      eccentricity: json['eccentricity'] == null
          ? null
          : ExoplanetData.fromJson(
              json['eccentricity'] as Map<String, dynamic>),
      omegaAngle: json['omega_angle'] == null
          ? null
          : ExoplanetData.fromJson(
              json['omega_angle'] as Map<String, dynamic>),
      anomalyAngle: json['anomaly_angle'] == null
          ? null
          : ExoplanetData.fromJson(
              json['anomaly_angle'] as Map<String, dynamic>),
      lambdaAngle: json['lambda_angle'] == null
          ? null
          : ExoplanetData.fromJson(
              json['lambda_angle'] as Map<String, dynamic>),
      timePeriastron: json['time_periastron'] == null
          ? null
          : ExoplanetData.fromJson(
              json['time_periastron'] as Map<String, dynamic>),
      timeConjonction: json['time_conjonction'] == null
          ? null
          : ExoplanetData.fromJson(
              json['time_conjonction'] as Map<String, dynamic>),
      angularDistance: json['angular_distance'] == null
          ? null
          : ExoplanetData.fromJson(
              json['angular_distance'] as Map<String, dynamic>),
      tzeroPrimaryTransit: json['tzero_primary_transit'] == null
          ? null
          : ExoplanetData.fromJson(
              json['tzero_primary_transit'] as Map<String, dynamic>),
      tzeroSecondaryTransit: json['tzero_secondary_transit'] == null
          ? null
          : ExoplanetData.fromJson(
              json['tzero_secondary_transit'] as Map<String, dynamic>),
      impactParameter: json['impact_parameter'] == null
          ? null
          : ExoplanetData.fromJson(
              json['impact_parameter'] as Map<String, dynamic>),
      tzeroRadialVelocity: json['tzero_radial_velocity'] == null
          ? null
          : ExoplanetData.fromJson(
              json['tzero_radial_velocity'] as Map<String, dynamic>),
      velocitySemiamplitude: json['velocity_semiamplitude'] == null
          ? null
          : ExoplanetData.fromJson(
              json['velocity_semiamplitude'] as Map<String, dynamic>),
      calculatedTemperature: json['calculated_temperature'] == null
          ? null
          : ExoplanetData.fromJson(
              json['calculated_temperature'] as Map<String, dynamic>),
      measuredTemperature: json['measured_temperature'] == null
          ? null
          : ExoplanetData.fromJson(
              json['measured_temperature'] as Map<String, dynamic>),
      hottestPointLongitude: json['hottest_point_longitude'] == null
          ? null
          : ExoplanetData.fromJson(
              json['hottest_point_longitude'] as Map<String, dynamic>),
      geometricAlbedo: json['geometric_albedo'] == null
          ? null
          : ExoplanetData.fromJson(
              json['geometric_albedo'] as Map<String, dynamic>),
      surfaceGravity: json['surface_gravity'] == null
          ? null
          : ExoplanetData.fromJson(
              json['surface_gravity'] as Map<String, dynamic>),
      detectionMethod: json['detection_method'] as String?,
      massDetectionMethod: json['mass_detection_method'] as String?,
      radiusDetectionMethod: json['radius_detection_method'] as String?,
      parentStar: json['parent_star'] as String?,
    );

Map<String, dynamic> _$ExoplanetsToJson(Exoplanet instance) =>
    <String, dynamic>{
      'name': instance.name,
      'equatorial_coordinates': instance.equatorialCoordinates,
      'mass': instance.mass,
      'radius': instance.radius,
      'inclination': instance.inclination,
      'semi_major_axis': instance.semiMajorAxis,
      'orbital_period': instance.orbitalPeriod,
      'eccentricity': instance.eccentricity,
      'omega_angle': instance.omegaAngle,
      'anomaly_angle': instance.anomalyAngle,
      'lambda_angle': instance.lambdaAngle,
      'time_periastron': instance.timePeriastron,
      'time_conjonction': instance.timeConjonction,
      'angular_distance': instance.angularDistance,
      'tzero_primary_transit': instance.tzeroPrimaryTransit,
      'tzero_secondary_transit': instance.tzeroSecondaryTransit,
      'impact_parameter': instance.impactParameter,
      'tzero_radial_velocity': instance.tzeroRadialVelocity,
      'velocity_semiamplitude': instance.velocitySemiamplitude,
      'calculated_temperature': instance.calculatedTemperature,
      'measured_temperature': instance.measuredTemperature,
      'hottest_point_longitude': instance.hottestPointLongitude,
      'geometric_albedo': instance.geometricAlbedo,
      'surface_gravity': instance.surfaceGravity,
      'detection_method': instance.detectionMethod,
      'mass_detection_method': instance.massDetectionMethod,
      'radius_detection_method': instance.radiusDetectionMethod,
      'parent_star': instance.parentStar,
    };

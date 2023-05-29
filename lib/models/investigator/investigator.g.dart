// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'investigator.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Investigator _$InvestigatorFromJson(Map<String, dynamic> json) => Investigator(
      url: json['url'] as String?,
      firstName: json['first_name'] as String?,
      middleName: json['middle_name'] as String?,
      initials: (json['initials'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          [],
      lastName: json['last_name'] as String?,
    );

Map<String, dynamic> _$InvestigatorToJson(Investigator instance) =>
    <String, dynamic>{
      'url': instance.url,
      'first_name': instance.firstName,
      'middle_name': instance.middleName,
      'initials': instance.initials,
      'last_name': instance.lastName,
    };

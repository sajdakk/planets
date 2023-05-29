// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'programme.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Programme _$ProgrammeFromJson(Map<String, dynamic> json) => Programme(
      identifier: json['identifier'] as String,
      investigatorsList: json['investigators_list'] as String?,
      investigators: (json['investigators'] as List<dynamic>)
          .map((e) => Investigator.fromJson(e as Map<String, dynamic>))
          .toList(),
      title: json['title'] as String?,
      abstract: json['abstract'] as String?,
      abstractUrl: json['abstract_url'] as String?,
      fullDetailsUrl: json['full_details_url'] as String?,
    );

Map<String, dynamic> _$ProgrammeToJson(Programme instance) => <String, dynamic>{
      'identifier': instance.identifier,
      'investigators_list': instance.investigatorsList,
      'investigators': instance.investigators,
      'title': instance.title,
      'abstract': instance.abstract,
      'abstract_url': instance.abstractUrl,
      'full_details_url': instance.fullDetailsUrl,
    };

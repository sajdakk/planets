// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'activity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Activity _$ActivitiesFromJson(Map<String, dynamic> json) => Activity(
      id: json['id'] as int,
      creationDate: json['creation_date'] == null
          ? null
          : DateTime.parse(json['creation_date'] as String),
      date:
          json['date'] == null ? null : DateTime.parse(json['date'] as String),
      links:
          (json['links'] as List<dynamic>?)?.map((e) => e as String).toList() ??
              [],
      title: json['title'] as String,
      content: json['content'] as String,
      label: json['label'] as String,
      profile: json['profile'] as String,
      observingSite: json['observing_site'] as String?,
      telescope: json['telescope'] as String?,
      instrument: json['instrument'] as String?,
      programme: json['programme'] as String?,
      programmeType: json['programme_type'] as String,
      targetName: json['target_name'] as String,
      coordinates: json['coordinates'] as String?,
      organisation: json['organisation'] as String,
      collaboration: json['collaboration'] as String?,
    );

Map<String, dynamic> _$ActivitiesToJson(Activity instance) =>
    <String, dynamic>{
      'id': instance.id,
      'creation_date': instance.creationDate?.toIso8601String(),
      'date': instance.date?.toIso8601String(),
      'links': instance.links,
      'title': instance.title,
      'content': instance.content,
      'label': instance.label,
      'profile': instance.profile,
      'observing_site': instance.observingSite,
      'telescope': instance.telescope,
      'instrument': instance.instrument,
      'programme': instance.programme,
      'programme_type': instance.programmeType,
      'target_name': instance.targetName,
      'coordinates': instance.coordinates,
      'organisation': instance.organisation,
      'collaboration': instance.collaboration,
    };

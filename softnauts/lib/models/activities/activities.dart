import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:softnauts/extensions/_extensions.dart';

import 'activities_fields.dart';

part 'activities.g.dart';

@JsonSerializable()
class Activities extends Equatable {
  const Activities({
    required this.id,
    required this.creationDate,
    required this.date,
    required this.links,
    required this.title,
    required this.content,
    required this.label,
    required this.profile,
    required this.observingSite,
    required this.telescope,
    required this.instrument,
    required this.programme,
    required this.programmeType,
    required this.targetName,
    required this.coordinates,
    required this.organisation,
    required this.collaboration,
  });

  factory Activities.fromJson(Map<String, dynamic> json) {
    Activities a = _$ActivitiesFromJson(json);
    return a;
  }

  Map<String, dynamic> toJson() {
    return _$ActivitiesToJson(this);
  }

  @JsonKey(name: ActivitiesFields.id)
  final int id;

  @JsonKey(name: ActivitiesFields.creationDate)
  final DateTime? creationDate;

  @JsonKey(name: ActivitiesFields.date)
  final DateTime? date;

  @JsonKey(name: ActivitiesFields.links, defaultValue: <String>[])
  final List<String> links;

  @JsonKey(name: ActivitiesFields.title)
  final String title;

  @JsonKey(name: ActivitiesFields.content)
  final String content;

  @JsonKey(name: ActivitiesFields.label)
  final String label;

  @JsonKey(name: ActivitiesFields.profile)
  final String profile;

  @JsonKey(name: ActivitiesFields.observingSite)
  final String? observingSite;

  @JsonKey(name: ActivitiesFields.telescope)
  final String? telescope;

  @JsonKey(name: ActivitiesFields.instrument)
  final String? instrument;

  @JsonKey(name: ActivitiesFields.programme)
  final String? programme;

  @JsonKey(name: ActivitiesFields.programmeType)
  final String programmeType;

  @JsonKey(name: ActivitiesFields.targetName)
  final String targetName;

  @JsonKey(name: ActivitiesFields.coordinates)
  final String? coordinates;

  @JsonKey(name: ActivitiesFields.organisation)
  final String organisation;

  @JsonKey(name: ActivitiesFields.collaboration)
  final String? collaboration;

  String get displayName {
    String name = '';

    if (targetName.isNotEmpty) {
      name += '$targetName, ';
    } else {
      name += '<empty>, ';
    }

    if (creationDate != null) {
      name += '${creationDate!.readable()}, ';
    } else {
      name += '<empty>, ';
    }

    if (date != null) {
      name += date!.readable();
    } else {
      name += '<empty>';
    }

    return name;
  }

  @override
  List<Object?> get props => <Object?>[
        id,
        creationDate,
        date,
        links,
        title,
        content,
        label,
        profile,
        observingSite,
        telescope,
        instrument,
        programme,
        programmeType,
        targetName,
        coordinates,
        organisation,
        collaboration,
      ];
}

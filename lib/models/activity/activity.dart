import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:softnauts/models/programme/programme.dart';
import 'package:softnauts/softnauts.dart';

part 'activity.g.dart';

@JsonSerializable()
class Activity extends Equatable {
  const Activity({
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

  factory Activity.fromJson(Map<String, dynamic> json) {
    return _$ActivityFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$ActivityToJson(this);
  }

  @JsonKey(name: ActivityFields.id)
  final int id;

  @JsonKey(name: ActivityFields.creationDate)
  final DateTime? creationDate;

  @JsonKey(name: ActivityFields.date)
  final DateTime? date;

  @JsonKey(name: ActivityFields.links, defaultValue: <String>[])
  final List<String> links;

  @JsonKey(name: ActivityFields.title)
  final String title;

  @JsonKey(name: ActivityFields.content)
  final String content;

  @JsonKey(name: ActivityFields.label)
  final String label;

  @JsonKey(name: ActivityFields.profile)
  final String profile;

  @JsonKey(name: ActivityFields.observingSite)
  final String? observingSite;

  @JsonKey(name: ActivityFields.telescope)
  final String? telescope;

  @JsonKey(name: ActivityFields.instrument)
  final String? instrument;

  @JsonKey(name: ActivityFields.programme)
  final Programme? programme;

  @JsonKey(name: ActivityFields.programmeType)
  final String programmeType;

  @JsonKey(name: ActivityFields.targetName)
  final String targetName;

  @JsonKey(name: ActivityFields.coordinates)
  final Coordinates? coordinates;

  @JsonKey(name: ActivityFields.organisation)
  final String? organisation;

  @JsonKey(name: ActivityFields.collaboration)
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

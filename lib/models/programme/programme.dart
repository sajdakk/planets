import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:planets/planets.dart';

part 'programme.g.dart';

@JsonSerializable()
class Programme extends Equatable {
  const Programme({
    required this.identifier,
    required this.investigatorsList,
    required this.investigators,
    required this.title,
    required this.abstract,
    required this.abstractUrl,
    required this.fullDetailsUrl,
  });

  factory Programme.fromJson(Map<String, dynamic> json) {
    return _$ProgrammeFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$ProgrammeToJson(this);
  }

  @JsonKey(name: ProgrammeFields.identifier)
  final String identifier;

  @JsonKey(name: ProgrammeFields.investigatorsList)
  final String? investigatorsList;

  @JsonKey(name: ProgrammeFields.investigators)
  final List<Investigator> investigators;

  @JsonKey(name: ProgrammeFields.title)
  final String? title;

  @JsonKey(name: ProgrammeFields.abstract)
  final String? abstract;

  @JsonKey(name: ProgrammeFields.abstractUrl)
  final String? abstractUrl;

  @JsonKey(name: ProgrammeFields.fullDetailsUrl)
  final String? fullDetailsUrl;

  String get displayName {
    String name = 'identifier: $identifier,\n';

    if (investigatorsList != null && investigatorsList != '') {
      name += 'investigators list: $investigatorsList,\n';
    } else {
      name += 'investigators list: <empty>,\n';
    }

    if (investigators.isNotEmpty) {
      name +=
          'investigators:\n${investigators.map((Investigator investigator) => 'investigator: ${investigator.displayName}').join('\n')},\n';
    }

    if (title != null && title != '') {
      name += 'title: $title,\n';
    } else {
      name += 'title: <empty>,\n';
    }

    if (abstract != null && abstract != '') {
      name += 'abstract: $abstract,\n';
    } else {
      name += 'abstract: <empty>,\n';
    }

    if (abstractUrl != null && abstractUrl != '') {
      name += 'abstract url: $abstractUrl,\n';
    } else {
      name += 'abstract url: <empty>,\n';
    }

    if (fullDetailsUrl != null && fullDetailsUrl != '') {
      name += 'full details url: $fullDetailsUrl';
    } else {
      name += 'full details url: <empty>';
    }

    return name;
  }

  @override
  List<Object?> get props => <Object?>[
        identifier,
        investigatorsList,
        investigators,
        title,
        abstract,
        abstractUrl,
        fullDetailsUrl,
      ];
}

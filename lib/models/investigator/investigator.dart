import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

import '_investigator.dart';

part 'investigator.g.dart';

@JsonSerializable()
class Investigator extends Equatable {
  const Investigator({
    required this.url,
    required this.firstName,
    required this.middleName,
    required this.initials,
    required this.lastName,
  });

  factory Investigator.fromJson(Map<String, dynamic> json) {
    return _$InvestigatorFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$InvestigatorToJson(this);
  }

  @JsonKey(name: InvestigatorFields.url)
  final String? url;

  @JsonKey(name: InvestigatorFields.firstName)
  final String? firstName;

  @JsonKey(name: InvestigatorFields.middleName)
  final String? middleName;

  @JsonKey(name: InvestigatorFields.initials, defaultValue: <String>[])
  final List<String> initials;

  @JsonKey(name: InvestigatorFields.lastName)
  final String? lastName;

  String get displayName {
    String name = '';

    if (url != null && url != '') {
      name += 'url: $url, ';
    } else {
      name += 'url: <empty>, ';
    }

    if (firstName != null && firstName != '') {
      name += 'first name: $firstName ';
    } else {
      name += 'first name: <empty>, ';
    }

    if (middleName != null && middleName != '') {
      name += 'middle name: $middleName ';
    } else {
      name += 'middle name: <empty>, ';
    }

    if (initials.isNotEmpty) {
      name += 'initials: ${initials.map((String initials) => initials).join(', ')}, ';
    }

    if (lastName != null && lastName != '') {
      name += 'last name: $lastName ';
    } else {
      name += 'last name: <empty>, ';
    }

    return name;
  }

  @override
  List<Object?> get props => <Object?>[
        url,
        firstName,
        middleName,
        initials,
        lastName,
      ];
}

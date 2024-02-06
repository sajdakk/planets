import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:planets/planets.dart';

part 'coordinates.g.dart';

@JsonSerializable()
class Coordinates extends Equatable {
  const Coordinates({
    required this.rightAscension,
    required this.declination,
    required this.epoch,
  });

  factory Coordinates.fromJson(Map<String, dynamic> json) {
    return _$CoordinatesFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$CoordinatesToJson(this);
  }

  @JsonKey(name: CoordinatesFields.rightAscension)
  final double? rightAscension;

  @JsonKey(name: CoordinatesFields.declination)
  final double? declination;

  @JsonKey(name: CoordinatesFields.epoch)
  final double? epoch;

  String get displayName {
    String name = '';

    if (rightAscension != null) {
      name += 'right ascension: $rightAscension,\n';
    } else {
      name += 'right ascension: <empty>,\n';
    }

    if (declination != null) {
      name += 'declination: $declination,\n';
    } else {
      name += 'declination: <empty>,\n';
    }

    if (epoch != null) {
      name += 'epoch: $epoch';
    } else {
      name += 'epoch: <empty>';
    }

    return name;
  }

  @override
  List<Object?> get props => <Object?>[
        rightAscension,
        declination,
        epoch,
      ];
}

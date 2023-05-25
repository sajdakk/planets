import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

import 'equatorial_coordinates_fields.dart';

part 'equatorial_coordinates.g.dart';

@JsonSerializable()
class EquatorialCoordinates extends Equatable {
  const EquatorialCoordinates({
    required this.rightAscension,
    required this.declination,
    required this.epoch,
  });

  factory EquatorialCoordinates.fromJson(Map<String, dynamic> json) {
    return _$EquatorialCoordinatesFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$EquatorialCoordinatesToJson(this);
  }

  @JsonKey(name: EquatorialCoordinatesFields.rightAscension)
  final double? rightAscension;

  @JsonKey(name: EquatorialCoordinatesFields.declination)
  final double? declination;

  @JsonKey(name: EquatorialCoordinatesFields.epoch)
  final double? epoch;

  @override
  List<Object?> get props => <Object?>[
        rightAscension,
        declination,
        epoch,
      ];
}

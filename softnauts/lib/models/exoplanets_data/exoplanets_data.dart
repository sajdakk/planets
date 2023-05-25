import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

import 'exoplanets_data_fields.dart';

part 'exoplanets_data.g.dart';

@JsonSerializable()
class ExoplanetsData extends Equatable {
  const ExoplanetsData({
    required this.value,
    required this.unit,
    required this.errorMax,
    required this.errorMin,
    required this.bibcode,
  });

  factory ExoplanetsData.fromJson(Map<String, dynamic> json) {
    return _$ExoplanetsDataFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$ExoplanetsDataToJson(this);
  }

  @JsonKey(name: ExoplanetsDataFields.value)
  final double? value;

  @JsonKey(name: ExoplanetsDataFields.unit)
  final String? unit;

  @JsonKey(name: ExoplanetsDataFields.errorMax)
  final double? errorMax;

  @JsonKey(name: ExoplanetsDataFields.errorMin)
  final double? errorMin;

  @JsonKey(name: ExoplanetsDataFields.bibcode)
  final String? bibcode;

  @override
  List<Object?> get props => <Object?>[
        value,
        unit,
        errorMax,
        errorMin,
        bibcode,
      ];
}

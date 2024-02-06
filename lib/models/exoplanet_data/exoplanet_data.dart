import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:planets/planets.dart';

part 'exoplanet_data.g.dart';

@JsonSerializable()
class ExoplanetData extends Equatable {
  const ExoplanetData({
    required this.value,
    required this.unit,
    required this.errorMax,
    required this.errorMin,
    required this.bibcode,
  });

  factory ExoplanetData.fromJson(Map<String, dynamic> json) {
    return _$ExoplanetDataFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$ExoplanetDataToJson(this);
  }

  @JsonKey(name: ExoplanetDataFields.value)
  final double? value;

  @JsonKey(name: ExoplanetDataFields.unit)
  final String? unit;

  @JsonKey(name: ExoplanetDataFields.errorMax)
  final double? errorMax;

  @JsonKey(name: ExoplanetDataFields.errorMin)
  final double? errorMin;

  @JsonKey(name: ExoplanetDataFields.bibcode)
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

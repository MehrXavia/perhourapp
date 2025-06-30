import 'package:json_annotation/json_annotation.dart'; 

part 'service_prams.g.dart'; 

@JsonSerializable(nullable: false, ignoreUnannotated: false)
class ServicePrams {
  @JsonKey(name: 'lon')
  double? lon;
  @JsonKey(name: 'lat')
  double ? lat;
  @JsonKey(name: 'countryCode')
  String ? countryCode;

  ServicePrams({this.lon, this.lat, this.countryCode});

   factory ServicePrams.fromJson(Map<String, dynamic> json) => _$ServicePramsFromJson(json);

   Map<String, dynamic> toJson() => _$ServicePramsToJson(this);
}


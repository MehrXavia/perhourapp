import 'package:json_annotation/json_annotation.dart'; 

part 'mobile_params.g.dart'; 

@JsonSerializable(ignoreUnannotated: true)
class MobileParams {
  @JsonKey(name: 'mobile')
  String? mobile;

  MobileParams({this.mobile});

   factory MobileParams.fromJson(Map<String, dynamic> json) => _$MobileParamsFromJson(json);

   Map<String, dynamic> toJson() => _$MobileParamsToJson(this);
}


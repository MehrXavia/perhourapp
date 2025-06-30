import 'package:json_annotation/json_annotation.dart'; 

part 'nationality_dto.g.dart'; 

@JsonSerializable(ignoreUnannotated: false)
class NationalityDto {
  @JsonKey(name: 'id')
  int? id;
  @JsonKey(name: 'name')
  String? name;
  @JsonKey(name: 'nameAr')
  String? nameAr;
  @JsonKey(name: 'code')
  String? code;
  @JsonKey(name: 'continent')
  String? continent;

  NationalityDto({this.id, this.name, this.nameAr, this.code, this.continent});

   factory NationalityDto.fromJson(Map<String, dynamic> json) => _$NationalityDtoFromJson(json);

   Map<String, dynamic> toJson() => _$NationalityDtoToJson(this);
}


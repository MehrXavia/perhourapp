import 'package:json_annotation/json_annotation.dart'; 

part 'image_dto.g.dart'; 

@JsonSerializable(ignoreUnannotated: false)
class ImageDto {
  @JsonKey(name: 'id')
  int? id;
  @JsonKey(name: 'fileName')
  String? fileName;
  @JsonKey(name: 'url')
  String? url;

  ImageDto({this.id, this.fileName, this.url});

   factory ImageDto.fromJson(Map<String, dynamic> json) => _$ImageDtoFromJson(json);

   Map<String, dynamic> toJson() => _$ImageDtoToJson(this);
}


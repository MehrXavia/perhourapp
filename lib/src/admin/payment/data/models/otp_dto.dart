import 'package:json_annotation/json_annotation.dart'; 

part 'otp_dto.g.dart'; 

@JsonSerializable(ignoreUnannotated: false)
class OtpDto {
  @JsonKey(name: 'id')
  int? id;
  @JsonKey(name: 'email')
  String? email;
  @JsonKey(name: 'otp')
  String? otp;

  OtpDto({this.id, this.email, this.otp});

   factory OtpDto.fromJson(Map<String, dynamic> json) => _$OtpDtoFromJson(json);

   Map<String, dynamic> toJson() => _$OtpDtoToJson(this);
}


import 'package:json_annotation/json_annotation.dart'; 

part 'send_otp_params.g.dart'; 

@JsonSerializable(ignoreUnannotated: false)
class SendOtpParams {
  @JsonKey(name: 'email')
  String? email;

  SendOtpParams({this.email});

   factory SendOtpParams.fromJson(Map<String, dynamic> json) => _$SendOtpParamsFromJson(json);

   Map<String, dynamic> toJson() => _$SendOtpParamsToJson(this);
}


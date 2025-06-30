import 'package:json_annotation/json_annotation.dart'; 

part 'verify_otp_params.g.dart';

@JsonSerializable(ignoreUnannotated: false)
class VerifyOtpParams {
  @JsonKey(name: 'email')
  String? email;
  @JsonKey(name: 'OTP')
  String? otp;

  VerifyOtpParams({this.email, this.otp});

   factory VerifyOtpParams.fromJson(Map<String, dynamic> json) => _$VerifyOtpParamsFromJson(json);

   Map<String, dynamic> toJson() => _$VerifyOtpParamsToJson(this);
}


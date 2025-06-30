import 'package:json_annotation/json_annotation.dart'; 

part 'verify_code_params.g.dart'; 

@JsonSerializable(ignoreUnannotated: true)
class VerifyCodeParams {
  @JsonKey(name: 'mobile')
  String? mobile;
  @JsonKey(name: 'sms_code')
  String? smsCode;

  VerifyCodeParams({this.mobile, this.smsCode});

   factory VerifyCodeParams.fromJson(Map<String, dynamic> json) => _$VerifyCodeParamsFromJson(json);

   Map<String, dynamic> toJson() => _$VerifyCodeParamsToJson(this);
}


// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'verify_code_params.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VerifyCodeParams _$VerifyCodeParamsFromJson(Map<String, dynamic> json) =>
    VerifyCodeParams(
      mobile: json['mobile'] as String?,
      smsCode: json['sms_code'] as String?,
    );

Map<String, dynamic> _$VerifyCodeParamsToJson(VerifyCodeParams instance) =>
    <String, dynamic>{
      'mobile': instance.mobile,
      'sms_code': instance.smsCode,
    };

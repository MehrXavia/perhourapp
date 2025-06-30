// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'verify_otp_params.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VerifyOtpParams _$VerifyOtpParamsFromJson(Map<String, dynamic> json) =>
    VerifyOtpParams(
      email: json['email'] as String?,
      otp: json['OTP'] as String?,
    );

Map<String, dynamic> _$VerifyOtpParamsToJson(VerifyOtpParams instance) =>
    <String, dynamic>{
      'email': instance.email,
      'OTP': instance.otp,
    };

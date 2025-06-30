// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'otp_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OtpDto _$OtpDtoFromJson(Map<String, dynamic> json) => OtpDto(
      id: json['id'] as int?,
      email: json['email'] as String?,
      otp: json['otp'] as String?,
    );

Map<String, dynamic> _$OtpDtoToJson(OtpDto instance) => <String, dynamic>{
      'id': instance.id,
      'email': instance.email,
      'otp': instance.otp,
    };

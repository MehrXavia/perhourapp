// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_support_params.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AddSupportParams _$AddSupportParamsFromJson(Map<String, dynamic> json) =>
    AddSupportParams(
      userId: json['userId'] as int?,
      messageTypeId: json['messageTypeId'] as int?,
      message: json['message'] as String?,
      email: json['email'] as String?,
      createdDate: json['createdDate'] as String?,
      isDeledted: json['isDeledted'] as bool?,
    );

Map<String, dynamic> _$AddSupportParamsToJson(AddSupportParams instance) =>
    <String, dynamic>{
      'userId': instance.userId,
      'messageTypeId': instance.messageTypeId,
      'message': instance.message,
      'createdDate': instance.createdDate,
      'email': instance.email,
      'isDeledted': instance.isDeledted,
    };

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_service_pramt.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AddServicePramt _$AddServicePramtFromJson(Map<String, dynamic> json) =>
    AddServicePramt(
      serviceProviderId: json['serviceProviderId'] as String?,
      id: json['id'] as int?,
      serviceId: json['serviceId'] as int?,
      description: json['description'] as String?,
      price: json['price'] as int?,
      experience: json['experience'] as int?,
      currency: json['currency'] as String?,
    );

Map<String, dynamic> _$AddServicePramtToJson(AddServicePramt instance) =>
    <String, dynamic>{
      'serviceProviderId': instance.serviceProviderId,
      'id': instance.id,
      'serviceId': instance.serviceId,
      'description': instance.description,
      'price': instance.price,
      'experience': instance.experience,
      'currency': instance.currency,
    };

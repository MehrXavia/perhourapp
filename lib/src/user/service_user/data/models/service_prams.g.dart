// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'service_prams.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ServicePrams _$ServicePramsFromJson(Map<String, dynamic> json) => ServicePrams(
      lon: (json['lon'] as num?)?.toDouble(),
      lat: (json['lat'] as num?)?.toDouble(),
      countryCode: json['countryCode'] as String?,
    );

Map<String, dynamic> _$ServicePramsToJson(ServicePrams instance) =>
    <String, dynamic>{
      'lon': instance.lon,
      'lat': instance.lat,
      'countryCode': instance.countryCode,
    };

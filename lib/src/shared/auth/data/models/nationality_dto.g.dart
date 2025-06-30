// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'nationality_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NationalityDto _$NationalityDtoFromJson(Map<String, dynamic> json) =>
    NationalityDto(
      id: json['id'] as int?,
      name: json['name'] as String?,
      nameAr: json['nameAr'] as String?,
      code: json['code'] as String?,
      continent: json['continent'] as String?,
    );

Map<String, dynamic> _$NationalityDtoToJson(NationalityDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'nameAr': instance.nameAr,
      'code': instance.code,
      'continent': instance.continent,
    };

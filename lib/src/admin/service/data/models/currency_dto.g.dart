// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'currency_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CurrencyDto _$CurrencyDtoFromJson(Map<String, dynamic> json) => CurrencyDto(
      currencyAr: json['currencyAr'] as String?,
      currencyEn: json['currencyEn'] as String?,
      id: json['id'] as int?,
    );

Map<String, dynamic> _$CurrencyDtoToJson(CurrencyDto instance) =>
    <String, dynamic>{
      'currencyAr': instance.currencyAr,
      'currencyEn': instance.currencyEn,
      'id': instance.id,
    };

import 'package:json_annotation/json_annotation.dart'; 

part 'currency_dto.g.dart'; 

@JsonSerializable(ignoreUnannotated: false)
class CurrencyDto {
  @JsonKey(name: 'currencyAr')
  String? currencyAr;
  @JsonKey(name: 'currencyEn')
  String? currencyEn;
  @JsonKey(name: 'id')
  int? id;

  CurrencyDto({this.currencyAr, this.currencyEn, this.id});

   factory CurrencyDto.fromJson(Map<String, dynamic> json) => _$CurrencyDtoFromJson(json);

   Map<String, dynamic> toJson() => _$CurrencyDtoToJson(this);
}


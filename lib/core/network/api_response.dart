import 'package:json_annotation/json_annotation.dart';
import 'package:onservice24/core/di/injector.dart';


part 'api_response.g.dart';

@JsonSerializable(genericArgumentFactories: true)
class ApiResponse<T> {
  String? status;
  int? code;
  String? messageEN;
  String? messageAR;
  T? data;


  ApiResponse({ this.messageEN,  this.messageAR, this.data});

  factory ApiResponse.fromJson(
    Map<String, dynamic> json,
    T Function(Object?) toJsonT,
  ) => _$ApiResponseFromJson(json, toJsonT);

  message() {
    return injector<ServicesLocator>().languageCode == 'ar' ?messageAR  :messageEN ;
  }
}

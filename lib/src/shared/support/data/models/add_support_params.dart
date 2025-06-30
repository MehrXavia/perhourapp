import 'package:json_annotation/json_annotation.dart'; 

part 'add_support_params.g.dart'; 

@JsonSerializable(ignoreUnannotated: false)
class AddSupportParams {

  @JsonKey(name: 'userId')
  int? userId;
  @JsonKey(name: 'messageTypeId')
  int? messageTypeId;
  @JsonKey(name: 'message')
  String? message;
  @JsonKey(name: 'createdDate')
  String? createdDate;
  @JsonKey(name: 'email')
  String? email;
  @JsonKey(name: 'isDeledted')
  bool? isDeledted;

  AddSupportParams({ this.userId, this.messageTypeId, this.message, this.email, this.createdDate, this.isDeledted});

   factory AddSupportParams.fromJson(Map<String, dynamic> json) => _$AddSupportParamsFromJson(json);

   Map<String, dynamic> toJson() => _$AddSupportParamsToJson(this);
}


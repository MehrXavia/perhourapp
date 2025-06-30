import 'package:json_annotation/json_annotation.dart'; 

part 'register_params.g.dart'; 

@JsonSerializable(ignoreUnannotated: false)
class RegisterParams {
  @JsonKey(name: 'id')
  int? id;
  @JsonKey(name: 'firstName')
  String? firstName;
  @JsonKey(name: 'lastName')
  String? lastName;
  @JsonKey(name: 'phoneNumber')
  String? phoneNumber;
  @JsonKey(name: 'email')
  String? email;
  @JsonKey(name: 'type')
  String? type;
  @JsonKey(name: 'lat')
  double? lat;
  @JsonKey(name: 'lng')
  double? lng;
  @JsonKey(name: 'gender')
  String? gender;
  @JsonKey(name: 'nationalityId',includeIfNull: false)
  int? nationalityId;
  @JsonKey(name: 'photoId',includeIfNull: false)
  int? photoId;
  @JsonKey(name: 'identityPhotoId',includeIfNull: false)
  int? identityPhotoId;
  @JsonKey(name: 'rateing')
  int? rateing;
  @JsonKey(name: 'typeOfFile')
  int? typeOfFile;
  @JsonKey(name: 'isSendNotification')
  bool? isSendNotification;
  @JsonKey(name: 'slno',includeIfNull: false)
  String? slno;
  @JsonKey(name: 'companyTradeNumber')
  String? companyTradeNumber;
  @JsonKey(name: 'companyName',includeIfNull: false)
  String? companyName;
  @JsonKey(name: 'createdDate')
  String? createdDate;
  @JsonKey(name: 'isDeleted')
  bool? isDeleted;
  @JsonKey(name: 'fcm')
  String? fcm;
  @JsonKey(name: 'fingerprint')
  String? fingerprint;
  @JsonKey(name: 'isverified')
  bool? isverified;
  @JsonKey(name: 'status')
  bool? status;
  @JsonKey(name: 'facebook')
  String? facebook;
  @JsonKey(name: 'twitter')
  String? twitter;
  @JsonKey(name: 'insagram')
  String? insagram;
  @JsonKey(name: 'linkedin')
  String? linkedin;
  @JsonKey(name: 'loginDate')
  String? loginDate;
  @JsonKey(name: 'isLogedOut')
  bool? isLogedOut;
  @JsonKey(name: 'logoutDate')
  String? logoutDate;
  @JsonKey(name: 'countryCode')
  String? countryCode;

  /*
    "isLogedOut": true,
  "logoutDate": "string",
  "loginDate": "string"
   */

  RegisterParams({this.id, this.firstName,this.logoutDate,this.isLogedOut,this.loginDate, this.lastName, this.phoneNumber, this.email, this.type, this.lat, this.lng, this.gender, this.nationalityId, this.photoId, this.identityPhotoId, this.rateing, this.typeOfFile, this.isSendNotification, this.slno, this.companyTradeNumber, this.companyName, this.createdDate, this.isDeleted, this.fcm, this.fingerprint, this.isverified, this.status, this.facebook, this.twitter, this.insagram, this.linkedin, this.countryCode});

   factory RegisterParams.fromJson(Map<String, dynamic> json) => _$RegisterParamsFromJson(json);

   Map<String, dynamic> toJson() => _$RegisterParamsToJson(this);
}


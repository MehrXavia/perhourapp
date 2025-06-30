import 'package:json_annotation/json_annotation.dart'; 

part 'profile_dto.g.dart'; 

@JsonSerializable(ignoreUnannotated: false)
class ProfileDto {
  @JsonKey(name: 'id')
  int? id;
  @JsonKey(name: 'firstName')
  String? firstName;
  @JsonKey(name: 'identityPhotoId')
  int? identityPhotoId;
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
  @JsonKey(name: 'nationalityId')
  int? nationalityId;
  @JsonKey(name: 'nationalityName')
  String? nationalityName;
  @JsonKey(name: 'photoId')
  int? photoId;
  @JsonKey(name: 'imageUrl')
  String? imageUrl;
  @JsonKey(name: 'rateing')
  int? rateing;
  @JsonKey(name: 'typeOfFile')
  int? typeOfFile;
  @JsonKey(name: 'isSendNotification')
  bool? isSendNotification;
  @JsonKey(name: 'slno')
  String? slno;
  @JsonKey(name: 'companyName')
  String? companyName;
  @JsonKey(name: 'createdDate')
  String? createdDate;
  @JsonKey(name: 'isDeleted')
  bool? isDeleted;
  @JsonKey(name: 'fcm')
  String? fcm;
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
  @JsonKey(name: 'isLogedOut')
  bool? isLogedOut;
  @JsonKey(name: 'companyTradeNumber')
  String? companyTradeNumber;
  @JsonKey(name: 'loginDate')
  String? loginDate;
  @JsonKey(name: 'logoutDate')
  String? logoutDate;
  @JsonKey(name: 'countryCode')
  String? countryCode;


  ProfileDto({this.id,this.loginDate,this.logoutDate,this.identityPhotoId,this.isLogedOut,this.companyTradeNumber, this.firstName, this.lastName, this.phoneNumber, this.email, this.type, this.lat, this.lng, this.gender, this.nationalityId, this.nationalityName, this.photoId, this.imageUrl, this.rateing, this.typeOfFile, this.isSendNotification, this.slno, this.companyName, this.createdDate, this.isDeleted, this.fcm, this.isverified, this.status, this.facebook, this.twitter, this.insagram, this.linkedin, this.countryCode});

   factory ProfileDto.fromJson(Map<String, dynamic> json) => _$ProfileDtoFromJson(json);

   Map<String, dynamic> toJson() => _$ProfileDtoToJson(this);
}


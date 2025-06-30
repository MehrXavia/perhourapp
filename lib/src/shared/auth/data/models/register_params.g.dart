// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'register_params.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RegisterParams _$RegisterParamsFromJson(Map<String, dynamic> json) =>
    RegisterParams(
      id: json['id'] as int?,
      firstName: json['firstName'] as String?,
      logoutDate: json['logoutDate'] as String?,
      isLogedOut: json['isLogedOut'] as bool?,
      loginDate: json['loginDate'] as String?,
      lastName: json['lastName'] as String?,
      phoneNumber: json['phoneNumber'] as String?,
      email: json['email'] as String?,
      type: json['type'] as String?,
      lat: (json['lat'] as num?)?.toDouble(),
      lng: (json['lng'] as num?)?.toDouble(),
      gender: json['gender'] as String?,
      nationalityId: json['nationalityId'] as int?,
      photoId: json['photoId'] as int?,
      identityPhotoId: json['identityPhotoId'] as int?,
      rateing: json['rateing'] as int?,
      typeOfFile: json['typeOfFile'] as int?,
      isSendNotification: json['isSendNotification'] as bool?,
      slno: json['slno'] as String?,
      companyTradeNumber: json['companyTradeNumber'] as String?,
      companyName: json['companyName'] as String?,
      createdDate: json['createdDate'] as String?,
      isDeleted: json['isDeleted'] as bool?,
      fcm: json['fcm'] as String?,
      fingerprint: json['fingerprint'] as String?,
      isverified: json['isverified'] as bool?,
      status: json['status'] as bool?,
      facebook: json['facebook'] as String?,
      twitter: json['twitter'] as String?,
      insagram: json['insagram'] as String?,
      linkedin: json['linkedin'] as String?,
      countryCode: json['countryCode'] as String?,
    );

Map<String, dynamic> _$RegisterParamsToJson(RegisterParams instance) {
  final val = <String, dynamic>{
    'id': instance.id,
    'firstName': instance.firstName,
    'lastName': instance.lastName,
    'phoneNumber': instance.phoneNumber,
    'email': instance.email,
    'type': instance.type,
    'lat': instance.lat,
    'lng': instance.lng,
    'gender': instance.gender,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('nationalityId', instance.nationalityId);
  writeNotNull('photoId', instance.photoId);
  writeNotNull('identityPhotoId', instance.identityPhotoId);
  val['rateing'] = instance.rateing;
  val['typeOfFile'] = instance.typeOfFile;
  val['isSendNotification'] = instance.isSendNotification;
  writeNotNull('slno', instance.slno);
  val['companyTradeNumber'] = instance.companyTradeNumber;
  writeNotNull('companyName', instance.companyName);
  val['createdDate'] = instance.createdDate;
  val['isDeleted'] = instance.isDeleted;
  val['fcm'] = instance.fcm;
  val['fingerprint'] = instance.fingerprint;
  val['isverified'] = instance.isverified;
  val['status'] = instance.status;
  val['facebook'] = instance.facebook;
  val['twitter'] = instance.twitter;
  val['insagram'] = instance.insagram;
  val['linkedin'] = instance.linkedin;
  val['loginDate'] = instance.loginDate;
  val['isLogedOut'] = instance.isLogedOut;
  val['logoutDate'] = instance.logoutDate;
  val['countryCode'] = instance.countryCode;
  return val;
}

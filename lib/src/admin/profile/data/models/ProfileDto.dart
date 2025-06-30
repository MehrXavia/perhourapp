class ProfileDataDto {
  ProfileDataDto({
      this.id, 
      this.firstName, 
      this.lastName, 
      this.companyTradeNumber,
      this.fingerprint,
      this.phoneNumber,
      this.identityPhotoId,
      this.email,
      this.type, 
      this.lat, 
      this.lng, 
      this.gender, 
      this.nationalityName, 
      this.imageUrl, 
      this.typeOfFile, 
      this.isSendNotification, 
      this.slno, 
      this.companyName, 
      this.isverified, 
      this.rateing, 
      this.facebook, 
      this.twitter, 
      this.insagram, 
      this.linkedin, 
      this.nationalityId, 
      this.photoId, 
      this.createdDate, 
      this.isDeleted, 
      this.nationalityNameAR,
      this.fcm,
      this.logoutDate,
      this.isLogedOut,
      this.loginDate,
      this.status,
      this.countryCode,
  });

  ProfileDataDto.fromJson(dynamic json) {
    id = json['id'];
    companyTradeNumber = json['companyTradeNumber'];
    identityPhotoId = json['identityPhotoId'];
    firstName = json['firstName'];
    lastName = json['lastName'];
    fingerprint = json['fingerprint'];
    phoneNumber = json['phoneNumber'];
    email = json['email'];
    type = json['type'];
    lat = json['lat'];
    lng = json['lng'];
    gender = json['gender'];
    nationalityName = json['nationalityName'];
    imageUrl = json['imageUrl'];
    typeOfFile = json['typeOfFile'];
    isSendNotification = json['isSendNotification'];
    slno = json['slno'];
    companyName = json['companyName'];
    isverified = json['isverified'];
    rateing = json['rateing'];
    facebook = json['facebook'];
    twitter = json['twitter'];
    insagram = json['insagram'];
    linkedin = json['linkedin'];
    nationalityId = json['nationalityId'];
    photoId = json['photoId'];
    createdDate = json['createdDate'];
    isDeleted = json['isDeleted'];
    fcm = json['fcm'];
    status = json['status'];
    nationalityNameAR = json['nationalityNameAR'];
    loginDate = json['loginDate'];
    logoutDate = json['logoutDate'];
    isLogedOut = json['isLogedOut'];
    countryCode = json['countryCode'];
  }
  int? id;
  int? identityPhotoId;
  String? firstName;
  String? lastName;
  String? fingerprint;
  String? phoneNumber;
  String? companyTradeNumber;
  String? email;
  String? type;
  num? lat;
  num? lng;
  String? gender;
  String? nationalityName;
  String? nationalityNameAR;
  String? imageUrl;
  int? typeOfFile;
  bool? isSendNotification;
  String? slno;
  String? companyName;
  bool? isverified;
  int? rateing;
  String? facebook;
  String? twitter;
  String? insagram;
  String? linkedin;
  int? nationalityId;
  int? photoId;
  String? createdDate;
  bool? isDeleted;
  String? fcm;
  bool? status;
  bool? isLogedOut;
  String? logoutDate;
  String? loginDate;
  String? countryCode;
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['isLogedOut'] = isLogedOut;
    map['logoutDate'] = logoutDate;
    map['loginDate'] = loginDate;
    map['identityPhotoId'] = identityPhotoId;
    map['firstName'] = firstName;
    map['fingerprint'] = fingerprint;
    map['nationalityNameAR'] = nationalityNameAR;
    map['lastName'] = lastName;
    map['phoneNumber'] = phoneNumber;
    map['email'] = email;
    map['type'] = type;
    map['lat'] = lat;
    map['lng'] = lng;
    map['gender'] = gender;
    map['nationalityName'] = nationalityName;
    map['imageUrl'] = imageUrl;
    map['typeOfFile'] = typeOfFile;
    map['isSendNotification'] = isSendNotification;
    map['slno'] = slno;
    map['companyName'] = companyName;
    map['isverified'] = isverified;
    map['rateing'] = rateing;
    map['facebook'] = facebook;
    map['twitter'] = twitter;
    map['insagram'] = insagram;
    map['linkedin'] = linkedin;
    map['nationalityId'] = nationalityId;
    map['photoId'] = photoId;
    map['createdDate'] = createdDate;
    map['isDeleted'] = isDeleted;
    map['fcm'] = fcm;
    map['status'] = status;
    map['countryCode'] = countryCode;
    return map;
  }

}
class EditProfilePrams {
  EditProfilePrams({
      this.id, 
      this.firstName, 
      this.lastName, 
      this.phoneNumber, 
      this.email, 
      this.type, 
      this.lat, 
      this.lng, 
      this.gender, 
      this.nationalityId, 
      this.photoId, 
      this.identityPhotoId, 
      this.rateing, 
      this.typeOfFile, 
      this.isSendNotification, 
      this.slno, 
      this.companyTradeNumber, 
      this.companyName, 
      this.createdDate, 
      this.isDeleted, 
      this.fcm, 
      this.fingerprint, 
      this.isverified, 
      this.status, 
      this.facebook, 
      this.twitter, 
      this.logoutDate,
      this.isLogedOut,
      this.loginDate,
      this.insagram,
      this.countryCode,
      this.linkedin,});

  EditProfilePrams.fromJson(dynamic json) {
    id = json['id'];
    firstName = json['firstName'];
    lastName = json['lastName'];
    phoneNumber = json['phoneNumber'];
    email = json['email'];
    type = json['type'];
    lat = json['lat'];
    lng = json['lng'];
    gender = json['gender'];
    nationalityId = json['nationalityId'];
    photoId = json['photoId'];
    identityPhotoId = json['identityPhotoId'];
    rateing = json['rateing'];
    typeOfFile = json['typeOfFile'];
    isSendNotification = json['isSendNotification'];
    slno = json['slno'];
    companyTradeNumber = json['companyTradeNumber'];
    companyName = json['companyName'];
    createdDate = json['createdDate'];
    isDeleted = json['isDeleted'];
    fcm = json['fcm'];
    fingerprint = json['fingerprint'];
    isverified = json['isverified'];
    status = json['status'];
    facebook = json['facebook'];
    twitter = json['twitter'];
    insagram = json['insagram'];
    linkedin = json['linkedin'];
    isLogedOut = json['isLogedOut'];
    loginDate = json['loginDate'];
    logoutDate = json['logoutDate'];
    countryCode = json['countryCode'];
  }
  int? id;
  String? firstName;
  String? lastName;
  String? phoneNumber;
  String? email;
  String? type;
  double? lat;
  double? lng;
  String? gender;
  int? nationalityId;
  int? photoId;
  int? identityPhotoId;
  int? rateing;
  int? typeOfFile;
  bool? isSendNotification;
  String? slno;
  String? companyTradeNumber;
  String? companyName;
  String? createdDate;
  bool? isDeleted;
  String? fcm;
  String? fingerprint;
  bool? isverified;
  bool? status;
  bool? isLogedOut;
  String? facebook;
  String? twitter;
  String? insagram;
  String? linkedin;
  String? logoutDate;
  String? loginDate;
  String? countryCode;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['logoutDate'] = logoutDate;
    map['isLogedOut'] = isLogedOut;
    map['loginDate'] = loginDate;
    map['firstName'] = firstName;
    map['companyTradeNumber'] = companyTradeNumber;
    map['lastName'] = lastName;
    map['phoneNumber'] = phoneNumber;
    map['email'] = email;
    map['type'] = type;
    map['lat'] = lat;
    map['lng'] = lng;
    map['gender'] = gender;
    map['nationalityId'] = nationalityId;
    map['photoId'] = photoId;
    map['identityPhotoId'] = identityPhotoId;
    map['rateing'] = rateing;
    map['typeOfFile'] = typeOfFile;
    map['isSendNotification'] = isSendNotification;
    map['slno'] = slno;
    map['companyTradeNumber'] = companyTradeNumber;
    map['companyName'] = companyName;
    map['createdDate'] = createdDate;
    map['isDeleted'] = isDeleted;
    map['fcm'] = fcm;
    map['fingerprint'] = fingerprint;
    map['isverified'] = isverified;
    map['status'] = status;
    map['facebook'] = facebook;
    map['twitter'] = twitter;
    map['insagram'] = insagram;
    map['linkedin'] = linkedin;
    map['countryCode'] = countryCode;
    return map;
  }

}
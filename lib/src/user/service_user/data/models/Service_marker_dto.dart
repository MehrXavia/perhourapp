class ServiceMarkerDto {
  ServiceMarkerDto({
      this.id, 
      this.firstName, 
      this.lastName, 
      this.phoneNumber, 
      this.email, 
      this.type, 
      this.lat, 
      this.lng, 
      this.gender, 
      this.nationalityName, 
      this.imageUrl, 
      this.imageBase64, 
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
      this.fcm, 
      this.fingerprint, 
      this.status,});

  ServiceMarkerDto.fromJson(dynamic json) {
    id = json['id'];
    firstName = json['firstName'];
    lastName = json['lastName'];
    phoneNumber = json['phoneNumber'];
    email = json['email'];
    type = json['type'];
    lat = json['lat'];
    lng = json['lng'];
    gender = json['gender'];
    nationalityName = json['nationalityName'];
    imageUrl = json['imageUrl'];
    imageBase64 = json['imageBase64'];
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
    fingerprint = json['fingerprint'];
    status = json['status'];
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
  String? nationalityName;
  String? imageUrl;
  String? imageBase64;
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
  dynamic fingerprint;
  bool? status;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['firstName'] = firstName;
    map['lastName'] = lastName;
    map['phoneNumber'] = phoneNumber;
    map['email'] = email;
    map['type'] = type;
    map['lat'] = lat;
    map['lng'] = lng;
    map['gender'] = gender;
    map['nationalityName'] = nationalityName;
    map['imageUrl'] = imageUrl;
    map['imageBase64'] = imageBase64;
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
    map['fingerprint'] = fingerprint;
    map['status'] = status;
    return map;
  }

}
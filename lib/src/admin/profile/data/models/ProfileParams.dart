class ProfileParams {
  ProfileParams({
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
      this.typeOfFile, 
      this.isSendNotification, 
      this.slno, 
      this.companyName, 
      this.isverified, 
      this.facebook, 
      this.twitter, 
      this.insagram, 
      this.linkedin,});

  ProfileParams.fromJson(dynamic json) {
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
    typeOfFile = json['typeOfFile'];
    isSendNotification = json['isSendNotification'];
    slno = json['slno'];
    companyName = json['companyName'];
    isverified = json['isverified'];
    facebook = json['facebook'];
    twitter = json['twitter'];
    insagram = json['insagram'];
    linkedin = json['linkedin'];
  }
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
  int? typeOfFile;
  bool? isSendNotification;
  String? slno;
  String? companyName;
  bool? isverified;
  String? facebook;
  String? twitter;
  String? insagram;
  String? linkedin;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
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
    map['typeOfFile'] = typeOfFile;
    map['isSendNotification'] = isSendNotification;
    map['slno'] = slno;
    map['companyName'] = companyName;
    map['isverified'] = isverified;
    map['facebook'] = facebook;
    map['twitter'] = twitter;
    map['insagram'] = insagram;
    map['linkedin'] = linkedin;
    return map;
  }

}
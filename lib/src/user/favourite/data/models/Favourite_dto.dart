class FavouriteDto {
  FavouriteDto({
      this.id, 
      this.serviceProviderName, 
      this.serviceProviderId, 
      this.phoneNumber,
      this.userId,
      this.price,
      this.gender,
      this.subServiceId,
      this.subServiceName, 
      this.subServiceNameAR,
      this.photoUrl,
      this.experince,
      this.currency,
      this.createdDate,
      this.isDeleted,});

  FavouriteDto.fromJson(dynamic json) {
    id = json['id'];
    serviceProviderName = json['serviceProviderName'];
    serviceProviderId = json['serviceProviderId'];
    phoneNumber = json['phoneNumber'];
    userId = json['userId'];
    price = json['price'];
    subServiceId = json['subServiceId'];
    subServiceName = json['subServiceName'];
    photoUrl = json['photoUrl'];
    gender = json['gender'];
    createdDate = json['createdDate'];
    isDeleted = json['isDeleted'];
    currency = json['currency'];
    subServiceNameAR = json['subServiceNameAR'];
  }
  int? id;
  String? serviceProviderName;
  int? serviceProviderId;
  String? phoneNumber;
  int? userId;
  int? subServiceId;
  String? subServiceName;
  String? subServiceNameAR;
  num? price;
  int? experince;
  String? photoUrl;
  String? currency;
  String? createdDate;
  String? gender;
  bool? isDeleted;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['currency'] = currency;
    map['serviceProviderName'] = serviceProviderName;
    map['serviceProviderId'] = serviceProviderId;
    map['userId'] = userId;
    map['price'] = price;
    map['gender'] = gender;
    map['experince'] = experince;
    map['subServiceNameAR'] = subServiceNameAR;
    map['subServiceId'] = subServiceId;
    map['subServiceName'] = subServiceName;
    map['photoUrl'] = photoUrl;
    map['createdDate'] = createdDate;
    map['phoneNumber'] = phoneNumber;
    map['isDeleted'] = isDeleted;
    return map;
  }

}
class FavouritePrams {
  FavouritePrams({
      this.serviceProviderId, 
      this.subServiceId,
      this.createdDate,
      this.userId,});

  FavouritePrams.fromJson(dynamic json) {
    serviceProviderId = json['serviceProviderId'];
    userId = json['userId'];
    subServiceId = json['subServiceId'];
    createdDate = json['createdDate '];
  }
  int? serviceProviderId;
  int? userId;
  int? subServiceId;
  String? createdDate;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['serviceProviderId'] = serviceProviderId;
    map['userId'] = userId;
    map['createdDate'] = createdDate;
    map['subServiceId'] = subServiceId;
    return map;
  }

}


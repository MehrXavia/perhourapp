class AddSubsriptionsPrams {
  AddSubsriptionsPrams({
      this.id, 
      this.serviceProviderId, 
      this.subsriptionsMangementId, 
      this.createdDate,});

  AddSubsriptionsPrams.fromJson(dynamic json) {
    id = json['id'];
    serviceProviderId = json['serviceProviderId'];
    subsriptionsMangementId = json['subsriptionsMangementId'];
    createdDate = json['createdDate'];
  }
  int? id;
  int? serviceProviderId;
  int? subsriptionsMangementId;
  String? createdDate;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['serviceProviderId'] = serviceProviderId;
    map['subsriptionsMangementId'] = subsriptionsMangementId;
    map['createdDate'] = createdDate;
    return map;
  }

}
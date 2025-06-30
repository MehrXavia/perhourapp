class SubscriptionDto {
  SubscriptionDto({
      this.serviceProviderId, 
      this.serviceProviderName, 
      this.subsriptionsMangementName, 
      this.subsriptionsMangementDesc, 
      this.subsriptionsMangementDescEN,
      this.subsriptionsMangementNameEN,
      this.subsriptionsMangementPeriod,
      this.subsriptionsMangementPrice,});

  SubscriptionDto.fromJson(dynamic json) {
    serviceProviderId = json['serviceProviderId'];
    serviceProviderName = json['serviceProviderName'];
    subsriptionsMangementName = json['subsriptionsMangementName'];
    subsriptionsMangementDesc = json['subsriptionsMangementDesc'];
    subsriptionsMangementDescEN = json['subsriptionsMangementDescEN'];
    subsriptionsMangementPeriod = json['subsriptionsMangementPeriod'];
    subsriptionsMangementPrice = json['subsriptionsMangementPrice'];
    subsriptionsMangementNameEN = json['subsriptionsMangementNameEN'];
  }
  int? serviceProviderId;
  String? serviceProviderName;
  String? subsriptionsMangementName;
  String? subsriptionsMangementDesc;
  String? subsriptionsMangementDescEN;
  String? subsriptionsMangementPeriod;
  String? subsriptionsMangementPrice;
  String? subsriptionsMangementNameEN;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['serviceProviderId'] = serviceProviderId;
    map['serviceProviderName'] = serviceProviderName;
    map['subsriptionsMangementName'] = subsriptionsMangementName;
    map['subsriptionsMangementDescEN'] = subsriptionsMangementDescEN;
    map['subsriptionsMangementDesc'] = subsriptionsMangementDesc;
    map['subsriptionsMangementPeriod'] = subsriptionsMangementPeriod;
    map['subsriptionsMangementPrice'] = subsriptionsMangementPrice;
    map['subsriptionsMangementNameEN'] = subsriptionsMangementNameEN;
    return map;
  }

}
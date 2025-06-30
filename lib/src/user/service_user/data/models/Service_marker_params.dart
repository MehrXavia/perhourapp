class ServiceMarkerParams {
  ServiceMarkerParams({
      this.lon, 
      this.lat, 
      this.serviceId,
      this.userId,
      this.countryCode,


  });

  ServiceMarkerParams.fromJson(dynamic json) {
    lon = json['lon'];
    lat = json['lat'];
    serviceId = json['serviceId'];
    userId = json['userId'];
    countryCode = json['countryCode'];
  }
  double? lon;
  double? lat;
  int? serviceId;
  int? userId;
  String? countryCode;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['lon'] = lon;
    map['lat'] = lat;
    map['serviceId'] = serviceId;
    map['userId'] = userId;
    map['countryCode'] = countryCode;
    return map;
  }

}
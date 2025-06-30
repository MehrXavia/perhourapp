import 'Service.dart';

class GetAllService {
  GetAllService({
      this.id, 
      this.serviceProviderId, 
      this.serviceId, 
      this.service, 
      this.description, 
      this.status,
      this.price,
      this.currency,
      this.experience,});

  GetAllService.fromJson(dynamic json) {
    id = json['id'];
    status = json['status'];
    serviceProviderId = json['serviceProviderId'];
    serviceId = json['serviceId'];
    service = json['service'] != null ? Service.fromJson(json['service']) : null;
    description = json['description'];
    price = json['price'];
    currency = json['currency'];
    experience = json['experience'];
  }
  num? id;
  num? serviceProviderId;
  num? serviceId;
  Service? service;
  String? description;
  num? price;
  String? currency;
  int? status;
  num? experience;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['status'] = status;
    map['serviceProviderId'] = serviceProviderId;
    map['serviceId'] = serviceId;
    if (service != null) {
      map['service'] = service?.toJson();
    }
    map['description'] = description;
    map['price'] = price;
    map['currency'] = currency;
    map['experience'] = experience;
    return map;
  }

}
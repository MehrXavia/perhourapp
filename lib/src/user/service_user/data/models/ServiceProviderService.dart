import 'Service.dart';

class ServiceProviderService {
  ServiceProviderService({
      this.id, 
      this.serviceProviderId, 
      this.serviceId, 
      this.service, 
      this.description, 
      this.price, 
      this.currency,
      this.experience,});

  ServiceProviderService.fromJson(dynamic json) {
    id = json['id'];
    serviceProviderId = json['serviceProviderId'];
    serviceId = json['serviceId'];
    service = json['service'] != null ? Service.fromJson(json['service']) : null;
    description = json['description'];
    price = json['price'];
    currency = json['currency'];
    experience = json['experience'];
  }
  int? id;
  int? serviceProviderId;
  int? serviceId;
  Service? service;
  String? description;
  int? price;
  String? currency;
  int? experience;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
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
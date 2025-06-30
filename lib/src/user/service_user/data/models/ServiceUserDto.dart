class ServiceUserDto {
  ServiceUserDto({
      this.id, 
      this.enName, 
      this.arName, 

      this.enDescription, 
      this.arDescription, 

      this.imageUrl, 
      this.status,});

  ServiceUserDto.fromJson(dynamic json) {
    id = json['id'];
    enName = json['enName'];
    arName = json['arName'];

    enDescription = json['enDescription'];
    arDescription = json['arDescription'];

    imageUrl = json['imageUrl'];
    status = json['status'];
  }
  num? id;
  String? enName;
  String? arName;

  String? enDescription;
  String? arDescription;

  String? imageUrl;
  bool? status;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['enName'] = enName;
    map['arName'] = arName;
    map['enDescription'] = enDescription;
    map['arDescription'] = arDescription;
    map['imageUrl'] = imageUrl;
    map['status'] = status;
    return map;
  }

}
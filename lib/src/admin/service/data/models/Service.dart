class Service {
  Service({
      this.id, 
      this.enName, 
      this.arName, 
       this.status,
      this.mainCategoryId,});

  Service.fromJson(dynamic json) {
    id = json['id'];
    enName = json['enName'];
    arName = json['arName'];
    status = json['status'];
    mainCategoryId = json['mainCategoryId'];
  }
  num? id;
  String? enName;
  String? arName;
   bool? status;
  num? mainCategoryId;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['enName'] = enName;
    map['arName'] = arName;
     map['status'] = status;
    map['mainCategoryId'] = mainCategoryId;
    return map;
  }

}
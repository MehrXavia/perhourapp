class Service {
  Service({
      this.id, 
      this.enName, 
      this.arName, 
      this.inName, 
      this.status, 
      this.mainCategoryId,});

  Service.fromJson(dynamic json) {
    id = json['id'];
    enName = json['enName'];
    arName = json['arName'];
    inName = json['inName'];
    status = json['status'];
    mainCategoryId = json['mainCategoryId'];
  }
  int? id;
  String? enName;
  String? arName;
  String? inName;
  bool? status;
  int? mainCategoryId;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['enName'] = enName;
    map['arName'] = arName;
    map['inName'] = inName;
    map['status'] = status;
    map['mainCategoryId'] = mainCategoryId;
    return map;
  }

}
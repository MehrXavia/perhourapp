class SubServiceDto {
  SubServiceDto({
      this.id, 
      this.enName, 
      this.arName, 
      this.inName, 
      this.mainCategoryId,});

  SubServiceDto.fromJson(dynamic json) {
    id = json['id'];
    enName = json['enName'];
    arName = json['arName'];
    inName = json['inName'];
    mainCategoryId = json['mainCategoryId'];
  }
  int? id;
  String? enName;
  String? arName;
  String? inName;
  int? mainCategoryId;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['enName'] = enName;
    map['arName'] = arName;
    map['inName'] = inName;
    map['mainCategoryId'] = mainCategoryId;
    return map;
  }

}
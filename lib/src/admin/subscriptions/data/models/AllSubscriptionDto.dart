class AllSubscriptionDto {
  AllSubscriptionDto({
      this.id, 
      this.name, 
      this.enName, 
       this.description,
      this.enDescription, 
       this.period,
      this.amount, 
      this.deleted, 
      this.isValid,});

  AllSubscriptionDto.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
    enName = json['enName'];
     description = json['description'];
    enDescription = json['enDescription'];
     period = json['period'];
    amount = json['amount'];
    deleted = json['deleted'];
    isValid = json['isValid'];
  }
  int? id;
  String? name;
  String? enName;
   String? description;
  String? enDescription;

  String? period;
  String? amount;
  bool? deleted;
  bool? isValid;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    map['enName'] = enName;
     map['description'] = description;
    map['enDescription'] = enDescription;
     map['period'] = period;
    map['amount'] = amount;
    map['deleted'] = deleted;
    map['isValid'] = isValid;
    return map;
  }

}
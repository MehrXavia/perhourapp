class SubscriptionParams {
  SubscriptionParams({
      this.id, 
      this.name, 
      this.enName, 
      this.inName, 
      this.description, 
      this.enDescription, 
      this.inDescription, 
      this.period, 
      this.amount, 
      this.deleted, 
      this.isValid,});

  SubscriptionParams.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
    enName = json['enName'];
    inName = json['inName'];
    description = json['description'];
    enDescription = json['enDescription'];
    inDescription = json['inDescription'];
    period = json['period'];
    amount = json['amount'];
    deleted = json['deleted'];
    isValid = json['isValid'];
  }
  int? id;
  String? name;
  String? enName;
  String? inName;
  String? description;
  String? enDescription;
  String? inDescription;
  String? period;
  String? amount;
  bool? deleted;
  bool? isValid;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    map['enName'] = enName;
    map['inName'] = inName;
    map['description'] = description;
    map['enDescription'] = enDescription;
    map['inDescription'] = inDescription;
    map['period'] = period;
    map['amount'] = amount;
    map['deleted'] = deleted;
    map['isValid'] = isValid;
    return map;
  }

}
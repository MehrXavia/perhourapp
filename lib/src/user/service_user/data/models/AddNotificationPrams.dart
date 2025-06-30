class AddNotificationPrams {
  AddNotificationPrams({
      this.id, 
      this.userId, 
      this.serviceProviderId, 
      this.notificationsTypeId, 
      this.dateNotification,});

  AddNotificationPrams.fromJson(dynamic json) {
    id = json['id'];
    userId = json['userId'];
    serviceProviderId = json['serviceProviderId'];
    notificationsTypeId = json['notificationsTypeId'];
    dateNotification = json['dateNotification'];
  }
  int? id;
  int? userId;
  int? serviceProviderId;
  int? notificationsTypeId;
  String? dateNotification;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['userId'] = userId;
    map['serviceProviderId'] = serviceProviderId;
    map['notificationsTypeId'] = notificationsTypeId;
    map['dateNotification'] = dateNotification;
    return map;
  }

}
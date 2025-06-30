class NotificationsDto {
  NotificationsDto({
      this.id, 
      this.userId, 
      this.user, 
      this.serviceProviderId, 
      this.message, 
      this.notificationsType, 
      this.notificationsTypeId, 
      this.messageEN,
      this.dateNotification,});

  NotificationsDto.fromJson(dynamic json) {
    id = json['id'];
    userId = json['userId'];
    user = json['user'];
    serviceProviderId = json['serviceProviderId'];
    message = json['message'];
    messageEN = json['messageEN'];
    notificationsType = json['notificationsType'];
    notificationsTypeId = json['notificationsTypeId'];
    dateNotification = json['dateNotification'];
  }
  int? id;
  int? userId;
  dynamic user;
  int? serviceProviderId;
  String? message;
  String? messageEN ;
  dynamic notificationsType;
  int? notificationsTypeId;
  String? dateNotification;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['userId'] = userId;
    map['messageEN'] = messageEN;
    map['user'] = user;
    map['serviceProviderId'] = serviceProviderId;
    map['message'] = message;
    map['notificationsType'] = notificationsType;
    map['notificationsTypeId'] = notificationsTypeId;
    map['dateNotification'] = dateNotification;
    return map;
  }

}
class LoginParams {
  String? phoneNumber;
  String? type;
  String? loginDate;
  String? fcm;

  LoginParams({this.phoneNumber,this.type,this.loginDate,this.fcm,});

  Map<String, dynamic> toJson() {
    return {
      'phoneNumber': phoneNumber,
      'type': type,
      'fcm': fcm,
      'loginDate': loginDate,
    };
  }
}
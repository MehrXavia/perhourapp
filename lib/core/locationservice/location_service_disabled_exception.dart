
import '../exceptions/app_exception.dart';

class AppLocationServiceDisabledException  extends AppBaseException {
  @override
  String messageEn  =
      'Location services are disabled. The application needs to turn on the geolocation service. You have to turn it on by going to Settings ' ;
  @override
  String messageAr  = 'خدمات الموقع معطلة. يحتاج التطبيق إلى تشغيل خدمة تحديد الموقع الجغرافي. يجب عليك تشغيله بالانتقال إلى الإعدادات' ;


}

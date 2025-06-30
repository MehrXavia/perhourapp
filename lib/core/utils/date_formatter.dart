import 'package:intl/intl.dart';

import '../di/injector.dart';

class DateFormatter{

  static const DATE_TIME ='dd/MM/yyyy HH:mm:ss' ;
  static String formatFromString(String date){
    final dateTime = dateFromString(date);
    try {

      final formatter = DateFormat('dd/MM/yyyy', injector<ServicesLocator>().languageCode).format(dateTime);
      return formatter.toString();
    } on Exception catch (e) {
      print(e);
      return date;
    }
  }
  static String formatFromTimeString(String date){
    final dateTime = dateFromString(date);
    try {
      final formatter =   DateFormat.jm().format( dateTime,);
      //final formatter = DateFormat('HH:mm a', injector<ServicesLocator>().languageCode,).format(dateTime);
      return formatter.toString();
    } on Exception catch (e) {
      print(e);
      return date;
    }
  }

  static DateTime dateFromString(date , {String pattern = DATE_TIME}){
    DateTime tempDate = DateFormat(pattern).parse(date);
    return tempDate;
  }




}
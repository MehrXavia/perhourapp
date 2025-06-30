
import '../../src/main_index.dart';

class Validation {
  //"^5(\\d{8})\$"
  // static bool isValidPhone(String phone) => RegExp("^(5|05)(\\d{8})\$").hasMatch(phone);
  static bool isValidPhone(String phone) =>
      RegExp("^(5)(\\d{8})\$").hasMatch(phone);
  static bool isArabicLetters(String name) =>
      RegExp("^[\u0621-\u064A\\s]+\$").hasMatch(name);

  static bool isValidFullName(String name) =>
      RegExp("^[\u0621-\u064a\\s]{3,}(?: [\u0621-\u064a\\s]+){2}\$")
          .hasMatch(name);

  static bool isValidIDNumber(String id) =>
      RegExp("^[1-2][0-9]{1,10}\$").hasMatch(id);

  static bool isEmailValid(String email) => RegExp(
          r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
      .hasMatch(email);

  static String? validateEmail(String value, String strings, String required) {
    String pattern =
        r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]"
        r"{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]"
        r"{0,253}[a-zA-Z0-9])?)*$";
    RegExp regex =   RegExp(pattern);
     if  (value == null || value.isEmpty) {
      return  required;
    }else if (!regex.hasMatch(value)){
      return  strings;
    }else{
      return null;
    }



  }

  static String? validatePassword(String value) {
    if (value.isEmpty) {
      return injector<ServicesLocator>().strings.this_field_is_required;
    }
    if (value.length < 6) {
      return injector<ServicesLocator>().strings.password_must_be_at_least_6_characters;
    }
    return null;
  }

  static String? validateConfirmPassword(String value, String password) {
    if (value.isEmpty) {
      return injector<ServicesLocator>().strings.this_field_is_required;
    }
    if (value.length < 6) {
      return injector<ServicesLocator>().strings.password_must_be_at_least_6_characters;
    }
    if (value != password) {
      return injector<ServicesLocator>().strings.passwords_does_not_match;
    }
    return null;
  }

  static String? validateRequired(String? value) {
    if (value == null || value.isEmpty) {
      return injector<ServicesLocator>().strings.this_field_is_required;
    }
    return null;
  }

  static String? validatePhone(String value) {
    if (value.isEmpty) {
      return injector<ServicesLocator>().strings.this_field_is_required;
    }
    // if (value.length < 6) {
    //   return injector<ServicesLocator>().strings.;
    // }
    return null;
  }

  // validation only one string
  static String? validateString(String value) {
    if (value.isEmpty) {
      return injector<ServicesLocator>().strings.this_field_is_required;
    } else if(value.split(' ').length > 1){
      return injector<ServicesLocator>().strings.only_one_text;
    }
    return null;
  }
}

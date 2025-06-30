import 'dart:convert';
import 'dart:io';

import 'package:fluttertoast/fluttertoast.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../src/admin/service/data/models/currency_dto.dart';
import '../../src/main_index.dart';
import '../../src/shared/auth/data/models/profile_dto.dart';

class HelperMethods {
  static Future<CroppedFile?> getImagePicker() async {
    XFile? imageFile;
    imageFile = await ImagePicker().pickImage(source: ImageSource.gallery);
    return await ImageCropper().cropImage(
      sourcePath: imageFile!.path,
      uiSettings: [
        AndroidUiSettings(
            toolbarColor: Colors.black,
            toolbarWidgetColor: Colors.white,
            initAspectRatio: CropAspectRatioPreset.original,
            lockAspectRatio: false),
      ],
    );
  }
  static String replaceArabicNumber(String input) {
    const english = ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9'];
    const arabic = ['٠', '١', '٢', '٣', '٤', '٥', '٦', '٧', '٨', '٩'];

    for (int i = 0; i < english.length; i++) {
      input = input.replaceAll(arabic[i], english[i]);
    }
    print("$input");
    return input;
  }
  static Future<CroppedFile?> getImageCamera() async {
    XFile? imageFile;
    imageFile = await ImagePicker().pickImage(source: ImageSource.camera);
    return await ImageCropper().cropImage(
      sourcePath: imageFile!.path,
      uiSettings: [
        AndroidUiSettings(
            toolbarColor: Colors.black,
            toolbarWidgetColor: Colors.white,
            initAspectRatio: CropAspectRatioPreset.original,
            lockAspectRatio: false),
      ],
    );
  }

  // convert image to base64
  static Future<String> convertImageAsBase64(CroppedFile file) async {
    try {
      final bytes = await file.readAsBytes();
      return base64Encode(bytes);
    } on Exception catch (e) {
      print('convertImageToBase64 ${e.toString()}');
      rethrow;
    }
  }

  static Future<File> getImageFromGallery() async {
    final pickedFile =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    return File(pickedFile!.path);
  }

  static showErrorToast(String msg,
      {Color? color, ToastGravity? gravity}) async {
    return Fluttertoast.showToast(
        msg: msg,
        toastLength: Toast.LENGTH_SHORT,
        gravity: gravity ?? ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: color ?? Colors.red,
        textColor: Colors.white,
        fontSize: 16.0);
  }

  static showSuccessToast(String msg,
      {Color? color, ToastGravity? gravity}) async {
    return Fluttertoast.showToast(
        msg: msg,
        toastLength: Toast.LENGTH_SHORT,
        gravity: gravity ?? ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: color ?? Colors.green,
        textColor: Colors.white,
        fontSize: 16.0);
  }

  static Future<void> launchCallPhone(String phoneNumber) async {
    Uri telephoneUrl = Uri.parse("tel:$phoneNumber");
    if (await canLaunchUrl(telephoneUrl)) {
      await launchUrl(telephoneUrl);
    } else {
      showErrorToast('حدث خطأ أثناء الاتصال بالرقم');
    }
  }

  static Future<void> openGoogleMap(String latitude, String longitude) async {
    Uri googleUrl = Uri.parse(
        'https://www.google.com/maps/search/?api=1&query=$latitude,$longitude');
    if (await canLaunchUrl(googleUrl)) {
      await launchUrl(googleUrl);
    } else {
      throw 'حدث خطأ أثناء فتح خرائط جوجل';
    }
  }

  static Future<void> launchWhatsApp(String phoneNumber) async {
    Uri whatsUpUrl = Uri.parse("whatsapp://send?phone=$phoneNumber");
    if (await canLaunchUrl(whatsUpUrl)) {
      await launchUrl(whatsUpUrl);
    } else {
      showErrorToast('حدث خطأ اثناء الاتصال بالواتساب');
    }
  }

  static Future<void> launchURL(String url) async {
    if (await canLaunchUrl(Uri.parse(url))) {
      await launchUrl(Uri.parse(url));
    } else {
      showErrorToast('حدث خطأ أثناء فتح الرابط');
    }
  }

  // show date picker
  static Future<String> datePicker(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101));
    if (picked != null) {
      return picked.toString();
    }
    return '';
  }

  static String formatDate(String date) {
    final DateTime dateTime = DateTime.parse(date);
    final String formatter = DateFormat('yyyy-MM-dd').format(dateTime);
    return formatter;
  }

  static setLanguage(String language) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('language', language);
  }
  static setEmail(String email) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('email', email);
  }

  static setVerify(String verify) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('verify', verify);
  }
  static removeVerify( ) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove('verify');
  }

  static Future<String> getLanguage() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('language') ?? 'ar';
  }


  static Future<String> getVerify() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('verify') ?? '';
  }

  static Future<String> getEmail() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('email') ?? "";
  }

  // save ProfileDto to shared preferences
  static saveProfile(ProfileDto profile) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('profile', jsonEncode(profile.toJson()));
  }

  // get ProfileDto from shared preferences
  static Future<ProfileDto?>? getProfile() async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      final data = ProfileDto.fromJson(
          jsonDecode(prefs.getString('profile') ?? '{}') ?? {});
      print('getProfile ${data.toJson()}');
      if (data.id == null) return null;
      return data;
    } on Exception catch (e) {
      // print('getProfile ${e.toString()}');
      return null;
    }
  }

  static Future<String?> getLoginParams() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final data = prefs.getString('fingerprintData');
    if (data == null) return null;
    return data;
  }

  static Future<void> saveLoginParams(String data) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('fingerprintData', data);
  }

  static Future<bool> isAuth() async {
    ProfileDto? profile = await getProfile();
    if (profile != null && profile.id != null && profile.id != 0) {
      return true;
    }
    return false;
  }

  static Future<bool> isAdmin() async {
    ProfileDto? profile = await getProfile();
    if (profile != null && profile.type != null && profile.type == '2') {
      return true;
    }
    return false;
  }

  static Future<String> getRole() async {
    ProfileDto? profile = await getProfile();
    return profile?.type ?? '';
  }

  static Future<void> removeProfile() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.clear();
  }

  static Future<String> getToken() async {
    ProfileDto? profile = await getProfile();
    return '';
  }

  static Future<int> getUserId() async {
    ProfileDto? profile = await getProfile();
    return profile?.id ?? 0;
  }

  static void copyToClipboard(String text) {
    try {
      Clipboard.setData(ClipboardData(text: text));
      showSuccessToast('تم النسخ');
    } catch (e) {
      HelperMethods.showErrorToast('حدث خطأ أثناء النسخ');
    }
  }

  static getCurrentLocation() async {
    try {
      final position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);
      return CameraPosition(
          target: LatLng(position.latitude, position.longitude), zoom: 14.4746);
    } on Exception catch (e) {
      print('getCurrentLocation ${e.toString()}');
      return const CameraPosition(
          target: LatLng(37.42796133580664, -122.085749655962), zoom: 14.4746);
    }
  }

  static List<CurrencyDto> currencies = [
    CurrencyDto(
      currencyAr: "دولار أمريكي",
      currencyEn: "USD",
      id: 1,
    ),
    CurrencyDto(
      currencyAr: "ريال سعودي",
      currencyEn: "SAR",
      id: 2,
    ),
    CurrencyDto(
      currencyAr: "دولار الكندي",
      currencyEn: "CAD",
      id: 3,
    ),
    CurrencyDto(
      currencyAr: "يورو",
      currencyEn: "EUR",
      id: 4,
    ),
    CurrencyDto(
      currencyAr: "جنيه الإسترليني",
      currencyEn: "GBP",
      id: 5,
    ),
    CurrencyDto(
      currencyAr: "فرنك السويسري",
      currencyEn: "CHF",
      id: 6,
    ),
    CurrencyDto(
      currencyAr: "دينار الأردني",
      currencyEn: "JOD",
      id: 7,
    ),
    CurrencyDto(
      currencyAr: "دينار البحريني",
      currencyEn: "BHD",
      id: 8,
    ),
    CurrencyDto(
      currencyAr: "دينار الكويتي",
      currencyEn: "KWD",
      id: 9,
    ),
    CurrencyDto(
      currencyAr: "ريال العُماني",
      currencyEn: "OMR",
      id: 10,
    ),
    CurrencyDto(
      currencyAr: "جنيه مصري",
      currencyEn: "EGP",
      id: 11,
    ),
    CurrencyDto(
      currencyAr: "جنيه سوداني",
      currencyEn: "SDG",
      id: 12,
    ),
    CurrencyDto(
      currencyAr: "درهم اماراتي",
      currencyEn: "AED",
      id: 13,
    ),
    CurrencyDto(
      currencyAr: "ريال يمني",
      currencyEn: "YER",
      id: 14,
    ),
  ];
  static final local = injector<ServicesLocator>()
      .navigatorKey
      .currentContext
      ?.languageCode
      .toString();
  static String getName(
      String stringAr, String stringEn, BuildContext context) {
    if (local == context.ar) {
      return stringAr;
    } else {
      return stringEn;
    }
  }

  static String translateCurrency(String currency, context) {
    if (currency == currencies[0].currencyAr || currency == currencies[0].currencyEn) {
      return getName(currencies[0].currencyAr ?? "", currencies[0].currencyEn ?? "", context);

    } else if (currency == currencies[1].currencyAr || currency == currencies[1].currencyEn) {
      return getName(currencies[1].currencyAr ?? "", currencies[1].currencyEn ?? "", context);

    } else if (currency == currencies[2].currencyAr || currency == currencies[2].currencyEn) {
      return getName(currencies[2].currencyAr ?? "", currencies[2].currencyEn ?? "", context);

    } else if (currency == currencies[3].currencyAr || currency == currencies[3].currencyEn) {
      return getName(currencies[3].currencyAr ?? "", currencies[3].currencyEn ?? "", context);

    } else if (currency == currencies[4].currencyAr || currency == currencies[4].currencyEn) {
      return getName(currencies[4].currencyAr ?? "", currencies[4].currencyEn ?? "", context);

    } else if (currency == currencies[5].currencyAr || currency == currencies[5].currencyEn) {
      return getName(currencies[5].currencyAr ?? "", currencies[5].currencyEn ?? "", context);

    } else if (currency == currencies[6].currencyAr || currency == currencies[6].currencyEn) {
      return getName(currencies[6].currencyAr ?? "", currencies[6].currencyEn ?? "", context);

    } else if (currency == currencies[7].currencyAr || currency == currencies[7].currencyEn) {
      return getName(currencies[7].currencyAr ?? "", currencies[7].currencyEn ?? "", context);

    } else if (currency == currencies[8].currencyAr || currency == currencies[8].currencyEn) {
      return getName(currencies[8].currencyAr ?? "", currencies[8].currencyEn ?? "", context);

    } else if (currency == currencies[9].currencyAr || currency == currencies[9].currencyEn) {
      return getName(currencies[9].currencyAr ?? "", currencies[9].currencyEn ?? "", context);

    } else if (currency == currencies[10].currencyAr || currency == currencies[10].currencyEn) {
      return getName(currencies[10].currencyAr ?? "", currencies[10].currencyEn ?? "", context);

    } else if (currency == currencies[11].currencyAr || currency == currencies[11].currencyEn) {
      return getName(currencies[11].currencyAr ?? "", currencies[11].currencyEn ?? "", context);

    } else if (currency == currencies[12].currencyAr || currency == currencies[12].currencyEn) {
      return getName(currencies[12].currencyAr ?? "", currencies[12].currencyEn ?? "", context);

    } else if (currency == currencies[13].currencyAr || currency == currencies[13].currencyEn) {
      return getName(currencies[13].currencyAr ?? "", currencies[13].currencyEn ?? "", context);
    } else {
      return getName(currencies[0].currencyAr ?? "", currencies[0].currencyEn ?? "", context);
    }
  }
}

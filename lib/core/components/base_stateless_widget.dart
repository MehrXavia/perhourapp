
import 'package:location/location.dart';

import '../../src/admin/service/data/models/currency_dto.dart';
import '../locationservice/locationservice.dart';
import '../widgets/dialogs/progress_dialog.dart';
import '/src/main_index.dart';

abstract class BaseStatelessWidget extends StatelessWidget {

  BuildContext? context = injector<ServicesLocator>().navigatorKey.currentContext;
  final strings = injector<ServicesLocator>().navigatorKey.currentContext!.strings;
  TextStyle get labelSmall => context!.labelSmall;
  TextStyle get labelMedium => context!.labelMedium;
  TextStyle get labelLarge => context!.labelLarge;
  TextStyle get displaySmall => context!.displaySmall;
  TextStyle get displayMedium => context!.displayMedium;
  TextStyle get displayLarge => context!.displayLarge;
  TextStyle get headlineSmall => context!.headlineSmall;
  TextStyle get headlineMedium => context!.headlineMedium;
  TextStyle get headlineLarge => context!.headlineLarge;
  TextStyle get bodySmall => context!.bodySmall;
  TextStyle get bodyMedium => context!.bodyMedium;
  TextStyle get bodyLarge => context!.bodyLarge;
  TextStyle get titleSmall => context!.titleSmall;
  TextStyle get titleMedium => context!.titleMedium;
  TextStyle get titleLarge => context!.titleLarge;
  Color get errorColor => context!.errorColor;
  ThemeData get theme => Theme.of(context!);
  final local = injector<ServicesLocator>().navigatorKey.currentContext?.languageCode.toString();

  //static String routeName (){return '';}

  final CustomProgressDialog progress =
  DialogsManager.createProgress();

  bool isRtl() => local == 'ar';

  String getName(String stringAr, String stringEn,  ) {
    if (local == context?.ar) {
      return stringAr;
    } else   {
      return stringEn;
    }
  }
  List<CurrencyDto> currencies = [
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
  String translateCurrency(String currency) {
    if (currency == currencies[0].currencyAr || currency == currencies[0].currencyEn) {
      return getName(currencies[0].currencyAr ?? "", currencies[0].currencyEn ?? "", );

    } else if (currency == currencies[1].currencyAr || currency == currencies[1].currencyEn) {
      return getName(currencies[1].currencyAr ?? "", currencies[1].currencyEn ?? "", );

    } else if (currency == currencies[2].currencyAr || currency == currencies[2].currencyEn) {
      return getName(currencies[2].currencyAr ?? "", currencies[2].currencyEn ?? "", );

    } else if (currency == currencies[3].currencyAr || currency == currencies[3].currencyEn) {
      return getName(currencies[3].currencyAr ?? "", currencies[3].currencyEn ?? "", );

    } else if (currency == currencies[4].currencyAr || currency == currencies[4].currencyEn) {
      return getName(currencies[4].currencyAr ?? "", currencies[4].currencyEn ?? "", );

    } else if (currency == currencies[5].currencyAr || currency == currencies[5].currencyEn) {
      return getName(currencies[5].currencyAr ?? "", currencies[5].currencyEn ?? "", );

    } else if (currency == currencies[6].currencyAr || currency == currencies[6].currencyEn) {
      return getName(currencies[6].currencyAr ?? "", currencies[6].currencyEn ?? "", );

    } else if (currency == currencies[7].currencyAr || currency == currencies[7].currencyEn) {
      return getName(currencies[7].currencyAr ?? "", currencies[7].currencyEn ?? "", );

    } else if (currency == currencies[8].currencyAr || currency == currencies[8].currencyEn) {
      return getName(currencies[8].currencyAr ?? "", currencies[8].currencyEn ?? "", );

    } else if (currency == currencies[9].currencyAr || currency == currencies[9].currencyEn) {
      return getName(currencies[9].currencyAr ?? "", currencies[9].currencyEn ?? "", );

    } else if (currency == currencies[10].currencyAr || currency == currencies[10].currencyEn) {
      return getName(currencies[10].currencyAr ?? "", currencies[10].currencyEn ?? "", );

    } else if (currency == currencies[11].currencyAr || currency == currencies[11].currencyEn) {
      return getName(currencies[11].currencyAr ?? "", currencies[11].currencyEn ?? "", );

    } else if (currency == currencies[12].currencyAr || currency == currencies[12].currencyEn) {
      return getName(currencies[12].currencyAr ?? "", currencies[12].currencyEn ?? "", );

    } else if (currency == currencies[13].currencyAr || currency == currencies[13].currencyEn) {
      return getName(currencies[13].currencyAr ?? "", currencies[13].currencyEn ?? "", );
    } else {
      return getName(currencies[0].currencyAr ?? "", currencies[0].currencyEn ?? "", );
    }
  }

  BaseStatelessWidget({Key? key}):  super(key: key);


  T? getArguments<T>(BuildContext context ){
    return context.getArguments();
  }

  handleErrorDialogBuilder(dynamic exception) {
    final context = this.context ;

    DialogsManager. showErrorDialog(context!, exception);

  }
  Future<LocationData> _location(BuildContext context) async {
    try {
      final position = await LocationService.determinePosition(context);
      return position;
    } catch (e) {
      return Future.error(e);
    }
  }

  void fetchLocation({required Function(LocationData location) onGetLocation}) {
    showProgress();
    _location(injector<ServicesLocator>().appContext).then((value) {
      dismissProgress();
      onGetLocation(value);
    }).onError((error, stackTrace) {
      handleFetchLocationException(error);
    }).whenComplete(() {
      dismissProgress();
    });
    dismissProgress();
  }

  void handleFetchLocationException(e) {
    LocationService.handleFetchLocationException(e, injector<ServicesLocator>().appContext);
  }
  showProgress() {
    progress.show();
  }

  dismissProgress() {
    progress.dismiss();
  }
}

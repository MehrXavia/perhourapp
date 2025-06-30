import 'dart:async';
import 'dart:io';

import 'package:onservice24/src/main_index.dart';
import 'package:dio/dio.dart';

import '../utils/responsive_service.dart';
import 'api_exception.dart';
import 'empty_list_exception.dart';

extension AppResource on BuildContext {
  AppLocalizations getStrings() {
    var stringRes = AppLocalizations.of(this);
    return stringRes!;
  }

  T? getArguments<T>() {
    return ModalRoute.of(this)!.settings.arguments as T;
  }

  ApiException handleApiErrorMessage({required dynamic exception}) {
    String message = injector<ServicesLocator>().appContext.strings.something_went_wrong;
    final strings = injector<ServicesLocator>().navigatorKey.currentContext!.strings;
    String code = "0";
    print('handleApiError is dio   ${exception is DioException}');
    if (exception is DioException) {
      if (exception.error is WebSocketException || exception.error is HandshakeException) {
        message = strings.error_internet_connection;
        code = "0";
      } else if (exception.error is SocketException ||
          exception.error is TimeoutException ||
          exception.error is TimeoutException ||
          exception.type == DioErrorType.connectionTimeout) {
        message = strings.error_internet_connection;
      } else if (exception.error is ApiException) {
        message = (exception.error as ApiException).message;
        code = (exception.error as ApiException).code.toString();
        print('handleApiError whenApiException is dio   $message');
      }
    }

    if (exception is ApiException) {
      message = exception.message;
      code = exception.code.toString();
    }

    if (exception is SocketException) {
      // placeHolderImage = Image.asset(Res.connection_error);
      message = strings.error_internet_connection;
    }

    if (exception is WebSocketException || exception is HandshakeException) {
      // placeHolderImage = Image.asset(Res.connection_error);
      message = strings.error_internet_connection;
    }

    if (exception is EmptyListException) {
      print('handleApiError is EmptyListException   ${exception.toString()}');
      message = exception.toString();
    }
    // if (exception is DioException && exception.response?.data != null) {
    //   message = exception.response?.data['message']['message'];
    // }
    return ApiException(message, int.parse(code));
  }

  ApiException handleApiError({required dynamic exception}) {
    String message = injector<ServicesLocator>().appContext.strings.something_went_wrong;
    int code = 0;
    List<String> errors = [];
    if (exception is DioError) {
      print('handleApiError is dio   ${exception.error is ApiException}');

      if (exception.error is WebSocketException || exception.error is HandshakeException) {
        message = strings.error_internet_connection;
      } else if (exception.error is SocketException ||
          exception.error is TimeoutException ||
          exception.error is TimeoutException ||
          exception.type == DioErrorType.connectionTimeout) {
        message = strings.error_internet_connection;
      } else if (exception.error is ApiException) {
        message = (exception.error as ApiException).message;
        code = (exception.error as ApiException).code;
      }
    }

    if (exception is ApiException) {
      message = exception.message;
      code = exception.code;
    }

    if (exception is SocketException) {
      // placeHolderImage = Image.asset(Res.connection_error);
      message = strings.error_internet_connection;
    }

    if (exception is WebSocketException || exception is HandshakeException) {
      // placeHolderImage = Image.asset(Res.connection_error);
      message = strings.error_internet_connection;
    }
    print('handleApiError message $message');
    return ApiException(message, code);
  }
}

extension NullOrEmpty on String? {
  bool isNullOrEmpty() {
    return this == null || this!.trim().isEmpty;
  }
}

extension ThemesExtension on BuildContext {
  ThemeData get theme => Theme.of(this);

  TextTheme get textTheme => Theme.of(this).textTheme;

  Color get primaryColor => Theme.of(this).primaryColor;

  Color get primaryColorDark => Theme.of(this).primaryColorDark;

  Color get cardColor => Theme.of(this).cardColor;

  Color get backgroundColor => Theme.of(this).colorScheme.background;

  Color get errorColor => Theme.of(this).colorScheme.error;

  ColorScheme get colorScheme => Theme.of(this).colorScheme;

  Color get outlineVariant => Theme.of(this).colorScheme.outlineVariant;

  Color get scaffoldBackgroundColor => Theme.of(this).scaffoldBackgroundColor;

  Color get secondaryContainer => Theme.of(this).colorScheme.secondaryContainer;

  Color get hintColor => Theme.of(this).hintColor;

  Color get dividerColor => Theme.of(this).dividerColor;

  Color get outline => colorScheme.outline;

  Color get disabledColor => Theme.of(this).disabledColor;

  Color get surface => colorScheme.surface;

  TextStyle get titleLarge => textTheme.titleLarge!;

  TextStyle get titleMedium => textTheme.titleMedium!;

  TextStyle get titleSmall => textTheme.titleSmall!;

  TextStyle get labelLarge => textTheme.labelLarge!;

  TextStyle get labelMedium => textTheme.labelMedium!;

  TextStyle get labelSmall => textTheme.labelSmall!;

  TextStyle get bodyLarge => textTheme.bodyLarge!;

  TextStyle get bodyMedium => textTheme.bodyMedium!;

  TextStyle get bodySmall => textTheme.bodySmall!;

  TextStyle get displayLarge => textTheme.displayLarge!;

  TextStyle get displayMedium => textTheme.displayMedium!;

  TextStyle get displaySmall => textTheme.displaySmall!;

  TextStyle get headlineLarge => textTheme.headlineLarge!;

  TextStyle get headlineMedium => textTheme.headlineMedium!;

  TextStyle get headlineSmall => textTheme.headlineSmall!;
}

extension LocaleExtension on BuildContext {
  Locale get locale => Localizations.localeOf(this);

  String get languageCode => locale.languageCode;

  String get countryCode => locale.countryCode!;

  String get ar => 'ar';
  String get en => 'en';
  String get hi => 'hi';
}

extension StringExtension on BuildContext {
  AppLocalizations get strings => AppLocalizations.of(this)!;
}

extension PaddingExtension on num {
  EdgeInsetsDirectional get paddingAll => EdgeInsetsDirectional.all(toDouble());

  EdgeInsetsDirectional get paddingVert => EdgeInsetsDirectional.symmetric(vertical: toDouble());

  EdgeInsetsDirectional get paddingHoriz => EdgeInsetsDirectional.symmetric(horizontal: toDouble());

  EdgeInsetsDirectional get paddingStart => EdgeInsetsDirectional.only(start: toDouble());

  EdgeInsetsDirectional get paddingEnd => EdgeInsetsDirectional.only(end: toDouble());

  EdgeInsetsDirectional get paddingTop => EdgeInsetsDirectional.only(top: toDouble());

  EdgeInsetsDirectional get paddingBottom => EdgeInsetsDirectional.only(bottom: toDouble());
}

extension EmptyPaadding on num {
  SizedBox get ph => SizedBox(height: toDouble());
  SizedBox get pw => SizedBox(width: toDouble());
}

extension FirstWhereOrNull on List {
  dynamic firstWhereOrNull(bool Function(dynamic) test) {
    for (final element in this) {
      if (test(element)) return element;
    }
    return null;
  }
}
//
extension SizeExtension on BuildContext {
  double get w => MediaQuery.of(this).size.width;

  double get h => MediaQuery.of(this).size.height;

  double get r => MediaQuery.of(this).size.aspectRatio;

  double get sp => MediaQuery.of(this).size.shortestSide;
}


extension StringToInt on String {
  int get toInt => isEmpty ? 0 : int.parse(this);
}
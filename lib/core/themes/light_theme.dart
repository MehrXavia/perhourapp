import 'package:onservice24/src/main_index.dart';


const String fontBold = 'Cairo-Bold';
const String fontRegular = 'Cairo-Regular';
const String fontSemiBold = 'Cairo-SemiBold';
const String fontExtraLight = 'Cairo-ExtraLight';
const String fontLight = 'Cairo-Light';
const String fontMedium = 'Cairo-Medium';



const Color primaryColor = Color(0xFF2A60E4);
const Color lighterDarkColor = Color(0xff252525);
const Color primaryColorDark = Color(0xff121212);
const Color whiteColor = Color(0xffffffff);

Color kGreyColor = const Color(0xff252525).withOpacity(0.40);

final lightTheme = ThemeData(
  primaryColor: primaryColor,
  brightness: Brightness.light,
  //  useMaterial3: true,
  primaryColorDark: primaryColorDark,
  scaffoldBackgroundColor: whiteColor,
  hintColor: const Color(0xffF4F4F4),
  disabledColor: const Color(0xff8F9BB3),
  cardColor: const Color(0xffffffff),
  dividerColor: const Color(0xffCDD4D9),
  iconTheme: const IconThemeData(
    color: kYellowColor,
  ),
  colorScheme: ColorScheme.fromSwatch(
    primarySwatch: Colors.green,
 //   primaryColorDark: const Color(0xFF232323),
    backgroundColor: const  Color(0xffffffff),
    accentColor: const Color(0xff494949),
    errorColor: const Color(0xffF25E02),
  ).copyWith(
    secondaryContainer: const Color(0xffF4F4F4),
      errorContainer: kErrorColor,
    onBackground: kBlueColor,
    onSurface: kBorderColor,
    onSecondary: const Color(0xffE2E2E2),
    secondary: const Color(0xff022332),
    onError: kRedColorEB,
    surface: const Color(0xffFFA010),
     tertiaryContainer: const Color(0xff0095FF),
    outline: const Color(0xffD6D6D6),
    outlineVariant: const Color(0xff494949),
  ),
  appBarTheme: const AppBarTheme(
    systemOverlayStyle: SystemUiOverlayStyle(
      statusBarColor: Colors.white,
      statusBarIconBrightness: Brightness.dark,
    ),
    titleTextStyle: TextStyle(
      fontSize: 18,
      fontFamily: fontBold,
      fontWeight: FontWeight.w600,
      color: primaryColorDark,
    ),
    backgroundColor: whiteColor,
    centerTitle: true,
    elevation: 0,
  ),
  inputDecorationTheme: const InputDecorationTheme(
    filled: true,
    fillColor: Color(0xffffffff),
    hintStyle: TextStyle(
      fontSize: 14,
      fontFamily: 'ProductSans-Regular',
    ),
  ),
  fontFamily: fontBold,
  textTheme:  TextTheme(
    titleLarge: const TextStyle(
      fontSize: 32,
      fontFamily: fontBold,
      fontWeight: FontWeight.w700,
      color: Colors.black,
    ),
    titleMedium: const TextStyle(
      fontSize: 22,
      fontFamily: fontMedium,
      fontWeight: FontWeight.w600,
      color: Colors.black,
    ),
    titleSmall: const TextStyle(
      fontSize: 20.0,
      color: Colors.black,
      fontFamily: fontRegular,
    ),

    bodyLarge: const TextStyle(
      fontSize: 16.0,
      color: Colors.black,
      fontFamily: fontSemiBold,
      fontWeight: FontWeight.w600,
    ),
    bodyMedium: const TextStyle(
      fontSize: 14.0,
      color: Colors.black,
      fontFamily: fontMedium,
      fontWeight: FontWeight.w600,
    ),
    bodySmall: const TextStyle(
      fontSize: 12.0,
      color: Colors.black,
      fontFamily: fontRegular,
    ),
    displayLarge: TextStyle(
      fontSize: 18.0,
      color: kGreyColor,
      fontFamily: fontSemiBold,
      fontWeight: FontWeight.w600,
    ),
    displayMedium: TextStyle(
      fontSize: 16.0,
      color: kGreyColor,
      fontFamily: fontMedium,
      fontWeight: FontWeight.w600,
    ),
    displaySmall: TextStyle(
      fontSize: 14.0,
      color: kGreyColor,
      fontFamily: fontRegular,
    ),
    labelLarge: const TextStyle(
      fontSize: 16.0,
      color: Colors.white,
      fontFamily: fontSemiBold,
      fontWeight: FontWeight.w600,
    ),
    labelMedium: const TextStyle(
      fontSize: 14.0,
      color: Colors.white,
      fontFamily: fontMedium,
      fontWeight: FontWeight.w600,
    ),
    labelSmall: const TextStyle(
      fontSize: 12.0,
      color: Colors.white,
      fontFamily: fontRegular,
      letterSpacing: 1.0,
      wordSpacing: 0.0,
    ),
    headlineSmall: const TextStyle(
      fontSize: 14.0,
      color: primaryColor,
      fontFamily: fontRegular,
    ),
    headlineMedium: const TextStyle(
      fontSize: 16.0,
      color: primaryColor,
      fontFamily: fontMedium,
      fontWeight: FontWeight.w600,
    ),
    headlineLarge: const TextStyle(
      fontSize: 18.0,
      color: primaryColor,
      fontFamily: fontSemiBold,
      fontWeight: FontWeight.w600,
    ),

  ),
);
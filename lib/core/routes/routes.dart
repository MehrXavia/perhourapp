import 'package:flutter/cupertino.dart';
import 'package:onservice24/src/admin/payment/presentation/otp_message/pages/otp_message_page.dart';
import 'package:onservice24/src/shared/auth/presentation/pages/create_new_account_screen.dart';
import 'package:onservice24/src/shared/auth/presentation/create_user_account/create_user_account_page.dart';

import '../../navigation_pages_v2.dart';
import '../../src/admin/notifications/presentation/pages/notifications_page.dart';
 import '../../src/admin/service/presentation/widget/alert.dart';
import '../../src/shared/auth/presentation/login/login_page.dart';
import '../../src/shared/on_boarding/pages/onboarding_screen.dart';
import '../../src/user/profile_user/presentation/pages/user_profile_page.dart';
import '../../src/admin/profile/presentation/profile/pages/profile/profile_service_provider_vistor_page.dart';
import '../../src/admin/service/presentation/pages/sevice_page.dart';
import '../../src/shared/auth/presentation/create_service_provider_account/create_service_provider_account_page.dart';
import '../../src/admin/subscriptions/presentation/pages/subscriptions_page.dart';
import '../../src/shared/auth/presentation/pages/forget-password/enter_phone_number_page.dart';
import '../../src/shared/auth/presentation/pages/forget-password/enter_pin_code_page.dart';
import '../../src/shared/auth/presentation/pages/forget-password/new_password_page.dart';
 import '../../src/shared/support/presentation/pages/support_page.dart';
 import '../../src/user/favourite/presentation/pages/favourite/favourite_page.dart';
 import '../widgets/more_feature/more_admin.dart';
import '../widgets/more_feature/more_user.dart';
import '../../src/admin/profile/presentation/profile/pages/profile/profile_service_provider_page.dart';
import '../../src/user/service_user/presentation/user_service/pages/sevice_user_page.dart';

class Routes {
  static const String languagePage = 'language_page';
  static const String intro = '/';
  static const String createUserAccountPage = 'CreateUserAccountPage';
  static const String createServiceProviderAccountPage =
      'CreateServiceProviderAccountPage';
  static const String login = 'loginUI';
  static const String profilePage = 'profilePage';
  static const String editProfilePage = 'editProfilePage';
  static const String editNamePage = 'editProfilePage';
  static const String editPhoneNumberPage = 'editPhoneNumberPage';
  static const String editEmailPage = 'editEmailPage';
  static const String changePasswordPage = 'changePasswordPage';
  static const String notificationsPage = 'notificationsPage';
  static const String homePage = 'homePage';
  static const String pickupsPage = 'pickupsPage';
  static const String pickupsDetailsPage = 'pickupsDetailsPage';
  static const String ordersPage = 'OrdersTabs';
  static const String orderDetailsPage = 'ordersDetailsPage';
  static const String orderDetailsByCodePage = 'orderDetailsByCodePage';
  static const String invoicesPage = 'invoicesPage';
  static const String qrCodeTabs = 'qrCodeTabs';
  static const String qrCodePage2 = 'qrCodePage2';
  static const String servicePage = 'ServicePage';
  static const String supportPage = 'supportPage';

  static const String onBoardingPage = 'onBoardingPage';
  static const String createNewAccountScreen = 'createNewAccountPage';
  static const String sellCarPage = 'sellCarPage';
  static const String sellCarImagePickerPage = 'sellCarImagePickerPage';
  static const String sellCarPropertiesPage = 'sellCarPropertiesPage';
  static const String favoritesPage = 'favoritesPage';
  static const String brandsPage = 'brandsPage';
  static const String filterPage = 'filterPage';
  static const String sortByPage = 'sortByPage';
  static const String enterPhoneNumberPage = 'enterPhoneNumberPage';
  static const String enterPinCodePage = 'enterPinCodePage';
  static const String newPasswordPage = 'newPasswordPage';
  static const String navigationPages = 'navigationPages';
  static const String carsPage = 'carsPage';
  static const String carDetailsPage = 'carDetailsPage';
  static const String shipmentsTabsPage = 'shipmentsTabsPage';
  static const String shipmentDetails = 'shipmentDetails';
  static const String operations = 'operations';
  static const String walletPage = 'walletPage';
  static const String addComplaintPage = 'addComplaintPage';
  static const String userServicePage = 'UserServicePage';
  static const String profile = 'profile';
  static const String userProfile = 'addProfile';
  static const String profileServiceProviderPage = 'profileServiceProviderPage';
  static const String subscriptionsPage = 'subscriptionsPage';
  static const String notificationPage = 'notificationPage';
  static const String complaints = 'complaints';
  static const String settings = 'settings';
  static const String changeLanguage = 'changeLanguagePage';
  static const String aboutUs = 'aboutLogestePage';
  static const String qrCodePage = 'QrCodePage';
  static const String complaintsDetailsPage = 'complaintsDetailsPage';
  static const String captainsPage = 'captainsPage';
  static const String shipmentsCaptainTabsPage = 'shipmentsCaptainTabsPage';
  static const String markerMapPage = 'markerMapPage';
  static const String moreAdmin = 'moreAdmin';
  static const String moreUser = 'moreUser';
  static const String paymentPage = 'paymentPage';
  static const String editPaymentPage = 'editPaymentPage';
  static const String successPaymentPage = 'successPaymentPage';
  static const String otpMessagePage = 'otpMessagePage';
  static const String alertScreen = 'alertScreen';
 // static const String alert = 'alert';
  static final routes = <String, Widget Function(BuildContext)>{
    intro: (context) => NavigationPagesV2(),
    createUserAccountPage: (context) => CreateUserAccountPage(),
    createServiceProviderAccountPage: (context) =>
        CreateServiceProviderAccountPage(),
    navigationPages: (context) => NavigationPagesV2(),
    login: (context) => LoginPage(),
   // register: (context) => RegisterPage(),
    createNewAccountScreen: (context) => CreateNewAccountScreen(),
    enterPhoneNumberPage: (context) => EnterPhoneNumberPage(),
    enterPinCodePage: (context) => EnterPinCodePage(),
    newPasswordPage: (context) => NewPasswordPage(),
    favoritesPage: (context) => FavouritePage(),
    profile: (context) => ProfileServiceProviderVistorPage(id: 0),
    userProfile: (context) => UserProfilePage(),
    servicePage: (context) => ServicePage(),
    profileServiceProviderPage: (context) => ProfileServiceProviderPage(),
    supportPage: (context) => SupportPage(),
    notificationPage: (context) => NotificationPage(),
    subscriptionsPage: (context) => SubscriptionsPage(),
    userServicePage: (context) => UserServicePage(),
    // supportPage: (context) => SupportPage(),
    moreAdmin: (context) =>  MoreAdmin(),
    moreUser: (context) =>  MoreUser(),
     alertScreen: (context) =>  AlertScreen(),
    onBoardingPage: (context) =>  OnBoardingScreen(),
    otpMessagePage: (context) =>  OtpMessagePage(),
  };
}

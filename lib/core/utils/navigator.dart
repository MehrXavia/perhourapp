
import '../../src/main_index.dart';
import '../../src/user/service_user/presentation/service_map/pages/marker_map_page.dart';
import '../widgets/bottom_bar/persistent_tab_view.dart';

Future<dynamic> pushNamed(String routeName, {dynamic arguments}) async {
  print('routeName: $routeName');
  return injector<ServicesLocator>()
      .navigatorKey
      .currentState!
      .pushNamed(routeName, arguments: arguments);
}

Future<dynamic> pushNamedAndRemoveUntil(String routeName, {dynamic arguments}) {
  return injector<ServicesLocator>()
      .navigatorKey
      .currentState!
      .pushNamedAndRemoveUntil(routeName, (Route<dynamic> route) => false,
      arguments: arguments);
}

Future<dynamic> push(context, Widget page) {
  return PersistentNavBarNavigator.pushNewScreen(
    context,
    screen: page,
    withNavBar: true,
    pageTransitionAnimation: PageTransitionAnimation.cupertino,
  );
  // return injector<ServicesLocator>()
  //     .navigatorKey
  //     .currentState!
  //     .push(MaterialPageRoute(builder: (context) => page));
}

pop({dynamic arguments}) {
  injector<ServicesLocator>()
      .navigatorKey
      .currentState!
      .pop(arguments);
}

class Navigators {

  static GlobalKey<NavigatorState> navigationKey = injector<ServicesLocator>().navigatorKey;

 static Future<dynamic> pushNamed(String routeName, {dynamic arguments}) async {
   print('routeName: $routeName');
    return navigationKey.currentState!
        .pushNamed(routeName, arguments: arguments);
  }

  static Future<dynamic> pushNamedAndRemoveUntil(String routeName,
      {dynamic arguments}) {
    return navigationKey.currentState!.pushNamedAndRemoveUntil(
        routeName, (Route<dynamic> route) => false,
        arguments: arguments);
  }

  static Future<dynamic> pushReplacementNamed(String routeName,
      {dynamic arguments}) {
    return navigationKey.currentState!
        .pushReplacementNamed(routeName, arguments: arguments);
  }

  static void pop({dynamic result}) {
    return navigationKey.currentState!.pop(result);
  }

  static void goBackUntil(String routeName) {
    return navigationKey.currentState!
        .popUntil(ModalRoute.withName(routeName));
  }

  static Future push(Widget screen) {
    return navigationKey.currentState!
        .push(MaterialPageRoute(builder: (context) => screen));
  }
}
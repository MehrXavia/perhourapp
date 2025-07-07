import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

import 'package:onservice24/core/utils/helper_methods.dart';
import 'package:onservice24/src/shared/settings/presentation/bloc/locale_cubit.dart';
import 'package:onservice24/src/shared/settings/presentation/bloc/locale_state.dart';

import 'core/firebase/notification_service.dart';
import 'core/themes/light_theme.dart';
import 'core/network/base_client.dart';
import 'src/main_index.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  // String appId = await FirebaseMessaging.instance.getToken() ?? '';
  // print("====APPIDTOKEN $appId");
//  bool isExpired = await ;
  SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(statusBarColor: Colors.transparent));

  await configureDependencies();

  ServicesLocator().init();
  injector.registerSingleton(ClientCreator(
      interceptor: HeaderInterceptor(
    accessToken: '',
  )).create());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    FirebaseNotification firebase = FirebaseNotification();
    firebase.initialize(context);
    return BlocProvider(
      create: (BuildContext context) => LocaleCubit()..getLanguageData(),
      child: BlocBuilder<LocaleCubit, LocalState>(
        // bloc: LocaleCubit()..getLanguageData(),
        builder: (context, state) {
          print('state.language ${state.language}');
          return FutureBuilder<String>(
              initialData: "",
              future: HelperMethods.getVerify(),
              builder: (context, snapshot) {
                return snapshot.connectionState == ConnectionState.waiting
                    ? Container(
                        color: Colors.white,
                        child: const CircularProgressIndicator())
                    : MaterialApp(
                        theme: lightTheme,
                        debugShowCheckedModeBanner: false,
                        locale: Locale(state.language),
                        navigatorKey: injector<ServicesLocator>().navigatorKey,
                        localizationsDelegates: const [
                          AppLocalizations.delegate,
                          // FallbackLocalizationDelegate(),
                          GlobalMaterialLocalizations.delegate,
                          GlobalWidgetsLocalizations.delegate,
                          GlobalCupertinoLocalizations.delegate,
                        ],
                        supportedLocales: const [
                          Locale('ar'), // English, no country code
                          Locale('en'), // Arabic, no country code
                          // Locale('hi'), // Indian, no country code
                        ],
                        darkTheme: lightTheme,
                        routes: Routes.routes,
                        initialRoute:
                            snapshot.data == "" || snapshot.data == null
                                ? Routes.onBoardingPage
                                : Routes.navigationPages,
                      );
              });
        },
      ),
    );
  }
}

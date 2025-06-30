import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:intl/intl.dart';
import 'package:local_auth/local_auth.dart';
import '../../../../../core/utils/helper_methods.dart';
import '../../../../main_index.dart';
import '../../data/models/login_params.dart';
import '../widgets/phone_text_field.dart';
import 'dart:ui' as ui;

class LoginScreen extends BaseStatelessWidget {
  final Function(LoginParams)? onLogin;
  final Function(bool isFinger) onFinger;
  final int type;

  LoginScreen(
      {Key? key, this.onLogin, required this.type, required this.onFinger})
      : super(key: key);

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  StreamStateInitial<bool> isAcceptStream = StreamStateInitial();

  final TextEditingController phoneNumberController =
      TextEditingController();
  String phoneCode = '+92';
  final LocalAuthentication auth = LocalAuthentication();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: 16.paddingHoriz + (kToolbarHeight).paddingTop,
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // SelectionTypeAccount(
            //   title1: strings.service_provider,
            //   title2: strings.user,
            //   isDisabled: true,
            // ),
            50.ph,
            Text(
              strings.login_desc,
              style: bodyLarge.copyWith(),
            ),
            20.ph,
            Directionality(
              textDirection: ui.TextDirection.rtl,
              child: PhoneTextField(
                phoneNumberController: phoneNumberController,
                onPhoneChanged: (phone) {
                  print("Phone changed: $phone.${phoneNumberController.text}");
                  phoneCode = phone ?? '';
                },
              ),
            ),
            12.ph,
            PrimaryButton(
              title: strings.login,
              onPressed: () async {
                if (_formKey.currentState!.validate()) {
                  String date = DateFormat("yyyy-MM-dd'T'HH:mm:ss")
                      .format(DateTime.now());

                  onLogin!(LoginParams(
                      loginDate: date,
                      fcm: await FirebaseMessaging.instance.getToken() ?? '',
                      phoneNumber: '$phoneCode${phoneNumberController.text}',
                      type: type.toString()));
                }
              },
            ),
            40.ph,
            FutureBuilder(
                future: auth.canCheckBiometrics,
                initialData: false,
                builder: (context, AsyncSnapshot<bool> snapshot) {
                  return Center(
                    child: InkWell(
                      onTap: () async {
                        await _authenticateWithBiometrics();
                      },
                      child: const AppIcon(
                        icon: AppIcons.finger_print,
                        size: 150,
                      ),
                    ),
                  );
                }),
          ],
        ),
      ),
    );
  }

  Future<void> _authenticateWithBiometrics() async {
    String? params = await HelperMethods.getLoginParams();
    bool authenticated = false;
    if (params != null || _formKey.currentState!.validate()) {
      try {
        authenticated = await auth.authenticate(
          localizedReason:
              'Scan your fingerprint (or face or whatever) to authenticate',
          options: const AuthenticationOptions(
            stickyAuth: true,
            biometricOnly: true,
          ),
        );
        if (authenticated) {
          print('authenticated');
          String date =
              DateFormat("yyyy-MM-dd'T'HH:mm:ss").format(DateTime.now());
          onFinger(true);
          params == null
              ? onLogin!(LoginParams(
                  type: type.toString(),
                  loginDate: date,
                  fcm: await FirebaseMessaging.instance.getToken() ?? '',
                  phoneNumber: phoneCode + phoneNumberController.text,
                ))
              : onLogin!(LoginParams(
                  phoneNumber: params,
                  type: type.toString(),
            fcm: await FirebaseMessaging.instance.getToken() ?? '',
                  loginDate: date,
                ));
        }
      } on PlatformException catch (e) {
        print(e);
        authenticated = false;
      }
    } else {
      HelperMethods.showErrorToast(strings.finger_print_msg);
    }
  }
}

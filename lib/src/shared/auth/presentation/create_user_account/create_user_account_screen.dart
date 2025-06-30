import 'package:country_picker/country_picker.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:intl/intl.dart';
import 'package:local_auth/local_auth.dart';
import 'package:location/location.dart';
import 'package:onservice24/core/utils/helper_methods.dart';
import 'package:onservice24/core/utils/navigator.dart';
import 'package:onservice24/core/widgets/buttons/outlined_button_icon.dart';
import 'package:onservice24/src/shared/auth/presentation/create_service_provider_account/set_location/set_location_service_provider_page.dart';
import '../../../../../core/locationservice/locationservice.dart';
import '../../../../../core/resources/validation.dart';
import '../../../../../core/widgets/text-field/custom_text_field.dart';
import '../../../../main_index.dart';
import '../../data/models/register_params.dart';
import '../widgets/check_box_terms_conditions.dart';
import '../widgets/drop_down_gender.dart';
import '../widgets/phone_text_field.dart';
import 'dart:ui' as ui;

class CreateUserAccountScreen extends BaseStatelessWidget {
  final Function(RegisterParams)? onRegister;

  CreateUserAccountScreen({Key? key, this.onRegister}) : super(key: key);

  static final TextEditingController nameController = TextEditingController();

  static final TextEditingController emailController = TextEditingController();

  static final TextEditingController phoneNumberController =
      TextEditingController();

  static final TextEditingController passwordController =
      TextEditingController();

  StreamStateInitial<bool> isAcceptStream = StreamStateInitial();

  static final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  StreamStateInitial<Country> countryStream = StreamStateInitial();

  final LocalAuthentication auth = LocalAuthentication();

  String phoneCode = '+966';
  String gender = '';
  String countryCode = "";
  double? lat;
  double? lng;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: 16.paddingHoriz,
      child: Form(
        key: formKey,
        child: SingleChildScrollView(
          child: SizedBox(
            // height: context.h - 100,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                20.ph,
                CustomTextField(
                  hintText: strings.name,
                  controller: nameController,
                ),
                CustomTextField(
                  hintText: strings.email,
                  controller: emailController,
                  keyboardType: TextInputType.emailAddress,
                  validator: (phone) => Validation.validateEmail(
                      phone ?? '',
                      strings.email_valid,
                      context.strings.this_field_is_required),
                ),
                Directionality(
                  textDirection: ui.TextDirection.rtl,
                  child: PhoneTextField(
                    phoneNumberController: phoneNumberController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return context.strings.this_field_is_required;
                      } else if (value.length <= 8) {
                        return context.strings.less_digits;
                      }else if (phoneCode == "+966") {
                        if (!Validation.isValidPhone(
                            HelperMethods.replaceArabicNumber(value))) {
                          return strings.phone_need;
                        }
                      }
                      return null;
                    },
                    onPhoneChanged: (phone) {
                      phoneCode = phone ?? '';
                    },
                  ),
                ),
                DropDownFieldGender(
                  onChanged: (item) {
                    gender = item ?? '';
                  },
                ),
                10.ph,
                SecondaryButtonIcon(
                  title: strings.my_current_location,
                  icon: AppIcons.location,
                  width: context.w * 0.6,
                  onPressed: () {
                    push(context, SetLocationServiceProviderPage(
                      onGetLocation: (double latt, double lngg,String code) {
                        lat = latt;
                        lng = lngg;
                        countryCode = code;
                      },
                    ));
                  },
                ),
                // 12.ph,
                // FutureBuilder(
                //     future: auth.canCheckBiometrics,
                //     initialData: false,
                //     builder: (context, AsyncSnapshot<bool> snapshot) {
                //       return InkWell(
                //         onTap: () async {
                //           if (formKey.currentState!.validate()) {
                //             await HelperMethods.saveLoginParams(
                //                 phoneCode + phoneNumberController.text);
                //           }
                //         },
                //         child: const AppIcon(
                //           icon: AppIcons.finger_print,
                //           size: 150,
                //         ),
                //       );
                //     }),
                20.ph,
                CheckBoxTermsConditions(
                  onChanged: (value) {
                    isAcceptStream.setData(value ?? false);
                  },
                ),
                StreamBuilder<bool>(
                    stream: isAcceptStream.stream,
                    builder: (context, snapshot) {
                      return PrimaryButton(
                        title: strings.create_account,
                        margin: 30.paddingVert,
                        onPressed: snapshot.data == true
                            ? () {
                                if (formKey.currentState!.validate()) {
                                  onRegisterPressed();
                                }
                              }
                            : null,
                      );
                    }),
              ],
            ),
          ),
        ),
      ),
    );
  }

  onRegisterPressed() async {
    if (lat == null || lng == null || lat == 0.0 || lng == 0.0) {
      HelperMethods.showErrorToast(strings.please_select_location);
      await LocationService.determinePosition(context!);
    } else if (formKey.currentState!.validate()) {
      RegisterParams params = RegisterParams(
          firstName: nameController.text,
          email: emailController.text,
          phoneNumber: '$phoneCode${phoneNumberController.text}',
          lat: lat ?? 0.0,
          lng: lng ?? 0.0,
          photoId: 1,
          type: '1',
          gender: gender,
          createdDate:
          DateFormat("yyyy-MM-dd'T'HH:mm:ss").format(DateTime.now()),
          loginDate: DateFormat("yyyy-MM-dd'T'HH:mm:ss").format(DateTime.now()),
          isLogedOut: false,
          logoutDate: null,
          companyName: '',
          facebook: '',
          insagram: '',
          isDeleted: true,
          isSendNotification: true,
          isverified: true,
          typeOfFile: 1,
          status: true,
          twitter: '',
          nationalityId: 1,
          fcm: await FirebaseMessaging.instance.getToken() ?? '',
          slno: '',
    linkedin: '',
    lastName: '',
    id: 0,
    companyTradeNumber: '',
    fingerprint: '',
    identityPhotoId: 0,
    countryCode: countryCode,
    rateing: 0,
    );
    onRegister!(params);
  }
  }
}

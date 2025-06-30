import 'dart:io';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:intl/intl.dart';
import 'dart:ui' as ui;
import 'package:location/location.dart';
import 'package:onservice24/core/utils/helper_methods.dart';
import 'package:onservice24/core/widgets/buttons/custom_button.dart';
import 'package:onservice24/core/widgets/buttons/outlined_button_icon.dart';
import 'package:onservice24/src/shared/auth/presentation/create_service_provider_account/set_location/set_location_service_provider_page.dart';
import '../../../../../../core/resources/validation.dart';
import '../../../../../../core/widgets/text-field/custom_text_field.dart';
import '../../../../../core/locationservice/locationservice.dart';
import '../../../../../core/utils/navigator.dart';
import '../../../../../core/widgets/text-field/bottom_sheet_text_field_rectangle.dart';
import '../../../../main_index.dart';
import '../../data/models/nationality_dto.dart';
import '../../data/models/register_params.dart';
import '../widgets/check_box_terms_conditions.dart';
import '../widgets/drop_down_gender.dart';
import '../widgets/phone_text_field.dart';
import '../widgets/selection_type_account.dart';

class CreateServiceProviderAccountScreen extends BaseStatelessWidget {
  final List<NationalityDto> nationalities;

  // final Function(File, RegisterParams)? onRegister;
  final Function(RegisterParams)? onRegister;

  CreateServiceProviderAccountScreen(
      {Key? key, this.onRegister, required this.nationalities})
      : super(key: key);

  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();

  TextEditingController emailController = TextEditingController();

  TextEditingController phoneNumberController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  StreamStateInitial<bool> isAcceptStream = StreamStateInitial();
  TextEditingController companyNameController = TextEditingController();
  TextEditingController registrationNoController = TextEditingController();
  TextEditingController nationalIdController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  String phoneCode = '+966';
  String nationalityId = '0';
  String gender = '';
  String countryCode = '';
  File? imageFile;
  double? lat;
  double? lng;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: 16.paddingHoriz,
      child: Form(
        key: formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            20.ph,
            Row(
              children: [
                Expanded(
                  child: CustomTextField(
                    hintText: strings.first_name,
                    controller: firstNameController,
                    validator: (name) => Validation.validateString(name ?? ''),
                  ),
                ),
                10.pw,
                Expanded(
                  child: CustomTextField(
                    hintText: strings.last_name,
                    controller: lastNameController,
                    validator: (name) => Validation.validateString(name ?? ''),
                  ),
                ),
              ],
            ),
            CustomTextField(
              hintText: strings.email,
              controller: emailController,
              keyboardType: TextInputType.emailAddress,
              validator: (phone) => Validation.validateEmail(phone ?? '',
                  strings.email_valid, context.strings.this_field_is_required),
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
                  } else if (phoneCode == "+966") {
                    if (!Validation.isValidPhone(
                        HelperMethods.replaceArabicNumber(value))) {
                      return strings.phone_need;
                    }
                  }
                  return null;
                },
                onPhoneChanged: (phone) {
                  phoneCode = phone ?? '';
                  print('phoneCode ${phoneCode + phoneNumberController.text}');
                },
              ),
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                    child: BottomSheetTextFieldRectangle(
                  hintText: strings.nationality,
                  isScrollControlled: false,
                  setSearch: true,
                  searchHint: strings.search,
                  items: nationalities
                      .map((e) => Item(
                          index: e.id ?? 0,
                          value: getName(e.nameAr ?? '', e.name ?? '') ?? ''))
                      .toList(),
                  onSelectItem: (item) async {
                    nationalityId = item.index.toString();
                  },
                )),
                // Expanded(
                //   child: DropDownField(
                //     hint: strings.nationality,
                //     items: nationalities
                //         .map((e) => DropDownItem(
                //             id: e.id.toString(),
                //             title: getName(e.nameAr ?? '', e.name ?? '')))
                //         .toList(),
                //     onChanged: (item) {
                //       nationalityId = item?.id ?? '';
                //     },
                //   ),
                // ),
                10.pw,
                Expanded(
                  child: DropDownFieldGender(
                    onChanged: (item) {
                      gender = item ?? '';
                    },
                  ),
                ),
              ],
            ),
            10.ph,
            SelectionTypeAccount(
              companyNameController: companyNameController,
              registrationNoController: registrationNoController,
              nationalIdController: nationalIdController,
            ),
            10.ph,
            Row(
              children: [
                // Expanded(
                //   child: StatefulBuilder(builder: (context, setState) {
                //     return SecondaryButtonIcon(
                //       title: imageFile != null
                //           ? imageFile!.path.split('/').last.split('.').last
                //           : strings.id_image,
                //       icon: AppIcons.image_upload,
                //       // width: context.w * 0.6,
                //       onPressed: () async {
                //         DialogsManager.showAlertDialog(
                //           context,
                //           Padding(
                //             padding: 20.paddingHoriz,
                //             child: Column(
                //               children: [
                //                 60.ph,
                //                 customButton(
                //                     buttonText: strings.from_phone,
                //                     buttonColor: kBlueColorE4,
                //                     buttonTextColor: Colors.white,
                //                     buttonFunc: () async {
                //                       final picker =
                //                           await HelperMethods.getImagePicker();
                //                       pop();
                //                       if (picker != null) {
                //                         imageFile = File(picker.path);
                //
                //                         setState(() {});
                //                       }
                //                     }),
                //                 customButton(
                //                     buttonText: strings.from_camera,
                //                     buttonColor: Colors.grey,
                //                     buttonTextColor: Colors.white,
                //                     buttonFunc: () async {
                //                       final picker =
                //                           await HelperMethods.getImageCamera();
                //
                //                       pop();
                //                       if (picker != null) {
                //                         imageFile = File(picker.path);
                //                         setState(() {});
                //                       }
                //                     }),
                //               ],
                //             ),
                //           ),
                //         );
                //       },
                //     );
                //   }),
                // ),
                // 10.pw,
                Expanded(
                  child: SecondaryButtonIcon(
                    title: strings.my_current_location,
                    icon: AppIcons.location,
                    // width: context.w * 0.6,
                    onPressed: () {
                      Navigators.push(SetLocationServiceProviderPage(
                        onGetLocation: (lata, lnng, code) {
                          lat = lata;
                          lng = lnng;
                          countryCode = code;
                          print(lat);
                          print("jhjhjhhvhj");
                        },
                      ));
                    },
                  ),
                ),
              ],
            ),
            20.ph,
            CheckBoxTermsConditions(
              onChanged: (value) {
                isAcceptStream.setData(value ?? false);
              },
            ),
            10.ph,
            // Container(
            //   padding: 10.paddingAll,
            //   decoration:
            //       Decorations.baseDecoration(color: const Color(0xffD3D6D8)),
            //   child: Text(
            //     strings.ms_login,
            //     textAlign: TextAlign.center,
            //     style: kTextMedium.copyWith(
            //         fontSize: 14, color: const Color(0xff41464B)),
            //   ),
            // ),
            StreamBuilder<bool>(
                stream: isAcceptStream.stream,
                builder: (context, snapshot) {
                  return PrimaryButton(
                    title: strings.create_account,
                    margin: 30.paddingVert,
                    onPressed: snapshot.data == true
                        ? () {
                            onRegisterPressed();
                          }
                        : null,
                  );
                }),
          ],
        ),
      ),
    );
  }

  onRegisterPressed() async {
    if (lat == null ||
        lng == null ||
        lat == 0.0 ||
        lng == 0.0 ||
        countryCode == "") {
      {
        HelperMethods.showErrorToast(strings.please_select_location);
        await LocationService.determinePosition(context!);
      }
    } else if (formKey.currentState!.validate()) {
      RegisterParams params = RegisterParams(
        firstName: firstNameController.text,
        lastName: lastNameController.text,
        email: emailController.text,
        phoneNumber: '$phoneCode${phoneNumberController.text}',
        lat: lat ?? 0.0,
        lng: lng ?? 0.0,
        photoId: 0,
        type: '2',
        gender: gender,
        createdDate: DateFormat("yyyy-MM-dd'T'HH:mm:ss").format(DateTime.now()),
        loginDate: DateFormat("yyyy-MM-dd'T'HH:mm:ss").format(DateTime.now()),
        isLogedOut: false,
        logoutDate: null,
        facebook: '',
        insagram: '',
        isDeleted: true,
        isSendNotification: true,
        isverified: true,
        typeOfFile: 1,
        status: true,
        countryCode: countryCode,
        twitter: '',
        nationalityId: nationalityId.toInt,
        fcm: await FirebaseMessaging.instance.getToken() ?? '',
        //  slno: nationalIdController.text,
        //companyName: companyNameController.text,
        linkedin: '',
        id: 0,
        companyTradeNumber: registrationNoController.text,
        fingerprint: '',
        //  identityPhotoId: 0,
        rateing: 0,

      );
      // onRegister!(imageFile!, params);
      onRegister!(params);
    }
  }
}

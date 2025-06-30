import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:intl/intl.dart';
import 'package:onservice24/core/widgets/buttons/custom_button_icon.dart';
import 'package:onservice24/core/widgets/drop_down/drop_down.dart';
import 'package:onservice24/core/widgets/text-field/custom_text_field.dart';
import 'package:onservice24/src/admin/profile/data/models/ProfileDto.dart';
import 'package:onservice24/src/main_index.dart';
import 'dart:ui' as ui;
import '../../../../../core/resources/validation.dart';
import '../../../../../core/utils/navigator.dart';
import '../../../../../core/widgets/buttons/custom_button.dart';
import '../../../../../core/widgets/buttons/outlined_button_icon.dart';
import '../../../../../core/widgets/text-field/text_field_surfix.dart';
import '../../../../admin/profile/data/models/EditProfilePrams.dart';
import '../../../../admin/profile/presentation/profile/pages/profile/set_location/set_location_page.dart';
import '../../../../admin/profile/presentation/profile/widgets/google_maps.dart';
import '../../../../shared/auth/presentation/widgets/drop_down_gender.dart';

class UserProfileScreen extends BaseStatelessWidget {
  UserProfileScreen(
      {super.key,
      required this.profileDto,
      required this.onRefrach,
      required this.onEdit});
  Function(EditProfilePrams editProfilePrams) onEdit;
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController mobileNumberController = TextEditingController();
  static final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String? selected;
  Function() onRefrach;
  String? gender;
  List<DropDownItem> listGender = [
    const DropDownItem(title: "male", id: "1"),
    const DropDownItem(title: "female", id: "2"),
  ];
  final ProfileDataDto profileDto;
  StreamStateInitial<Position?> locationStream =
      StreamStateInitial<Position?>();
  static final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  StreamStateInitial<Country> countryStream = StreamStateInitial();
  @override
  Widget build(BuildContext context) {
    fetchCurrentLocation();
    nameController = TextEditingController(
        text: "${profileDto.firstName ?? " "}${profileDto.lastName ?? " "}");
    emailController = TextEditingController(text: profileDto.email ?? '');
    mobileNumberController =
        TextEditingController(text: profileDto.phoneNumber ?? '');
    gender = profileDto.gender;
    print(gender);
    print("gendergendergender");
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      scrollDirection: Axis.vertical,
      padding: 16.paddingHoriz,
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            15.ph,
            Image.asset(
              profileDto.gender == "male" ? AppIcons.boy : AppIcons.girl,
              width: 100,
              height: 100,
            ),
            20.ph,
            CustomTextField(
              hintText: strings.full_name,
              controller: nameController,
            ),

            CustomTextField(
              hintText: strings.email,
              // hintStyle: kTextRegular.copyWith(fontSize: 25,color: kBlackColor_12),
              controller: emailController,
              validator: (email) => Validation.validateEmail(email ?? '',
                  strings.email_valid, context.strings.this_field_is_required),
            ),
            Directionality(
              textDirection: ui.TextDirection.ltr,
              child: CustomTextField(
                hintText: strings.phone_number,
                controller: mobileNumberController,
                readOnly: true,
              ),
            ),

            // StreamBuilder<Country>(
            //     stream: countryStream.stream,
            //     initialData: CountryService().getAll().first,
            //     builder: (context, snapshot) {
            //       return TextFieldSuffix(
            //         hintText: context.strings.phone_number,
            //         controller: mobileNumberController,
            //         suffixOutText: '${snapshot.data?.phoneCode}+',
            //         suffixInText:
            //             countryCodeToEmoji(snapshot.data?.countryCode ?? ''),
            //         validator: (phone) => Validation.validatePhone(phone ?? ''),
            //         suffixIcon: AppIcons.arrow_down,
            //         onTap: () {
            //           showCountryPicker(
            //             context: context,
            //             showPhoneCode:
            //                 true,
            //             onSelect: (Country country) {
            //               print('Select country: ${country.countryCode}');
            //               countryStream.setData(country);
            //             },
            //           );
            //         },
            //       );
            //     }),
            DropDownFieldGender(
              value: gender,
              onChanged: (item) {
                gender = item ?? '';
              },
            ),
            12.ph,
            buttonLocation(),
            14.ph,
            GoogleMaps(
              lat: double.parse(profileDto.lat.toString()),
              long: double.parse(profileDto.lng.toString()),
            ),
            20.ph,
            SizedBox(
                width: 200,
                child: customButton(
                    buttonText: strings.save,
                    buttonColor: kBlueColorE4,
                    buttonTextColor: Colors.white,
                    buttonFunc: () {
                      onSave();
                    })),
          ],
        ),
      ),
    );
  }

  onUseLocation({required double? latitude, required double? longitude}) {
    DateTime now = DateTime.now();
    String formattedDate = DateFormat("yyyy-MM-dd'T'HH:mm:ss").format(now);
    onEdit(
      EditProfilePrams(
        createdDate: formattedDate,
        companyName: profileDto.companyName ?? '',
        isSendNotification: profileDto.isSendNotification,
        email: profileDto.email,
        facebook: profileDto.facebook,
        firstName: profileDto.firstName,
        fingerprint: profileDto.fingerprint ?? '',
        gender: profileDto.gender,
        insagram: profileDto.insagram,
        lastName: profileDto.lastName,
        linkedin: profileDto.linkedin,
        phoneNumber: profileDto.phoneNumber,
        twitter: profileDto.twitter,
        id: profileDto.id,
        lng: longitude,
        fcm: profileDto.fcm,
        photoId: profileDto.photoId ?? 1,
        companyTradeNumber: profileDto.companyTradeNumber ?? '',
        identityPhotoId: profileDto.identityPhotoId ?? 1,
        nationalityId: profileDto.nationalityId ?? 1,
        isDeleted: profileDto.isDeleted,
        lat: latitude,
        slno: profileDto.slno,
        isverified: profileDto.isverified,
        status: profileDto.status,
        type: profileDto.type,
        typeOfFile: profileDto.typeOfFile ?? 1,
        rateing: profileDto.rateing,
        countryCode: profileDto.countryCode,
      ),
    );
  }

  buttonLocation() {
    return SecondaryButtonIcon(
      icon: AppIcons.location,
      width: 200,
      backgroundColor: Colors.white,
      title: strings.use_my_current_location,
      onPressed: () async {
        Navigators.push(SetLocationPage(
          profileDto: profileDto,
          onRefrach: onRefrach,
        ));
      },
    );
  }

  static String countryCodeToEmoji(String countryCode) {
    if (countryCode.isEmpty) return '';
    // 0x41 is Letter A
    // 0x1F1E6 is Regional Indicator Symbol Letter A
    // Example :
    // firstLetter U => 20 + 0x1F1E6
    // secondLetter S => 18 + 0x1F1E6
    // See: https://en.wikipedia.org/wiki/Regional_Indicator_Symbol
    final int firstLetter = countryCode.codeUnitAt(0) - 0x41 + 0x1F1E6;
    final int secondLetter = countryCode.codeUnitAt(1) - 0x41 + 0x1F1E6;
    return String.fromCharCode(firstLetter) + String.fromCharCode(secondLetter);
  }

  onSave() {
    DateTime now = DateTime.now();
    String formattedDate = DateFormat("yyyy-MM-dd'T'HH:mm:ss").format(now);
    onEdit(EditProfilePrams(
      createdDate: formattedDate,
      companyName: profileDto.companyName ?? '',
      fcm: profileDto.fcm,
      isSendNotification: profileDto.isSendNotification,
      email: emailController.text,
      facebook: profileDto.facebook,
      firstName: nameController.text,
      rateing: profileDto.rateing ?? 0,
      gender: gender,
      id: profileDto.id,
      fingerprint: profileDto.fingerprint ?? '',
      insagram: profileDto.insagram,
      lastName: profileDto.lastName,
      linkedin: profileDto.linkedin,
      phoneNumber: mobileNumberController.text,
      twitter: profileDto.twitter,
      lng: double.parse(profileDto.lng.toString()),
      photoId: 1,
      identityPhotoId: 1,
      companyTradeNumber: "",
      nationalityId: 1, //int.parse(profileDto.slno.toString()),
      isDeleted: profileDto.isDeleted,
      lat: double.parse(profileDto.lat.toString() ?? "0.0") ?? 0.0,
      slno: profileDto.slno,
      isverified: profileDto.isverified,
      status: profileDto.status,
      type: profileDto.type,
      typeOfFile: profileDto.typeOfFile,
      countryCode:  profileDto.countryCode,
    ));
  }

  Future<void> fetchCurrentLocation() async {
    final isAccept = await Geolocator.requestPermission();
    try {
      if (isAccept == LocationPermission.deniedForever) {
        print('LocationPermission.deniedForever');
        fetchCurrentLocation();
      }
      Geolocator.getPositionStream(
        locationSettings: const LocationSettings(
          accuracy: LocationAccuracy.high,
          distanceFilter: 1,
        ),
      ).listen((position) {
        print('position $position');
        locationStream.setData(position);
      });
    } catch (e) {
      print('Error: $e');
    }
  }
}

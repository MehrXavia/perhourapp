import 'dart:io';
import 'dart:ui' as ui;
import 'package:geolocator/geolocator.dart';
import 'package:intl/intl.dart';
import 'package:onservice24/core/utils/navigator.dart';
import 'package:onservice24/core/widgets/buttons/custom_button.dart';
import 'package:onservice24/core/widgets/images/image_network.dart';
import 'package:onservice24/core/widgets/text-field/custom_text_field.dart';
import 'package:onservice24/src/admin/profile/data/models/ProfileDto.dart';
import 'package:onservice24/src/admin/profile/presentation/profile/pages/profile/set_location/set_location_page.dart';
import 'package:onservice24/src/admin/profile/presentation/profile/widgets/google_maps.dart';
import 'package:onservice24/src/admin/profile/presentation/profile/widgets/text_utils.dart';
import 'package:onservice24/src/main_index.dart';
import '../../../../../../../core/utils/helper_methods.dart';
import '../../../../../../../core/widgets/buttons/outlined_button_icon.dart';
import '../../../../data/models/EditProfilePrams.dart';
import '../../widgets/line.dart';
import '../../widgets/rating.dart';

class ProfileServiceProviderScreen extends BaseStatelessWidget {
  ProfileServiceProviderScreen(
      {super.key,
      required this.profileDto,
      required this.onUploadImageAndUpdateProfile,
      required this.onRefrach,
      required this.isUpdateNotification});
  final ProfileDataDto profileDto;
  Function() onRefrach;
  bool isSwitch = false;
  final Function(EditProfilePrams editProfileParams) isUpdateNotification;
  final Function(File, EditProfilePrams) onUploadImageAndUpdateProfile;
  StreamStateInitial<Position?> locationStream =
      StreamStateInitial<Position?>();
  File? imageFile;
  TextEditingController faceBookController = TextEditingController();
  TextEditingController instgramController = TextEditingController();
  TextEditingController linkedInController = TextEditingController();
  TextEditingController xController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    print(profileDto.imageUrl);
    print("jjkjjkkkj");
    fetchCurrentLocation();
    faceBookController = TextEditingController(text: profileDto.facebook ?? '');
    instgramController = TextEditingController(text: profileDto.insagram ?? '');
    linkedInController = TextEditingController(text: profileDto.linkedin ?? '');
    xController = TextEditingController(text: profileDto.twitter ?? '');
    return SingleChildScrollView(
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            30.ph,

            StatefulBuilder(builder: (context, setState) {
              return Stack(
                children: [
                  profileDto.imageUrl == null
                      ? profileDto.gender == "male"
                          ? Image.asset(
                              AppIcons.boy,
                              width: 100,
                              height: 100,
                            )
                          : Image.asset(
                              AppIcons.girl,
                              width: 100,
                              height: 100,
                            )
                      : ImageNetworkCircle(
                          size: 100,
                          image: profileDto.imageUrl,
                        ),
                  Positioned(
                    bottom: 0,
                    left: 0,
                    child: InkWell(
                      onTap: () async {
                        final picker = await HelperMethods.getImagePicker();
                        if (picker != null) {
                          imageFile = File(picker.path);
                          onUploadImageAndUpdateProfile(
                              imageFile ?? File(''),
                              EditProfilePrams(
                                createdDate: profileDto.createdDate,
                                companyName: profileDto.companyName,
                                isSendNotification:
                                    profileDto.isSendNotification,
                                email: profileDto.email,
                                logoutDate: profileDto.logoutDate,
                                loginDate:profileDto.logoutDate ,
                                isLogedOut: profileDto.isLogedOut,
                                facebook: profileDto.facebook,
                                firstName: profileDto.firstName,
                                gender: profileDto.gender,
                                insagram: profileDto.insagram,
                                lastName: profileDto.lastName,
                                linkedin: profileDto.linkedin,
                                phoneNumber: profileDto.phoneNumber,
                                identityPhotoId:
                                    profileDto.identityPhotoId ?? 0,
                                companyTradeNumber:
                                    profileDto.companyTradeNumber ?? '',
                                fcm: profileDto.fcm,
                                twitter: profileDto.twitter,
                                rateing: profileDto.rateing,
                                fingerprint: profileDto.fingerprint,
                                id: profileDto.id ?? 0,
                                lng: double.parse(profileDto.lng.toString()),
                                photoId: profileDto.photoId,
                                nationalityId: profileDto
                                    .nationalityId, //int.parse(profileDto.slno.toString()),
                                isDeleted: profileDto.isDeleted,

                                lat: double.parse(profileDto.lat.toString()),
                                slno: profileDto.slno,
                                isverified: profileDto.isverified,
                                status: profileDto.status,
                                type: profileDto.type,
                                typeOfFile: profileDto.typeOfFile,
                              ));
                          setState(() {});
                        }
                      },
                      child: const CircleAvatar(
                        backgroundColor: kBlueColorE4,
                        radius: 18,
                        child: CircleAvatar(
                          radius: 17,
                          backgroundColor: Colors.white,
                          child: AppIcon(icon: AppIcons.editP, size: 15),
                        ),
                      ),
                    ),
                  )
                ],
              );
            }),

            12.ph,
            Rating(rating: double.parse(profileDto.rateing.toString() ?? "0")),
            12.ph,
            Text(
              "${profileDto.firstName ?? ""} ${profileDto.lastName ?? ""}",
              style: kTextBold.copyWith(fontSize: 17, color: kBlackColor_12),
            ),
            10.ph,
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Directionality(
                      textDirection: ui.TextDirection.ltr,
                      child: iconValue(
                          icon: AppIcons.call,
                          text: profileDto.phoneNumber ?? ""),
                    ),
                    // 20.pw,
                    // iconValue(
                    //     icon: AppIcons.id,
                    //     text: profileDto.slno == null || profileDto.slno == ""
                    //         ? profileDto.companyTradeNumber ?? ''
                    //         : profileDto.slno ?? ""),
                  ],
                ),
                10.ph,
                SizedBox(
                  width: double.infinity,
                  child: Wrap(
                    alignment: WrapAlignment.center,
                    children: [
                      iconValue(
                          icon: AppIcons.message, text: profileDto.email ?? ""),
                      10.pw,
                      iconValue(
                          icon: AppIcons.earth,
                          text: getName(profileDto.nationalityNameAR ?? "",
                              profileDto.nationalityName ?? "")),
                      10.pw,
                      iconValue(
                          icon: AppIcons.sort,
                          text: profileDto.gender == "male"
                              ? strings.male
                              : strings.female),
                    ],
                  ),
                ),
              ],
            ),

            15.ph,
            const Line(),
            15.ph,
            SizedBox(
              width: 150,
              height: 30,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextUtils(text: strings.notifications, fontSize: 16),
                  7.pw,
                  StatefulBuilder(builder: (context, setState) {
                    return Switch(
                        activeColor: kMainColor,
                        value: profileDto.isSendNotification ?? true,
                        onChanged: (value) {
                          setState(() {
                            onNotfication(value: value);
                          });
                        });
                  })
                ],
              ),
            ),
            // 15.ph,

            socialMediaFeildes(),
            buttonLocation(),
            5.ph,
            GoogleMaps(
              lat: double.parse(profileDto.lat.toString()),
              long: double.parse(profileDto.lng.toString()),
            ),
            20.ph,
            SizedBox(
                width: 150,
                child: customButton(
                    buttonText: strings.save,
                    buttonColor: kBlueColorE4,
                    buttonTextColor: Colors.white,
                    buttonFunc: () {
                      if (_formKey.currentState!.validate()) {
                        onSave();
                      }
                    })),
            20.ph,
          ],
        ),
      ),
    );
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

  onNotfication({required bool value}) async {
    DateTime now = DateTime.now() ;
    String formattedDate = DateFormat("yyyy-MM-dd'T'HH:mm:ss").format(now);
    isUpdateNotification(EditProfilePrams(
      createdDate: formattedDate,
      companyName: profileDto.companyName ?? '',
      isSendNotification: value,
      email: profileDto.email ?? '',
      facebook: profileDto.facebook ?? '',
      firstName: profileDto.firstName ?? '',
      gender: profileDto.gender ?? "male",
      rateing: profileDto.rateing ?? 0,
      fingerprint: profileDto.fingerprint ?? '',
      insagram: profileDto.insagram ?? '',
      lastName: profileDto.lastName ?? '',
      linkedin: profileDto.linkedin ?? '',
      phoneNumber: profileDto.phoneNumber ?? '',
      twitter: profileDto.twitter ?? '',
      id: profileDto.id,
      identityPhotoId: profileDto.identityPhotoId ?? 0,
      companyTradeNumber: profileDto.companyTradeNumber ?? '',
      fcm: profileDto.fcm ?? '',
      lng: double.parse(profileDto.lng.toString()) ?? 0,
      photoId: profileDto.photoId ?? 0,
      nationalityId: profileDto.nationalityId ?? 0,
      isDeleted: profileDto.isDeleted,
      lat: double.parse(profileDto.lat.toString()??"0.0") ?? 0.0,
      slno: profileDto.slno ?? '',
      isverified: profileDto.isverified ?? true,
      status: profileDto.status ?? true,
      type: profileDto.type,
      typeOfFile: profileDto.typeOfFile ?? 0,
      logoutDate: profileDto.logoutDate,
      loginDate:profileDto.logoutDate ,
      isLogedOut: profileDto.isLogedOut,
    ));
  }

  onSave() {
    DateTime now = DateTime.now() ;
    String formattedDate = DateFormat("yyyy-MM-dd'T'HH:mm:ss").format(now);
    isUpdateNotification(EditProfilePrams(
      createdDate: formattedDate,
      companyName: profileDto.companyName ?? '',
      isSendNotification: profileDto.isSendNotification ?? true,
      email: profileDto.email ?? '',
      facebook: faceBookController.text ?? '',
      firstName: profileDto.firstName ?? '',
      gender: profileDto.gender ?? "male",
      insagram: instgramController.text ?? '',
      lastName: profileDto.lastName ?? '',
      linkedin: linkedInController.text ?? '',
      phoneNumber: profileDto.phoneNumber ?? "",
      identityPhotoId: profileDto.identityPhotoId ?? 0,
      companyTradeNumber: profileDto.companyTradeNumber ?? '',
      fcm: profileDto.fcm ?? '',
      twitter: xController.text ?? '',
      rateing: profileDto.rateing ?? 0,
      fingerprint: profileDto.fingerprint ?? '',
      id: profileDto.id ?? 0,
      lng: double.parse(profileDto.lng.toString()) ?? 0,
      photoId: profileDto.photoId ?? 0,
      nationalityId: profileDto.nationalityId ?? 0,
      isDeleted: profileDto.isDeleted ?? true,
      lat: double.parse(profileDto.lat.toString()??'0.0')??0,
      slno: profileDto.slno ?? '',
      isverified: profileDto.isverified ?? true,
      status: profileDto.status ?? true,
      type: profileDto.type,
      typeOfFile: profileDto.typeOfFile ?? 0,
      logoutDate: profileDto.logoutDate,
      loginDate:profileDto.logoutDate ,
      isLogedOut: profileDto.isLogedOut,
    ));
  }

  onUseLocation({required double? latitude, required double? longitude}) {
    DateTime now = DateTime.now() ;
    String formattedDate = DateFormat("yyyy-MM-dd'T'HH:mm:ss").format(now);
    isUpdateNotification(
      EditProfilePrams(
        createdDate: formattedDate,
        companyName: profileDto.companyName ?? '',
        isSendNotification: profileDto.isSendNotification,
        email: profileDto.email ?? '',
        facebook: profileDto.facebook ?? '',
        firstName: profileDto.firstName ?? '',
        gender: profileDto.gender ?? '',
        insagram: profileDto.insagram ?? '',
        lastName: profileDto.lastName ?? '',
        linkedin: profileDto.linkedin ?? '',
        phoneNumber: profileDto.phoneNumber ?? '',
        twitter: profileDto.twitter ?? '',
        id: profileDto.id ?? 0,
        lng: longitude,
        photoId: profileDto.photoId ?? 0,
        fingerprint: profileDto.fingerprint ?? '',
        rateing: profileDto.rateing ?? 0,
        companyTradeNumber: profileDto.companyTradeNumber ?? '',
        nationalityId: profileDto.nationalityId ?? 0,
        isDeleted: profileDto.isDeleted,
        lat: latitude,
        slno: profileDto.slno ?? '',
        isverified: profileDto.isverified ?? true,
        status: profileDto.status ?? true,
        type: profileDto.type,
        typeOfFile: profileDto.typeOfFile ?? 0,
        logoutDate: profileDto.logoutDate,
        loginDate:profileDto.logoutDate ,
        isLogedOut: profileDto.isLogedOut,
      ),
    );
  }

  Widget socialMediaFeildes() {
    return Column(
      children: [
        Padding(
          padding: 20.paddingHoriz + 10.paddingVert,
          child: Row(
            children: [
              Expanded(
                child: CustomTextField2(
                  controller: faceBookController,
                  maxLines: 1,
                  prefixIcon: AppIcons.facebook,
                  hintText: strings.enter_the_link,
                  validator: (value) {
                    String pattern = r'(?:(?:http|https):\/\/)?(?:www.)?facebook.com\/(?:(?:\w)*#!\/)?(?:pages\/)?(?:[?\w\-]*\/)?(?:profile.php\?id=(?=\d.*))?([\w\-]*)?';
                    RegExp regExp = RegExp(pattern);
                    if (value == null ||
                        value.characters.length == 0 ||
                        value.isEmpty) {
                      return null;
                    } else {
                      if (!regExp.hasMatch(value)) {
                        return strings.valid_url;
                      }
                      return null;
                    }
                  },
                ),
              ),
              10.pw,
              Expanded(
                child: CustomTextField2(
                  controller: instgramController,
                  prefixIcon: AppIcons.instagram,
                  maxLines: 1,
                  validator: (value) {
                    String pattern = r'(?:(?:http|https):\/\/)?(?:www.)?instagram.com\/(?:(?:\w)*#!\/)?(?:pages\/)?(?:[?\w\-]*\/)?(?:profile.php\?id=(?=\d.*))?([\w\-]*)?';
                    RegExp regExp = RegExp(pattern);
                    if (value == null ||
                        value.characters.length == 0 ||
                        value.isEmpty) {
                      return null;
                    } else {
                      if (!regExp.hasMatch(value)) {
                        return strings.valid_url;
                      }
                      return null;
                    }
                  },
                  hintText: strings.enter_the_link,
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: 20.paddingHoriz + 10.paddingBottom,
          child: Row(
            children: [
              Expanded(
                child: CustomTextField2(
                  controller: xController,
                  prefixIcon: AppIcons.twitter,
                  maxLines: 1,
                  validator: (value) {
                    String pattern =   r'(?:http:\/\/)?(?:www\.)?twitter\.com\/(?:(?:\w)*#!\/)?(?:pages\/)?(?:[\w\-]*\/)*([\w\-]*)';
                    RegExp regExp = RegExp(pattern);
                    if (value == null ||
                        value.characters.length == 0 ||
                        value.isEmpty) {
                      return null;
                    } else {
                      if (!regExp.hasMatch(value)) {
                        return strings.valid_url;
                      }
                      return null;
                    }
                  },
                  hintText: strings.enter_the_link,
                ),
              ),
              10.pw,
              Expanded(
                child: CustomTextField2(
                  controller: linkedInController,
                  prefixIcon: AppIcons.linkedin,
                  maxLines: 1,
                  validator: (value) {
                    String pattern =  r'((https?:\/\/)?((www|\w\w)\.)?linkedin\.com\/)((([\w]{2,3})?)|([^\/]+\/(([\w|\d-&#?=])+\/?){1,}))$';
                    RegExp regExp = RegExp(pattern);
                    if (value == null ||
                        value.characters.length == 0 ||
                        value.isEmpty) {
                      return null;
                    } else {
                      if (!regExp.hasMatch(value)) {
                        return strings.valid_url;
                      }
                      return null;
                    }
                  },
                  hintText: strings.enter_the_link,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  buttonLocation() {
    return SecondaryButtonIcon(
      icon: AppIcons.location,
      width: 280,
      backgroundColor: Colors.white,
      title: strings.use_my_current_location,
      onPressed: () async {
        push(
            context,
            SetLocationPage(
              profileDto: profileDto,
              onRefrach: onRefrach,
            ));
      },
    );
  }

  Widget iconValue({
    required String icon,
    required String text,
  }) {
    return Padding(
      padding: 10.paddingBottom,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          SvgPicture.asset(icon),
          8.pw,
          TextUtils(
            text: text,
            fontSize: 12,
          ),
        ],
      ),
    );
  }

  String? hasValidUrl(String value) {
    String pattern =
        r'(http|https)://[\w-]+(\.[\w-]+)+([\w.,@?^=%&amp;:/~+#-]*[\w@?^=%&amp;/~+#-])?';
    RegExp regExp = new RegExp(pattern);
    if (!regExp.hasMatch(value)) {
      return strings.valid_url;
    }
    return null;
  }
}

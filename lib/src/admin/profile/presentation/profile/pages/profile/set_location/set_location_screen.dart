import 'package:intl/intl.dart';
import 'package:onservice24/src/main_index.dart';
import 'dart:async';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:map_picker/map_picker.dart';
import 'package:geocoding/geocoding.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../../../../core/widgets/buttons/custom_button.dart';
import '../../../../../data/models/EditProfilePrams.dart';
import '../../../../../data/models/ProfileDto.dart';

class SetLocationScreen extends BaseStatelessWidget {
  final double lat;
  final double lng;
  final ProfileDataDto profileDto;
  final Function(EditProfilePrams editProfileParams) onEdit;

  SetLocationScreen(
      {super.key,
      required this.profileDto,
      required this.lat,
      required this.onEdit,
      required this.lng});

  final _controller = Completer<GoogleMapController>();

  MapPickerController mapPickerController = MapPickerController();

  CameraPosition? cameraPosition;

  var textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    cameraPosition = CameraPosition(
      target: LatLng(lat, lng),
      zoom: 14.4746,
    );
    final strings =
        injector<ServicesLocator>().navigatorKey.currentContext!.strings;

    return Scaffold(
      body: Stack(
        alignment: Alignment.topCenter,
        children: [
          MapPicker(
            // pass icon widget
            iconWidget: Stack(
              children: [

                SvgPicture.asset(
                  AppIcons.pin2,
                  height: 70,
                ),

                Positioned(
                  left: 0,
                  top: 0,
                  right: 0,
                  bottom: 7,
                  child:
                      profileDto.imageUrl == null || profileDto.imageUrl == ''
                          ? profileDto.gender == "male"
                              ? Image.asset(
                                  AppIcons.boy,
                                  width: 45,
                                  height: 45,
                                )
                              : Image.asset(
                                  AppIcons.girl,
                                  width: 45,
                                  height: 45,
                                )
                          : Padding(
                              padding: const EdgeInsets.all(3.0),
                              child: CircleAvatar(
                                radius: 27,
                                backgroundImage: NetworkImage(
                                  profileDto.imageUrl ?? '',
                                ),
                              ),
                            ),
                )
              ],
            ),
            //add map picker controller
            mapPickerController: mapPickerController,
            child: GoogleMap(
              myLocationEnabled: true,
              zoomControlsEnabled: false,
              myLocationButtonEnabled: false,
              mapType: MapType.terrain,
              //  camera position
              initialCameraPosition: cameraPosition!,
              onMapCreated: (GoogleMapController controller) {
                _controller.complete(controller);
              },
              onCameraMoveStarted: () {
                // notify map is moving
                mapPickerController.mapMoving!();
                textController.text = "checking ...";
              },
              onCameraMove: (cameraPosition) {
                this.cameraPosition = cameraPosition;
              },
              onCameraIdle: () async {
                // notify map stopped moving
                mapPickerController.mapFinishedMoving!();
                //get address name from camera position
                List<Placemark> placemarks = await placemarkFromCoordinates(
                  cameraPosition!.target.latitude,
                  cameraPosition!.target.longitude,
                );

                // update the ui with the address
                textController.text =
                    '${placemarks.first.name}, ${placemarks.first.administrativeArea}, ${placemarks.first.country}';
              },
            ),
          ),
          Positioned(
            top: MediaQuery.of(context).viewPadding.top + 20,
            width: MediaQuery.of(context).size.width - 50,
            height: 50,
            child: TextFormField(
              maxLines: 3,
              textAlign: TextAlign.center,
              readOnly: true,
              decoration: const InputDecoration(
                  contentPadding: EdgeInsets.zero, border: InputBorder.none),
              controller: textController,
            ),
          ),
          Positioned(
              bottom: 24,
              left: 24,
              right: 24,
              child: customButton(
                  buttonText: strings.save,
                  buttonColor: kBlueColorE4,
                  buttonTextColor: Colors.white,
                  buttonFunc: () {
                    onUseLocation(
                        latitude: cameraPosition!.target.latitude,
                        longitude: cameraPosition!.target.longitude);
                    print(
                        "Location ${cameraPosition!.target.latitude} ${cameraPosition!.target.longitude}");
                    print("Address: ${textController.text}");
                  }))
        ],
      ),
    );
  }

  onUseLocation({required double? latitude, required double? longitude}) {
    DateTime now = DateTime.now();
    String formattedDate = DateFormat("yyyy-MM-dd'T'HH:mm:ss").format(now);
    onEdit(
      EditProfilePrams(
        createdDate: formattedDate,
        companyName: profileDto.companyName,
        isSendNotification: profileDto.isSendNotification,
        email: profileDto.email,
        facebook: profileDto.facebook,
        firstName: profileDto.firstName,
        gender: profileDto.gender,
        fcm: profileDto.fcm,
        identityPhotoId: profileDto.identityPhotoId ?? 1,
        companyTradeNumber: profileDto.companyTradeNumber ?? "",
        insagram: profileDto.insagram,
        lastName: profileDto.lastName,
        linkedin: profileDto.linkedin,
        fingerprint: profileDto.fingerprint ?? '',
        phoneNumber: profileDto.phoneNumber,
        twitter: profileDto.twitter,
        id: profileDto.id,
        rateing: profileDto.rateing,
        lng: longitude,
        photoId: profileDto.photoId ?? 1,
        nationalityId: profileDto.nationalityId ?? 1,
        isDeleted: profileDto.isDeleted,
        lat: latitude,
        slno: profileDto.slno ?? "",
        isverified: profileDto.isverified,
        status: profileDto.status,
        type: profileDto.type,
        typeOfFile: profileDto.typeOfFile ?? 1,
      ),
    );
  }
}

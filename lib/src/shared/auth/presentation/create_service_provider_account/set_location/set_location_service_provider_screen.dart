import 'package:intl/intl.dart';
import 'package:onservice24/src/main_index.dart';
import 'dart:async';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:map_picker/map_picker.dart';
import 'package:geocoding/geocoding.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../../../../../core/widgets/buttons/custom_button.dart';


class SetLocationServiceProviderScreen extends BaseStatelessWidget {
  final double lat;
  final double lng;

  final Function(double lat, double lng) onGetLocation;

  SetLocationServiceProviderScreen(
      {super.key,
      required this.onGetLocation,
      required this.lat,
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
                    onGetLocation(cameraPosition!.target.latitude,
                        cameraPosition!.target.longitude);

                    Navigator.pop(context);
                    print(
                        "Location ${cameraPosition!.target.latitude} ${cameraPosition!.target.longitude}");
                    print("Address: ${textController.text}");
                  }))
        ],
      ),
    );
  }
}

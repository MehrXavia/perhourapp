import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:onservice24/core/exceptions/extensions.dart';

import '../../../../../../core/decorations/decorations.dart';

class GoogleMaps extends StatelessWidget {
  GoogleMaps({super.key, required this.lat, required this.long});

  final double lat;
  final double long;

  final Completer<GoogleMapController> _controller =
      Completer<GoogleMapController>();

  @override
  Widget build(BuildContext context) {
    CameraPosition locationUser = CameraPosition(
      target: LatLng(lat, long),
      zoom: 17,
    );
    return Stack(
      children: [
        Container(
          margin: 10.paddingHoriz + 10.paddingTop,
          clipBehavior: Clip.antiAlias,
          decoration:
              Decorations.baseDecoration(borderColor: Colors.white, radius: 25),
          height: 300,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: GoogleMap(
              scrollGesturesEnabled: true,
              mapType: MapType.terrain,
              myLocationEnabled: true,
              initialCameraPosition: locationUser,
              onMapCreated: (GoogleMapController controller) {
                _controller.complete(controller);
              },
            ),
          ),
        ),
      ],
    );
  }
}

import 'dart:async';
import 'dart:developer';
import 'package:custom_map_markers/custom_map_markers.dart';

import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:pulsator/pulsator.dart';
import 'package:flutter/services.dart' show rootBundle;
import '../../../../../../core/utils/helper_methods.dart';
import '../../../../../main_index.dart';
import '../../../data/models/ServiceProviderMarker.dart';
import '../../../data/models/Service_marker_dto.dart';
import '../../../data/models/SubServiceDto.dart';
import '../../widgets/user_infromation.dart';

class GetMarker extends StatefulWidget {
  final List<SubServiceDto> data;
  final double lat;
  final double long;
  final Function(int idService) onFetchMarker;
  final StreamState<List<ServiceProviderMarker>?> serviceMarkerStream;
  final Function(ServiceProviderMarker?)? onSelected;
  const GetMarker({
    super.key,
    required this.data,
    required this.onFetchMarker,
    required this.serviceMarkerStream,
    this.onSelected,
    required this.lat,
    required this.long,
  });

  @override
  State<GetMarker> createState() => _GetMarkerState();
}

class _GetMarkerState extends State<GetMarker> {
  late GoogleMapController mapController;

  LatLng? _currentPosition;

  bool _isLoading = true;
  String? _mapStyle;
  List<MarkerData> _customMarkers = [];
  StreamStateInitial<ServiceProviderMarker?> serviceStream =
      StreamStateInitial();
  StreamStateInitial<ServiceProviderMarker?> onSelectMarker =
      StreamStateInitial();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getLocation();
    rootBundle.loadString('assets/json/map_style.txt').then((string) {
      _mapStyle = string;
    });
    widget.serviceMarkerStream.stream.listen((event) {
      _customMarkers = [];
      log('event $event');
      //   if (event is DataSuccess) {
      event?.forEach((element) {
        _customMarkers.add(MarkerData(
          marker: Marker(
              markerId: MarkerId(element.id.toString()),
              position:
                  LatLng(element.lat ?? widget.lat, element.lng ?? widget.long),
              onTap: () {
                widget.onSelected!(element);
                onSelectMarker.setData(element);
                serviceStream.setData(element);
                setState(() {});
              }),
          child: _customMarker3(element),
        ));
      });
      setState(() {});
      //   }
    });
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<int>(
        future: HelperMethods.getUserId(),
        builder: (context, snap) {
          return Stack(
            alignment: Alignment.bottomCenter,
            children: [
              _currentPosition == null
                  ? const Center(child: CircularProgressIndicator())
                  : CustomGoogleMapMarkerBuilder(
                      customMarkers: _customMarkers,
                      builder: (BuildContext context, Set<Marker>? markers) {
                        return GoogleMap(
                          myLocationEnabled: true,
                          myLocationButtonEnabled: true,
                          onTap: (data) {
                            widget.onSelected!(null);
                            onSelectMarker.setData(null);
                            serviceStream.setData(null);
                            setState(() {});
                          },
                          mapType: MapType.terrain,
                          initialCameraPosition: CameraPosition(
                            target: _currentPosition!,
                            zoom: 14.5,
                          ),
                          markers: markers ?? {},
                          onMapCreated: (GoogleMapController controller) {
                            mapController = controller;
                            mapController.setMapStyle(_mapStyle);
                          },
                        );
                      },
                    ),
            ],
          );
        });
  }

  getLocation() async {
    LocationPermission permission;
    permission = await Geolocator.requestPermission();

    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);

    setState(() {
      double lat = position.latitude;
      double long = position.longitude;
      LatLng location = LatLng(lat, long);
      _currentPosition = location;
      _isLoading = false;
    });
  }

  _customMarker3(ServiceProviderMarker profileDto) {
    return Stack(
      alignment: Alignment.center,
      children: [
        StreamBuilder<ServiceProviderMarker?>(
            stream: onSelectMarker.stream,
            //   initialData: false,
            builder: (context, snapshot) {
              print(snapshot.data);
              print("jkjkjkjkjk");
              return snapshot.data == profileDto
                  ? SizedBox(
                      height: 120,
                      width: 120,
                      child: Pulsator(
                        style: const PulseStyle(
                            color: kBlueColorE4,
                            startSize: .5,
                            gradientStyle: PulseGradientStyle(
                                start: .5,
                                reverseColors: true,
                                startColor: kBlueColorE4)),
                        count: 4,
                        duration: const Duration(seconds: 4),
                        repeat: 100,
                        startFromScratch: false,
                        autoStart: true,
                        fit: PulseFit.contain,
                        child: AppIcon(
                          icon: AppIcons.pin2,
                          size: 60,
                          padding: 7.paddingTop,
                        ),
                      ))
                  : SizedBox(
                      height: 60,
                      width: 60,
                      child: AppIcon(
                        icon: AppIcons.pin2,
                        size: 60,
                        padding: 7.paddingTop,
                      ),
                    );
            }),
        StreamBuilder<ServiceProviderMarker?>(
            stream: onSelectMarker.stream,
            builder: (context, snapshot) {
              return Positioned(
                left: snapshot.data == profileDto ? 30 : 8,
                right: snapshot.data == profileDto ? 30 : 8,
                top: snapshot.data == profileDto ? 30 : 8,
                bottom: snapshot.data == profileDto ? 30 : 7,
                child: ClipOval(
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
                          : Image.network(
                              profileDto.imageUrl ?? '',
                              fit: BoxFit.fill,
                              width: 45,
                              height: 45,
                            ),
                ),
              );
            }),
      ],
    );
  }
}

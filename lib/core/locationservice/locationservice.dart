import 'package:onservice24/core/exceptions/extensions.dart';
import 'package:onservice24/core/locationservice/permission_denied_exception.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:location/location.dart';

import '../widgets/dialogs/dialogs_manager.dart';
import 'location_service_disabled_exception.dart';

class PermissionSettingScreen extends StatefulWidget {
  static const routeName = '/PermissionSettingScreen';
  @override
  State<StatefulWidget> createState() {
    return _PermissionSettingScreen();
  }
}

class _PermissionSettingScreen extends State<PermissionSettingScreen>
    with WidgetsBindingObserver {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

// THIS is called whenever life cycle changed
  void didChangeAppLifecycleState(AppLifecycleState state) async {
    print('didChangeAppLifecycleState $state');

    if (state == AppLifecycleState.resumed) {}
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          const Text('_permissionGranted'),
          ElevatedButton(
            child: Text('Open App Settings'),
            onPressed: () async {
              final open = await Geolocator.openAppSettings();
              print('openAppSettings $open');
            },
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }
}

class LocationService {
  static Future<bool> requestLocationPermission(BuildContext context) async {
    Location location = Location();

    bool _serviceEnabled;
    PermissionStatus _permissionGranted;

    _permissionGranted = await location.hasPermission();
    print('_permissionGranted $_permissionGranted');
    if (_permissionGranted == PermissionStatus.denied) {
      _permissionGranted = await location.requestPermission();
      if (_permissionGranted != PermissionStatus.granted) {
        return Future.error(LocationPermissionDeniedException());
      }
    }

    _serviceEnabled = await location.serviceEnabled();
    if (!_serviceEnabled) {
      _serviceEnabled = await location.requestService();
      if (!_serviceEnabled) {
        return Future.error(const LocationServiceDisabledException());
      }
    }
    return true;
  }

  static Future<LocationData> determinePosition(BuildContext context) async {
    Location location = Location();

    bool _serviceEnabled;
    PermissionStatus _permissionGranted;
    LocationData _locationData;

    _permissionGranted = await location.hasPermission();
    print('_permissionGranted $_permissionGranted');
    if (_permissionGranted == PermissionStatus.denied) {
      _permissionGranted = await location.requestPermission();
      if (_permissionGranted != PermissionStatus.granted) {
        print('_permissionGranted not grant');
        return Future.error(LocationPermissionDeniedException());
      }
    }

    _serviceEnabled = await location.serviceEnabled();
    if (!_serviceEnabled) {
      _serviceEnabled = await location.requestService();
      if (!_serviceEnabled) {
        return Future.error(AppLocationServiceDisabledException());
      }
    }

    _locationData = await location.getLocation();
    return _locationData;
  }

  static Future<Stream<LocationData>> startPositionStream(BuildContext context) async {
    Location location = Location();

    bool _serviceEnabled;
    PermissionStatus _permissionGranted;
    _permissionGranted = await location.hasPermission();
    print('_permissionGranted $_permissionGranted');
    if (_permissionGranted == PermissionStatus.denied) {
      _permissionGranted = await location.requestPermission();
      if (_permissionGranted != PermissionStatus.granted) {
        print('_permissionGranted not grant');
        return Future.error(LocationPermissionDeniedException());
      }
    }

    _serviceEnabled = await location.serviceEnabled();
    if (!_serviceEnabled) {
      _serviceEnabled = await location.requestService();
      if (!_serviceEnabled) {
        return Future.error(AppLocationServiceDisabledException());
      }
    }

    return location.onLocationChanged;
  }

  static void handleFetchLocationException(e, BuildContext context) {
    if (e is LocationPermissionDeniedException) {
      DialogsManager.baseDialog(context,
          icon: Icons.location_off,
          message: e.toString(),
          confirmButtonName: context.getStrings().open_app_settings, onClickOk: () {
        Geolocator.openAppSettings();
      });
    } else if (e is AppLocationServiceDisabledException) {
      DialogsManager.baseDialog(context,
          icon: Icons.location_off,
          message: e.toString(),
          confirmButtonName: context.getStrings().open_location_settings,
          onClickOk: () {
        Geolocator.openLocationSettings();
      });
    } else {
      DialogsManager.showErrorDialog(context, e.toString(),);
    }
  }
}
import 'package:custom_map_markers/custom_map_markers.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:onservice24/core/exceptions/extensions.dart';
import 'package:onservice24/core/widgets/buttons/app_icon.dart';
import 'package:onservice24/core/widgets/images/image_network.dart';

import 'assets/app_icons.dart';


class CustomMarker extends StatelessWidget {
  const CustomMarker({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Custom Marker Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Custom Marker Example'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final locations = const [
    LatLng(37.42796133580664, -122.085749655962),
    LatLng(37.41796133580664, -122.085749655962),
    LatLng(37.43796133580664, -122.085749655962),
    LatLng(37.42796133580664, -122.095749655962),
    LatLng(37.42796133580664, -122.075749655962),
  ];

  late List<MarkerData> _customMarkers;

  @override
  void initState() {
    super.initState();
    _customMarkers = [
      MarkerData(
          marker:
          Marker(markerId: const MarkerId('id-1'), position: locations[0]),
          child: _customMarker2('Everywhere\nis a Widgets', Colors.blue)),
      MarkerData(
          marker:
          Marker(markerId: const MarkerId('id-5'), position: locations[4]),
          child: _customMarker3('A', Colors.black)),
      MarkerData(
          marker:
          Marker(markerId: const MarkerId('id-2'), position: locations[1]),
          child: _customMarker3('B', Colors.red)),
      MarkerData(
          marker:
          Marker(markerId: const MarkerId('id-3'), position: locations[2]),
          child: _customMarker3('C', Colors.green)),
      MarkerData(
          marker:
          Marker(markerId: const MarkerId('id-4'), position: locations[3]),
          child: _customMarker2('D', Colors.purple)),
      MarkerData(
          marker:
          Marker(markerId: const MarkerId('id-5'), position: locations[4]),
          child: _customMarker('A', Colors.blue)),

    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            if (_customMarkers.isNotEmpty) {
              _customMarkers.removeLast();
            }
          });
        },
      ),
      body: CustomGoogleMapMarkerBuilder(
        //screenshotDelay: const Duration(seconds: 4),
        customMarkers: _customMarkers,
        builder: (BuildContext context, Set<Marker>? markers) {
          if (markers == null) {
            return const Center(child: CircularProgressIndicator());
          }
          return GoogleMap(
            initialCameraPosition: const CameraPosition(
              target: LatLng(37.42796133580664, -122.085749655962),
              zoom: 14.4746,
            ),
            markers: markers,
            onMapCreated: (GoogleMapController controller) {},
          );
        },
      ),
    );
  }

  _customMarker(String symbol, Color color) {
    return Stack(
      children: [
        Icon(
          Icons.add_location,
          color: color,
          size: 50,
        ),
        Positioned(
          left: 15,
          top: 8,
          child: Container(
            width: 20,
            height: 20,
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(10)),
            child: Center(child: Text(symbol)),
          ),
        )
      ],
    );
  }

  _customMarker2(String symbol, Color color) {
    return Container(
      width: 30,
      height: 30,
      margin: const EdgeInsets.all(8),
      child: Center(child: Icon(Icons.perm_camera_mic, color: color)),
    );
  }

  _customMarker3(String text, Color color) {
    return Stack(
      alignment: Alignment.center,
      children: [
        AppIcon(
          icon: AppIcons.pin2,
          size: 60,
          padding: 6.paddingTop,
        ),
        ClipOval(
          child: Image.network(
            'https://deepai.org/static/images/cyberpunkdolphin.png',
            fit: BoxFit.fill,
            width: 43,
            height: 43,
          ),
        ),
      ],
    );
  }
}
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:onservice24/core/utils/helper_methods.dart';
import 'package:onservice24/src/admin/service/presentation/widget/slider_widget.dart';
import 'package:onservice24/src/main_index.dart';

import '../../../../../../core/utils/navigator.dart';

import '../../../../../../core/widgets/buttons/outlined_button_icon.dart';
import '../../../../../admin/service/data/models/Slider_dto.dart';
import '../../../../../shared/auth/data/models/profile_dto.dart';
import '../../../data/models/ServiceUserDto.dart';
import '../../service_map/pages/marker_map_page.dart';
import '../../widgets/item_user_service.dart';

class ServiceUserScreen extends BaseStatelessWidget {
  StreamStateInitial<Position?> locationStream =
      StreamStateInitial<Position?>();
  Function({required double lat, required double lng}) onUseLocation;
  final List<ServiceUserDto> serviceUserDto;
  List<SliderDto> slider;
  StreamState<List<ServiceUserDto>> serviceStream;
String countryCode;
  LatLng latlng;
  ServiceUserScreen(
      {super.key,
      required this.slider,
      required this.serviceStream,
      required this.latlng,
      required this.countryCode,
      required this.onUseLocation,
      required this.serviceUserDto});

  double lat = 0;
  double lng = 0;

  @override
  Widget build(BuildContext context) {
    fetchCurrentLocation();
    return Column(
      children: [
        10.ph,
        Padding(
          padding: 10.paddingHoriz,
          child: SliderWidget(slider: slider),
        ),
        10.ph,
        buttonLocation(),
        Expanded(
          child: StreamBuilder<List<ServiceUserDto>>(
            stream: serviceStream.stream,
            initialData: serviceUserDto,
            builder: (context, snapshot) {
              return snapshot.data!.isNotEmpty
                  ? ListView.builder(
                      itemCount: snapshot.data?.length,
                      itemBuilder: (context, index) {
                        return snapshot.data!.isNotEmpty
                            ? InkWell(
                                onTap: () async {
                                  ProfileDto? data =
                                      await HelperMethods.getProfile();
                                  push(
                                    context,
                                    MarkerMapPage(
                                      serviceUserDto: snapshot.data![index],
                                      lat: latlng.latitude ,
                                      lon: latlng.longitude,
                                        countryCode:countryCode
                                    ),
                                  );
                                },
                                child: ItemServiceUserScreen(
                                  serviceUserDto: snapshot.data![index],
                                ),
                              )
                            : const CircularProgressIndicator();
                      },
                    )
                  : Center(
                      child: Text(
                        strings.no_service,
                        style: kTextMedium,
                      ),
                    );
            },
          ),
        ),
      ],
    );
  }

  buttonLocation() {
    bool isChange=false;
    return StatefulBuilder(
      builder: (context,setState) {
        return StreamBuilder<Position?>(
          stream: locationStream.stream,
          builder: (context, snapshot) {
            return SecondaryButtonIcon(
              title:isChange==false? strings.services_closest_me:strings.services_all,
              icon: AppIcons.location,
              width: context.w * 0.6,
              onPressed: () async {
                isChange=!isChange;
                await onUseLocation(
                    lat: isChange==true?snapshot.data?.latitude ?? 0:0,
                    lng:isChange==true? snapshot.data?.longitude ?? 0:0);
                lat = isChange==true?snapshot.data?.latitude ?? 0:0;
                lng = isChange==true? snapshot.data?.longitude ?? 0:0;
                setState((){});
              },
            );
          },
        );
      }
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
}

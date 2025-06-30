import 'package:flutter/material.dart';
import 'package:onservice24/src/main_index.dart';

import '../../../../../../core/widgets/buttons/selection_button_chip.dart';
import '../../../data/models/ServiceProviderMarker.dart';
import '../../../data/models/Service_marker_dto.dart';
import '../../../data/models/SubServiceDto.dart';
import '../../widgets/user_infromation.dart';
import '../widgets/get_marker.dart';

class MarkerMapScreen extends BaseStatelessWidget {
  MarkerMapScreen(
      {super.key,
      required this.onNotifications,
      required this.data,
      required this.onFetchMarker,
        required this.lat, required this.long,
        required this.serviceMarkerStream,
      required this.isFavoriteStream,
      this.onFavorite});
  final List<SubServiceDto> data;
  final   double lat;
  final   double long;
  final StreamStateInitial<bool> isFavoriteStream;
  final Function(int serviceProviderId, int subServiceId)? onFavorite;
  final Function(int idService) onFetchMarker;
  final StreamState<List<ServiceProviderMarker>?> serviceMarkerStream;
  final Function(int notificationsTypeId, int serviceProviderId)
      onNotifications;

  StreamStateInitial<ServiceProviderMarker?> serviceStream =
      StreamStateInitial();
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        GetMarker(
          data: data,
          lat:lat,
          long:long,
          onFetchMarker: onFetchMarker,
          serviceMarkerStream: serviceMarkerStream,
          onSelected: (ServiceProviderMarker? serviceMarkerDto) {
            serviceStream.setData(serviceMarkerDto);
          },
        ),
        listSubService(),
        StreamBuilder<ServiceProviderMarker?>(
            stream: serviceStream.stream,
            builder: (context, snapshot) {
              return snapshot.data == null
                  ? 0.ph
                  : UserInformation(
                      profileDto: snapshot.data!,
                      isFavoriteStream: isFavoriteStream,
                      onFavorite: onFavorite,
                      onNotifications: onNotifications,
                    );
            }),
      ],
    );
  }

  listSubService() {
    return Positioned(
      bottom: 20,
      left: 10,
      right: 10,
      child: Container(
        // height: 40,
        margin: 5.paddingAll,
        padding: 5.paddingAll,
        alignment: Alignment.center,
        decoration: Decorations.decorationBorderShadow(
            radius: 30,
            color: Colors.white,
            borderColor: Colors.white,
            colorShadow: kBlueColorE4.withOpacity(.01)),
        child: SelectionButtonChip(
          types: data
              .map((e) => ChipItem(
                    title: getName(e.arName ?? '', e.enName ?? ''),
                    id: e.id.toString(),
                  ))
              .toList(),
          isScrollable: false,
          onSelected: (data) {
            onFetchMarker(int.parse(data.id.toString()));
          },
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:onservice24/core/components/base_widget_bloc.dart';
import 'package:onservice24/core/exceptions/extensions.dart';
import 'package:onservice24/core/resources/data_state.dart';
import 'package:onservice24/src/user/service_user/data/models/Service_marker_params.dart';

import '../../../data/models/ServiceUserDto.dart';
import '../../../data/models/SubServiceDto.dart';
import '../cubit/marker_map_cubit.dart';
import 'marker_map_screen.dart';

//
class MarkerMapPage
    extends BaseBlocWidget<DataSuccess<List<SubServiceDto>>, MarkerMapCubit> {
  MarkerMapPage(
      {Key? key,
      required this.serviceUserDto,
      required this.countryCode,
      required this.lat,
      required this.lon})
      : super(key: key);
  ServiceUserDto serviceUserDto;
  double lat, lon;
  String countryCode;
  @override
  String? title(BuildContext context) {
    return getName(serviceUserDto.arName ?? '', serviceUserDto.enName ?? '');
  }

  @override
  void loadInitialData(BuildContext context) {
    bloc.fetchSubService(
      idService: int.parse(serviceUserDto.id.toString() ?? "0"),
      lat: lat,
      countryCode: countryCode,
      lon: lon,
    );
  }

  @override
  bool? isBackHome(BuildContext context) {
    return false;
  }

  @override
  Widget buildWidget(
      BuildContext context, DataSuccess<List<SubServiceDto>> state) {
    print(serviceUserDto.id);
    print("serviceUserDtoserviceUserDtoserviceUserDto   $lat");
    return MarkerMapScreen(
      lat: lat,
      long: lon,
      data: state.data ?? [],
      onNotifications: (notificationsTypeId, serviceProviderId) {
        bloc.addNotification(
            notificationsTypeId: notificationsTypeId,
            serviceProviderId: serviceProviderId);
      },
      serviceMarkerStream: bloc.serviceMarkerStream,
      onFetchMarker: (idService) {
        bloc.fetchServiceMarkerStream(
            serviceMarkerParams: ServiceMarkerParams(
                lon: lon,
                lat: lat,
                serviceId: idService,
                countryCode: countryCode));
      },
      isFavoriteStream: bloc.isFavoriteStream,
      onFavorite: (serviceProviderId, subServiceId) {
        bloc.addFavourite(
            serviceProviderId: serviceProviderId, subServiceId: subServiceId);
      },
    );
  }
}

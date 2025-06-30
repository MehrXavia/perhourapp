import 'dart:async';

import 'package:injectable/injectable.dart';
import 'package:onservice24/src/admin/profile/data/models/ProfileDto.dart';


 import '../data_sources/service_user_datasource.dart';
 import '../models/AddNotificationPrams.dart';
import '../models/ServiceProviderMarker.dart';
import '../models/ServiceUserDto.dart';
import '../models/Service_marker_dto.dart';
import '../models/Service_marker_params.dart';
import '../models/SubServiceDto.dart';
import '../models/service_prams.dart';


@injectable
class ServiceUserRepository {
  final ServiceUserDataSource _api;

  ServiceUserRepository(this._api);



  Future<List<ServiceUserDto>> fetchService({required ServicePrams servicePrams}) async {
    final response = await _api.fetchService(servicePrams);
    return response.data!;
  }


  Future<List<SubServiceDto>> fetchSubService({required int idService}) async {
    final response = await _api.fetchSubService(idService);
    return response.data!;
  }

  Future<String> addNotification({required AddNotificationPrams addNotificationPrams}) async {
    final response = await _api.addNotification(addNotificationPrams);
    return response.message();
  }


  Future<List<ServiceProviderMarker>> fetchUserLocation({required ServiceMarkerParams serviceMarkerParams}) async {
    final response = await _api.fetchUserLocation(serviceMarkerParams);
    return response.data!;
  }

}

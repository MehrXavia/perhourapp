import 'dart:async';

import 'package:injectable/injectable.dart';
import 'package:onservice24/src/admin/service/data/data_sources/service_datasource.dart';

import '../../../../../core/network/api_response.dart';
import '../models/AllSubCategory.dart';
import '../models/GetAllService.dart';
import '../models/Slider_dto.dart';
import '../models/add_service_pramt.dart';

@injectable
class ServiceRepository {
  final ServiceDataSource _api;

  ServiceRepository(this._api);

  Future<String> addService({required AddServicePramt addServicePramt}) async {
    final response = await _api.addService(addServicePramt);
    print(response.message);
    print("message Data  service");
    return response.message();
  } Future<String> editService({required AddServicePramt addServicePramt}) async {
    final response = await _api.editService(addServicePramt);
    print(response.message);
    print("message Data  service");
    return response.message();
  }
  Future<String> deleteService({required int  id}) async {
    final response = await _api.deleteService(id);
    print(response.message);
    print("message Data  service");
    return response.message();
  }

  Future<List<GetAllService>> getService({required int id}) async {
    final response = await _api.getServiceByIdServiceProvider(id);
    return response.data ?? [];
  }

  Future<List<SliderDto>> fetchAdvertisement( ) async {
    final response = await _api.fetchAdvertisement();
    return response.data ?? [];

  }

  Future<List<AllSubCategory>> getAllSubService() async {
    final response = await _api.getAllSubService();
    return response.data ?? [];
  }
}

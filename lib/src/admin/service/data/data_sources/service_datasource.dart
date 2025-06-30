import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';
import 'package:onservice24/core/utils/constants.dart';
import 'package:onservice24/core/network/api_response.dart';
import '../models/AllSubCategory.dart';
import '../models/GetAllService.dart';
import '../models/Slider_dto.dart';
import '../models/add_service_pramt.dart';

part 'service_datasource.g.dart';

@Injectable()
@RestApi(baseUrl: kBaseUrl)
abstract class ServiceDataSource {
  @factoryMethod
  factory ServiceDataSource(Dio dio) = _ServiceDataSource;

  @POST('/ServiceProviderService/Add')
  Future<ApiResponse> addService(@Body() AddServicePramt params);

  @POST('/ServiceProviderService/Edit')
  Future<ApiResponse> editService(@Body() AddServicePramt params);

  @POST('/ServiceProviderService/Delete')
  Future<ApiResponse> deleteService(@Query("ServiceId") int id);

  @GET('/ServiceProviderService/Get,{ServiceProviderId}')
  Future<ApiResponse<List<GetAllService>>> getServiceByIdServiceProvider(@Path("ServiceProviderId")  int serviceProviderId);

  @GET('/Service/GetAll')
  Future<ApiResponse<List<AllSubCategory>>> getAllSubService();

  @GET('/Advertisement/GetAll')
  Future<ApiResponse<List<SliderDto>>> fetchAdvertisement();

}

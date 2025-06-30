import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:onservice24/src/admin/profile/data/models/ProfileDto.dart';
import 'package:onservice24/src/user/service_user/data/models/AddNotificationPrams.dart';
import 'package:onservice24/src/user/service_user/data/models/Service_marker_params.dart';
import 'package:onservice24/src/user/service_user/data/models/Service_marker_dto.dart';
import 'package:retrofit/retrofit.dart';
import 'package:onservice24/core/utils/constants.dart';
import 'package:onservice24/core/network/api_response.dart';

import '../models/ServiceProviderMarker.dart';
import '../models/ServiceUserDto.dart';
import '../models/SubServiceDto.dart';
import '../models/service_prams.dart';




part 'service_user_datasource.g.dart';

@Injectable()
@RestApi(baseUrl: kBaseUrl)
abstract class ServiceUserDataSource {
  @factoryMethod
  factory ServiceUserDataSource(Dio dio) = _ServiceUserDataSource;

  @POST('/Account/GetCatLocations')
  Future<ApiResponse<List<ServiceUserDto>>> fetchService(@Body() ServicePrams servicePrams);

  @GET('/Service/GetMainCategoryServices,{MainCategoryId}')
  Future<ApiResponse<List<SubServiceDto>>> fetchSubService(@Path("MainCategoryId") int idService);

  @POST('/Account/GetUserLocations')
  Future<ApiResponse<List<ServiceProviderMarker>>> fetchUserLocation(@Body() ServiceMarkerParams serviceMarkerParams);

  @POST('/Notification/AddNotification')
  Future<ApiResponse> addNotification(@Body() AddNotificationPrams  addNotificationPrams);

}

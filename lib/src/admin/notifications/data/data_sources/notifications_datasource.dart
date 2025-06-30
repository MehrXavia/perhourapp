import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:onservice24/src/admin/notifications/data/models/NotificationsDto.dart';
import 'package:retrofit/retrofit.dart';
import 'package:onservice24/core/utils/constants.dart';
import 'package:onservice24/core/network/api_response.dart';

part 'notifications_datasource.g.dart';

@Injectable()
@RestApi(baseUrl: kBaseUrl)
abstract class NotificationsDataSource {
  @factoryMethod
  factory NotificationsDataSource(Dio dio) = _NotificationsDataSource;

  @GET('/Notification/GetContacts/{serviceProviderId}/{ContactType}')
  Future<ApiResponse<List<NotificationsDto>>> fetchGetNotifications(
      @Path("serviceProviderId") int serviceProviderId,
      @Path("ContactType") int ContactType);
}

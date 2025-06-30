import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:onservice24/src/admin/subscriptions/data/models/AddSubsriptionsPrams.dart';
import 'package:onservice24/src/admin/subscriptions/data/models/AllSubscriptionDto.dart';
import 'package:retrofit/retrofit.dart';
import 'package:onservice24/core/utils/constants.dart';
import 'package:onservice24/core/network/api_response.dart';

import '../models/Subscription_dto.dart';




part 'all_subscription_datasource.g.dart';

@Injectable()
@RestApi(baseUrl: kBaseUrl)
abstract class AllSubscriptionDataSource {
  @factoryMethod
  factory AllSubscriptionDataSource(Dio dio) = _AllSubscriptionDataSource;



  @GET('/SubscriptionsManagement/GetAllSubscriptions')
  Future<ApiResponse<List<AllSubscriptionDto>>> fetchGetAllSubscription();

  @GET('/SubscriptionsManagement/getSubscriptionByServiceProvider/{serviceProviderId}')
  Future<ApiResponse<List<SubscriptionDto>>> fetchSubscription(@Path("serviceProviderId") int serviceProviderId );


  @POST('/SubscriptionsManagement/AddServiceToProvider')
  Future<ApiResponse> addSubscription(@Body() AddSubsriptionsPrams addSubsriptionsPrams);


}

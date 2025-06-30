import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';

import '../../../../../core/network/api_response.dart';
import '../../../../../core/utils/constants.dart';
import '../models/add_support_params.dart';

part 'support_datasource.g.dart';
@Injectable()
@RestApi(baseUrl: kBaseUrl)
abstract class  SupportDatasource{

  @factoryMethod
  factory SupportDatasource(Dio dio) = _SupportDatasource;

  @POST('/TechnicalSupport/AddTechSupport')
  Future<ApiResponse> contactSupport(@Body() AddSupportParams params);
}
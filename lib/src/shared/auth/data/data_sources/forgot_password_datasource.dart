import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';
import 'package:onservice24/core/network/api_response.dart';

import '../../../../../core/utils/constants.dart';
import '../models/forgot_password_params.dart';
import '../models/mobile_params.dart';
import '../models/verify_code_params.dart';

part 'forgot_password_datasource.g.dart';

@Injectable()
@RestApi(baseUrl: kBaseUrl)
abstract class ForgotPasswordDataSource {
  @factoryMethod
  factory ForgotPasswordDataSource(Dio dio) = _ForgotPasswordDataSource;

  @POST('/captain/send_verify_code')
  Future enterPhoneNumber(@Body() MobileParams params);

  @POST('/captain/confirm_verify_code')
  Future enterCode(@Body() VerifyCodeParams code);

  @GET('/api/v1/Operations/GetAllOperations')
  Future<ApiResponse<String>> forgotPassword(@Body() ForgotPasswordParams params);
}

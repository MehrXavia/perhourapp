import 'dart:io';

import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';
import 'package:onservice24/core/utils/constants.dart';
import 'package:onservice24/core/network/api_response.dart';
import '../../../../admin/payment/data/models/otp_dto.dart';
import '../models/image_dto.dart';
import '../models/login_params.dart';
import '../models/nationality_dto.dart';
import '../models/profile_dto.dart';
import '../models/register_params.dart';
import '../models/send_otp_params.dart';
import '../models/verify_otp_params.dart';

part 'auth_datasource.g.dart';

@Injectable()
@RestApi(baseUrl: kBaseUrl)
abstract class AuthDataSource {
  @factoryMethod
  factory AuthDataSource(Dio dio) = _AuthDataSource;

  @POST('/Account/LoginUser')
  Future<ApiResponse<ProfileDto>> login(@Body() LoginParams params);

  @GET('/Nationality/GetNationalities')
  Future<ApiResponse<List<NationalityDto>>> fetchNationalities();

  @POST('/Account/Register')
  Future<ApiResponse<ProfileDto>> register(@Body() RegisterParams params);

  @POST('/Photo/UploadPhoto')
  Future<ApiResponse<ImageDto>> uploadImage(@Part(name: 'file') File file);

  @POST('/Account/SendOTP')
  Future<ApiResponse> sendOTPCode(@Query("email") String email);

  @POST('/Account/VerifyOTP')
  Future<ApiResponse<OtpDto>> verifyOTPCode(@Queries() VerifyOtpParams params);
}

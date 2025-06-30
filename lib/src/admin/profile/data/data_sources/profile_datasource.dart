import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:onservice24/src/admin/profile/data/models/ProfileDto.dart';
import 'package:retrofit/retrofit.dart';
import 'package:onservice24/core/utils/constants.dart';
import 'package:onservice24/core/network/api_response.dart';

import '../models/EditProfilePrams.dart';


part 'profile_datasource.g.dart';

@Injectable()
@RestApi(baseUrl: kBaseUrl)
abstract class ProfileDataSource {
  @factoryMethod
  factory ProfileDataSource(Dio dio) = _ProfileDataSource;

  @GET('/Account/getUser,{Id}')
  Future<ApiResponse<ProfileDataDto>> fetchProfile(@Path("Id") int id);


  @POST('/Account/editUser')
  Future<ApiResponse> editProfile(@Body()EditProfilePrams params);
  @POST('/Account/LogOut')
  Future<ApiResponse> logOut(
      @Query("userId") int userId,
      @Query("type") int type,
      @Query("LogoutDate") String logoutDate ,
      );
}


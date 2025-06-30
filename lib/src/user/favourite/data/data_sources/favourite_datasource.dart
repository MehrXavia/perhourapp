import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:onservice24/src/user/favourite/data/models/FavouritePrams.dart';
import 'package:retrofit/retrofit.dart';
import 'package:onservice24/core/utils/constants.dart';
import 'package:onservice24/core/network/api_response.dart';

import '../models/Favourite_dto.dart';



part 'favourite_datasource.g.dart';

@Injectable()
@RestApi(baseUrl: kBaseUrl)
abstract class FavouriteDataSource {
  @factoryMethod
  factory FavouriteDataSource(Dio dio) = _FavouriteDataSource;

  @POST('/Favourite/AddFavourite')
  Future<ApiResponse> addFavourite(@Body() FavouritePrams params);

  @GET('/Favourite/GetFavourite')
  Future<ApiResponse<List<FavouriteDto>>> fetchFavourite(@Query("userId") int userId);

  @POST('/Favourite/DeleteFavourite')
  Future<ApiResponse> deleteFavourite(@Query("favouriteId") int favouriteId);
}

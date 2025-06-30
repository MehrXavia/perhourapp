import 'dart:async';

import 'package:injectable/injectable.dart';

import '../data_sources/favourite_datasource.dart';

 import '../models/FavouritePrams.dart';
import '../models/Favourite_dto.dart';

@injectable
class FavouriteRepository {
  final FavouriteDataSource _api;

  FavouriteRepository(this._api);

  Future<String> addFavourite({required FavouritePrams favouritePrams}) async {
    final response = await _api.addFavourite(favouritePrams);
    return response.message();
  }

Future<List<FavouriteDto>> fetchFavourite({required int userId}) async {
    final response = await _api.fetchFavourite(userId);

    return response.data!;
  }

  Future<String> deleteFavourite({required int favouriteId}) async {

    final response = await _api.deleteFavourite(favouriteId);
    return response.message();
  }

}

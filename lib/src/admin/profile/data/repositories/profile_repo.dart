import 'dart:async';

import 'package:injectable/injectable.dart';
import 'package:intl/intl.dart';
import 'package:onservice24/core/utils/helper_methods.dart';
import 'package:onservice24/src/admin/profile/data/models/ProfileDto.dart';


import '../data_sources/profile_datasource.dart';
import '../models/EditProfilePrams.dart';


@injectable
class ProfileRepository {
  final ProfileDataSource _api;

  ProfileRepository(this._api);



  Future<ProfileDataDto> fetchProfile({required int id}) async {
    final response = await _api.fetchProfile(id);
    return response.data!;
  }

  Future<String> editProfile({required EditProfilePrams editProfileParams}) async {
    final response = await _api.editProfile(editProfileParams);

    return response.message();
  }
  Future<String> logOut({required int type }) async {
  int  userId =await HelperMethods.getUserId();
  String  date=  DateFormat("yyyy-MM-dd'T'HH:mm:ss").format(DateTime.now());

    final response = await _api.logOut(userId,type , date);

    return response.message();
  }



}

import 'dart:io';

import 'package:onservice24/core/utils/helper_methods.dart';
import 'package:injectable/injectable.dart';
import 'package:onservice24/src/shared/auth/data/models/send_otp_params.dart';
import 'package:onservice24/src/shared/auth/data/models/verify_otp_params.dart';

import '../../../../../core/network/api_response.dart';
import '../../../../admin/payment/data/models/otp_dto.dart';
import '../models/login_params.dart';
import '../models/nationality_dto.dart';
import '../../domain/repositories/base_auth_repo.dart';
import '../data_sources/auth_datasource.dart';
import '../models/profile_dto.dart';
import '../models/register_params.dart';

@Injectable(as: BaseAuthRepo)
class AuthRepo extends BaseAuthRepo {
  final AuthDataSource apiProvider;
  AuthRepo(this.apiProvider);

  @override
  Future<String> loginAsUser(LoginParams params) async {
    final response = await apiProvider.login(params);
    await HelperMethods.saveProfile(response.data ?? ProfileDto());
    await HelperMethods.setEmail(response.data?.email ?? "");
    return response.message();
  }

  @override
  Future<List<NationalityDto>> fetchNationalities() async {
    final response = await apiProvider.fetchNationalities();
    return response.data!;
  }

  @override
  Future<String> register(RegisterParams params) async {
    final response = await apiProvider.register(params);
    await HelperMethods.saveProfile(response.data ?? ProfileDto());
    await HelperMethods.setEmail(response.data?.email ?? "");
    return response.message();
  }

  @override
  Future<int> uploadImage(File file) async {
    final response = await apiProvider.uploadImage(file);
    return response.data?.id ?? 0;
  }

  @override
  Future<String> sendOTPCode(String email) async {
    final response = await apiProvider.sendOTPCode(email);
    return response.message();
  }

  @override
  Future<String> verifyOTPCode(VerifyOtpParams params) async {
    final response = await apiProvider.verifyOTPCode(params);
  if(response.status !="error"){
   await HelperMethods.removeVerify();
   await HelperMethods.setVerify(response.data?.otp??"" );
 }
    return response.message();
  }
}

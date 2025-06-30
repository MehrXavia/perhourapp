
import 'dart:io';

import 'package:injectable/injectable.dart';
import 'package:onservice24/core/utils/helper_methods.dart';

import '../../../../../core/network/api_response.dart';
import '../../../../admin/payment/data/models/otp_dto.dart';
import '../../data/models/login_params.dart';
import '../../data/models/nationality_dto.dart';
import '../../data/models/register_params.dart';
import '../../data/models/send_otp_params.dart';
import '../../data/models/verify_otp_params.dart';
import '../repositories/base_auth_repo.dart';

@Injectable()
class AuthUseCase {
  final BaseAuthRepo repository ;
  AuthUseCase(this.repository);

  Future<String> loginAsUser(LoginParams params) async {
    return await repository.loginAsUser(params);
  }

  Future<List<NationalityDto>> fetchNationalities() async{
    return await repository.fetchNationalities();
  }

  Future<String> register(RegisterParams params) async{
    return await repository.register(params);
  }

  Future<int> uploadImage(File file) async{
    return await repository.uploadImage(file);
  }


  Future<String> sendOTPCode(String email) async{
    return await repository.sendOTPCode(email);
  }


  Future<String> verifyOtpCode(VerifyOtpParams params) async{
    final data= await repository.verifyOTPCode(params);

    return data;
  }
}
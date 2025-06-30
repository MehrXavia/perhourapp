
import 'dart:io';

import 'package:onservice24/core/network/api_response.dart';

import '../../../../admin/payment/data/models/otp_dto.dart';
import '../../data/models/image_dto.dart';
import '../../data/models/nationality_dto.dart';
import '../../data/models/login_params.dart';
import '../../data/models/register_params.dart';
import '../../data/models/send_otp_params.dart';
import '../../data/models/verify_otp_params.dart';


abstract class BaseAuthRepo {
  Future<String> loginAsUser(LoginParams params);
  Future<List<NationalityDto>> fetchNationalities();
  Future<String> register(RegisterParams params);
  Future<int> uploadImage(File file);
  Future<String> sendOTPCode(String email);
  Future<String> verifyOTPCode(VerifyOtpParams params);
}

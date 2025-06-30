
import '../../data/models/forgot_password_params.dart';
import '../../data/models/verify_code_params.dart';



abstract class BaseForgotPasswordRepo {
  Future<String> enterPhoneNumber(String phoneNumber);
  Future<String> enterCode(VerifyCodeParams code);
  Future<String> forgotPassword(ForgotPasswordParams params);
}

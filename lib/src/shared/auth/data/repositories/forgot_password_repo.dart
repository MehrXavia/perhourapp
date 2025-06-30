
import 'package:injectable/injectable.dart';

import '../../domain/repositories/base_forgot_password_repo.dart';
import '../data_sources/forgot_password_datasource.dart';
import '../models/forgot_password_params.dart';
import '../models/mobile_params.dart';
import '../models/verify_code_params.dart';

@Injectable(as: BaseForgotPasswordRepo)
class ForgotPasswordRepo extends BaseForgotPasswordRepo{
  final ForgotPasswordDataSource  apiProvider;
  ForgotPasswordRepo(this.apiProvider);

  @override
  Future<String> enterPhoneNumber(String phoneNumber) async{
    final response = await apiProvider.enterPhoneNumber(MobileParams(mobile: phoneNumber));
    return response['msg'];
  }

  @override
  Future<String> enterCode(VerifyCodeParams code) async{
    final response = await apiProvider.enterCode(code);
    return response['msg'];
  }

  @override
  Future<String> forgotPassword(ForgotPasswordParams params) async{
    final response = await apiProvider.forgotPassword(params);
    return response.data!;
  }
}
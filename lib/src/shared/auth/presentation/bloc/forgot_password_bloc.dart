import 'package:injectable/injectable.dart';

import '../../../../../core/bloc/base_cubit.dart';

import '../../data/models/forgot_password_params.dart';
import '../../data/models/verify_code_params.dart';
import '../../domain/use_cases/forgot_password_usecase.dart';

@Injectable()
class ForgotPasswordCubit extends BaseCubit {
  final ForgotPasswordUseCase usecase;

  ForgotPasswordCubit(this.usecase);

  enterPhoneNumber(String phoneNumber) async {
    executeEmitterListener(() => usecase.enterPhoneNumber(phoneNumber));
  }

  enterPinCode(VerifyCodeParams code) async {
    executeEmitterListener(() => usecase.enterPinCode(code));
  }

  forgotPassword(ForgotPasswordParams params) async {
    executeEmitterListener(() => usecase.forgotPassword(params));
  }
}

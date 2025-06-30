import 'package:injectable/injectable.dart';

import '../../../../../../core/bloc/base_cubit.dart';
import '../../../../../../core/utils/helper_methods.dart';
import '../../../../../shared/auth/data/models/send_otp_params.dart';
import '../../../../../shared/auth/data/models/verify_otp_params.dart';
import '../../../../../shared/auth/domain/use_cases/auth_usecase.dart';



@Injectable()
class OtpMessageCubit extends BaseCubit {
  final AuthUseCase useCase;
  //
   OtpMessageCubit(this.useCase);

   verifyOTPCode(VerifyOtpParams params) {
     executeEmitterListener(() => useCase.verifyOtpCode(params));
   }

   sendOTPCode(String email) {
     executeEmitterListener(() => useCase.sendOTPCode(email));
   }



   getCash() async {
     executeSuccess(() =>   HelperMethods.getVerify());

   }




}

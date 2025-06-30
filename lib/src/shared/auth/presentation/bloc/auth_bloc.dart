import 'dart:io';

import 'package:injectable/injectable.dart';
import 'package:onservice24/core/resources/data_state.dart';
import 'package:onservice24/core/utils/helper_methods.dart';

import '../../../../../core/bloc/base_cubit.dart';
import '../../data/models/login_params.dart';
import '../../data/models/profile_dto.dart';
import '../../data/models/register_params.dart';

import '../../data/models/send_otp_params.dart';
import '../../data/models/verify_otp_params.dart';
import '../../domain/use_cases/auth_usecase.dart';

@Injectable()
class AuthCubit extends BaseCubit {
  final AuthUseCase usecase;

  AuthCubit(this.usecase);

  // login(LoginParams params) {
  //   executeEmitterSuccess(() => usecase.loginAsUser(params),);
  // }

//File? file,
  login(LoginParams params) async {
    try {
      emit(LoadingStateListener());
      // if (file != null) {
      //   final id = await usecase.uploadImage(file);
      //   params.identityPhotoId = id;
      // }
      final response = await usecase.loginAsUser(params);
      ProfileDto? data=await HelperMethods.getProfile();
      await usecase.sendOTPCode(data?.email??"");
      emit(SuccessListener(response));

    } on Exception catch (e) {
      emit(FailureStateListener(e));
    }
  }
register(RegisterParams params) async {
    try {
      emit(LoadingStateListener());
      // if (file != null) {
      //   final id = await usecase.uploadImage(file);
      //   params.identityPhotoId = id;
      // }
      final response = await usecase.register(params);
      await usecase.sendOTPCode(params.email??"");
      emit(SuccessListener(response));

    } on Exception catch (e) {
      emit(FailureStateListener(e));
    }
  }

  fetchNationalities() async {
    executeSuccess(() => usecase.fetchNationalities());
  }




  sendOTPCode(String email) {
    executeEmitterListener(() => usecase.sendOTPCode(email));
  }

}

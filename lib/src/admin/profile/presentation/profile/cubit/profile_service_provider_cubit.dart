import 'dart:io';

import 'package:injectable/injectable.dart';

import '../../../../../../../core/bloc/base_cubit.dart';
import '../../../../../../core/resources/data_state.dart';
import '../../../../../../core/utils/helper_methods.dart';
import '../../../../../shared/auth/data/models/profile_dto.dart';
import '../../../../../shared/auth/domain/use_cases/auth_usecase.dart';
import '../../../data/models/EditProfilePrams.dart';
import '../../../data/repositories/profile_repo.dart';

@Injectable()
class ProfileUserCubit extends BaseCubit {
  final ProfileRepository _repository;
  final AuthUseCase usecase;
  ProfileUserCubit(this._repository, this.usecase);

  getProfile() async {
    ProfileDto? dataUser = await HelperMethods.getProfile();
    executeSuccess(
      () => _repository.fetchProfile(
        id: dataUser?.id ?? 0,
      ),
    );
  }

  editProfile(EditProfilePrams editProfileParams) {
    executeEmitterListener(
        () => _repository.editProfile(editProfileParams: editProfileParams));
  }




}

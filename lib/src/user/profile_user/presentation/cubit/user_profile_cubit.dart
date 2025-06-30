import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/bloc/base_cubit.dart';
import '../../../../../core/utils/helper_methods.dart';
import '../../../../admin/profile/data/models/EditProfilePrams.dart';
import '../../../../admin/profile/data/repositories/profile_repo.dart';
import '../../../../shared/auth/data/models/profile_dto.dart';

@Injectable()
class UserProfileCubit extends BaseCubit {
  final ProfileRepository _repository;

  UserProfileCubit(this._repository);

  getProfile() async {
    ProfileDto? data = await HelperMethods.getProfile();
    print(data?.id ?? "0");

    executeSuccess(
      () => _repository.fetchProfile(
        id: data?.id ?? 0,
      ),
    );
  }

  editProfile(EditProfilePrams editProfileParams) async {
    ProfileDto? data = await HelperMethods.getProfile();
    editProfileParams.id = data?.id ?? 0;
    editProfileParams.loginDate = data?.loginDate  ;
    editProfileParams.logoutDate = data?.logoutDate ;
    editProfileParams.isLogedOut = data?.isLogedOut  ;

    executeEmitterListener(
        () => _repository.editProfile(editProfileParams: editProfileParams));
  }
}

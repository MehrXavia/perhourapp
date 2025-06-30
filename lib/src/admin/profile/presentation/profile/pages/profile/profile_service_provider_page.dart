import 'package:flutter/material.dart';
import 'package:onservice24/core/components/base_widget_bloc.dart';
import 'package:onservice24/core/utils/navigator.dart';
import 'package:onservice24/src/admin/profile/data/models/ProfileDto.dart';
import 'package:onservice24/src/admin/profile/presentation/profile/pages/profile/profile_service_provider_screen.dart';

import '../../../../../../../core/resources/data_state.dart';
import '../../../../../../../navigation_pages_v2.dart';
import '../../cubit/profile_cubit.dart';
import '../../cubit/profile_service_provider_cubit.dart';

class ProfileServiceProviderPage
    extends BaseBlocWidget<DataSuccess<ProfileDataDto>, ProfileServiceProviderCubit> {
  ProfileServiceProviderPage({Key? key}) : super(key: key);
  @override
  String? title(BuildContext context) {
    return strings.profile;
  }

  @override
  void loadInitialData(BuildContext context) {
    bloc.getProfile();
  }

  @override
  Widget buildWidget(BuildContext context, DataSuccess<ProfileDataDto> state) {
    return ProfileServiceProviderScreen(
      onRefrach: () {
        pop();
        bloc.getProfile();
      },
        onUploadImageAndUpdateProfile: (file, editProfileParams) {
          bloc.uploadImageAndEditProfile(file, editProfileParams);
        },
        isUpdateNotification: (editProfileParams) {
          bloc.editProfile(editProfileParams);
        },
        profileDto: state.data!);
  }

  @override
  void onSuccessDismissed() {
    bloc.getProfile();
  }
}

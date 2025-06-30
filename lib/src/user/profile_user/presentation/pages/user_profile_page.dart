import 'package:flutter/material.dart';
import 'package:onservice24/core/components/base_widget_bloc.dart';

import '../../../../../core/resources/data_state.dart';
import '../../../../admin/profile/data/models/ProfileDto.dart';
import '../cubit/user_profile_cubit.dart';
import 'user_profile_screen.dart';

class UserProfilePage
    extends BaseBlocWidget<DataSuccess<ProfileDataDto>, UserProfileCubit> {
  UserProfilePage({Key? key}) : super(key: key);
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
    return UserProfileScreen(
      profileDto: state.data!,
      onRefrach: () {
        bloc.getProfile();
      },
      onEdit: (editProfilePrams) {
        bloc.editProfile(editProfilePrams);
      },
    );
  }

  @override
  void onSuccessDismissed() {
    bloc.getProfile();
  }

  @override
  bool? isBackHome(BuildContext context) {
    return true;
  }
}

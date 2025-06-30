import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:onservice24/core/components/base_widget_bloc.dart';
import 'package:onservice24/core/resources/data_state.dart';
import 'package:onservice24/core/utils/navigator.dart';
import 'package:onservice24/core/widgets/scaffold/app_scaffold.dart';
import 'package:onservice24/src/admin/profile/data/models/ProfileDto.dart';
import 'package:onservice24/src/admin/profile/presentation/profile/pages/profile/set_location/set_location_screen.dart';

import '../../../../../../../../core/themes/light_theme.dart';
import '../../../../../../../../core/themes/light_theme.dart';
import '../../../../../../../../navigation_pages_v2.dart';
import '../../../cubit/profile_cubit.dart';

class SetLocationPage
    extends BaseBlocWidget<DataSuccess<LatLng>, ProfileServiceProviderCubit> {
  SetLocationPage({Key? key, required this.profileDto, required this.onRefrach})
      : super(key: key);
  final ProfileDataDto profileDto;
  Function() onRefrach;

  @override
  void loadInitialData(BuildContext context) {
    bloc.getLocation();
  }

  @override
  Widget buildWidget(BuildContext context, DataSuccess<LatLng> state) {
    return AppScaffold(
      title: strings.use_my_current_location,
      leading: IconButton(
        icon: const Icon(
          Icons.arrow_back_ios,
          color: Colors.black,
        ),
        onPressed: () {
          pop();
        },
      ),
      body: SetLocationScreen(
        lat: state.data?.latitude ?? 0,
        lng: state.data?.longitude ?? 0,
        onEdit: (editProfileParams) async {
        String ?countryCode=await  bloc.getCountryFromLatLng(state.data?.latitude ?? 0, state.data?.longitude ?? 0);
          editProfileParams.countryCode=countryCode??editProfileParams.countryCode;
          bloc.editProfile(editProfileParams);
        },
        profileDto: profileDto,
      ),
    );
  }

  @override
  void onSuccessDismissed() {
    onRefrach();
    super.onSuccessDismissed();
  }

  bool? isBackHome(BuildContext context) {
    return true;
  }
}

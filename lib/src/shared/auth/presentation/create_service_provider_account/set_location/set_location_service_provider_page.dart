import 'package:flutter/cupertino.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:onservice24/src/shared/auth/presentation/create_service_provider_account/set_location/set_location_service_provider_screen.dart';

import '../../../../../../core/components/base_widget_bloc.dart';
import '../../../../../../core/resources/data_state.dart';
import '../../../../../admin/profile/presentation/profile/cubit/profile_cubit.dart';

class SetLocationServiceProviderPage
    extends BaseBlocWidget<DataSuccess<LatLng>, ProfileServiceProviderCubit> {
  SetLocationServiceProviderPage({Key? key, required this.onGetLocation}) : super(key: key);

  Function(double lat, double lng,String countryCode) onGetLocation;
  @override
  String? title(BuildContext context) {
    return strings.use_my_current_location;
  }

  @override
  void loadInitialData(BuildContext context) {
    bloc.getLocation();
  }

  @override
  Widget buildWidget(BuildContext context, DataSuccess<LatLng> state) {
    return SetLocationServiceProviderScreen(
      lat: state.data?.latitude ?? 0,
      lng: state.data?.longitude ?? 0,
      onGetLocation: (lat, lng) async {
     String?   countryCode=  await bloc.getCountryFromLatLng(lat, lng);
        onGetLocation(lat, lng,countryCode??"EG");
      },
    );
  }

}

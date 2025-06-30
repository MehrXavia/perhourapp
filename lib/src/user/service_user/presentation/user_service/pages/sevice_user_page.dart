import 'package:onservice24/core/components/base_widget_bloc.dart';
import 'package:onservice24/src/user/service_user/presentation/user_service/pages/sevice_user_screen.dart';
import '../../../../../../core/utils/check_version.dart';
import '../../../../../main_index.dart';
import '../../../data/models/service_prams.dart';
import '../cubit/service_user_cubit.dart';

// ignore: must_be_immutable

class UserServicePage extends BaseBlocWidget<HomeUserData, ServiceUserCubit> {
  final bool isShowBack;
  UserServicePage({super.key, this.isShowBack = false});
  @override
  String? title(BuildContext context) {
    return strings.main_services;
  }

  @override
  void loadInitialData(BuildContext context) {
    bloc.loadInitialData();
  }

  @override
  bool? isBack(BuildContext context) {
    return isShowBack;
  }

  @override
  bool? isBackHome(BuildContext context) {
    return true;
  }

  @override
  Widget buildWidget(BuildContext context, HomeUserData state) {

    AppVersionChecker().checkVersion(context,isWillPop:true, );
    return ServiceUserScreen(
      serviceUserDto: state.serviceData ?? [],
      serviceStream: bloc.serviceStream,
      countryCode: state.countryCode,
      latlng:   state.latlng,
      slider: state.sliderData,
      onUseLocation: ({required lat, required lng}) async {
        String? countryCode = await bloc.getCountryFromLatLng(lat, lng);
        bloc.fetchServiceStream(
          servicePrams: ServicePrams(
            lat: state.latlng.latitude,
            lon: state.latlng.longitude,
            countryCode: countryCode == "" || countryCode == null
                ? state.countryCode
                : countryCode,
          ),
        );
      },
    );
  }

  @override
  bool? isDrawer(BuildContext context) {
    return false;
  }
}

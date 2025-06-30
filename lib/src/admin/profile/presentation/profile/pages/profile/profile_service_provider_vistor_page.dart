import 'package:flutter/cupertino.dart';
import 'package:onservice24/core/components/base_widget_bloc.dart';
import 'package:onservice24/src/admin/profile/presentation/profile/pages/profile/profile_service_provider_vistor_screen.dart';

import '../../../../../../../core/resources/data_state.dart';
import '../../cubit/profile_cubit.dart';

class ProfileServiceProviderVistorPage extends BaseBlocWidget<DoubleDataSuccess, ProfileServiceProviderCubit> {
  final int id;
  ProfileServiceProviderVistorPage({Key? key, required this.id}) : super(key: key);
  @override
  String? title(BuildContext context) {
    return strings.profile;
  }
 @override
  void loadInitialData(BuildContext context) {
    bloc.loadInitialData(serviceProviderId: id);
  }

  @override
  Widget buildWidget(BuildContext context, DoubleDataSuccess state) {
    return ProfileServiceProviderVistorScreen(
      profileDto: state.data1??[], listService:state.data2??[],
      onNotifications: (notificationsTypeId, serviceProviderId) {
        bloc.addNotification(notificationsTypeId: notificationsTypeId, serviceProviderId: serviceProviderId);
      },
    );
  }
  @override
  bool? isBackHome(BuildContext context) {
    // TODO: implement isBackHome
    return false;
  }
}


import 'dart:io';

import 'package:onservice24/src/shared/auth/presentation/bloc/auth_bloc.dart';

import '../../../../../../core/components/base_widget_bloc.dart';
import '../../../../../../core/utils/navigator.dart';
import '../../../../main_index.dart';
import '../../data/models/nationality_dto.dart';
import '../../data/models/register_params.dart';
import 'create_service_provider_account_screen.dart';

// ignore: must_be_immutable
class CreateServiceProviderAccountPage extends BaseBlocWidget<DataSuccess<List<NationalityDto>>, AuthCubit> {
  CreateServiceProviderAccountPage({Key? key}) : super(key: key);


  @override
  void loadInitialData(BuildContext context) {
    bloc.fetchNationalities();
  }

  @override
  String? title(BuildContext context)=> strings.create_service_provider_account;

  @override
  Widget buildWidget(BuildContext context, DataSuccess<List<NationalityDto>> state) {
    return CreateServiceProviderAccountScreen(
      nationalities: state.data ?? [],
      onRegister: (  RegisterParams params) {
        bloc.register( params);
        //Navigators.pushNamedAndRemoveUntil(Routes.navigationPages);
      },
    );
  }

  @override
  bool? isDrawer(BuildContext context) {
    return false;
  }
  @override
  bool? isBack(BuildContext context) {
    // TODO: implement isBack
    return true;
  }

  @override
  void onSuccessDismissed() {
    pushNamed(Routes.otpMessagePage);
  }
}

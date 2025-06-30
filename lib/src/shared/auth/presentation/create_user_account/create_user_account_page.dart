
import '../../../../../core/components/base_widget_bloc.dart';
import '../../../../../core/utils/navigator.dart';
import '../../../../main_index.dart';
import '../../data/models/register_params.dart';
import '../bloc/auth_bloc.dart';
import 'create_user_account_screen.dart';

// ignore: must_be_immutable
class CreateUserAccountPage extends BaseBlocWidget<UnInitState, AuthCubit> {
  CreateUserAccountPage({Key? key}) : super(key: key);


  @override
  String? title(BuildContext context)=> strings.create_user_account;

  @override
  Widget buildWidget(BuildContext context, UnInitState state) {
    return CreateUserAccountScreen(
      onRegister: (RegisterParams params) {
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
  void onSuccessDismissed() {
    pushNamed(Routes.otpMessagePage);
  }

  @override
  bool? isBack(BuildContext context) {
    // TODO: implement isBack
    return true;
  }
}

import 'package:onservice24/core/components/base_widget_bloc.dart';

import '../../../../../../core/utils/navigator.dart';
import '../../../../main_index.dart';
import '../../data/models/login_params.dart';
import '../../data/models/send_otp_params.dart';
import '../bloc/auth_bloc.dart';
import 'login_screen.dart';

// ignore: must_be_immutable
class LoginPage extends BaseBlocWidget<UnInitState, AuthCubit> {
  LoginPage({Key? key}) : super(key: key);

  @override
  String? title(BuildContext context) => strings.login;
  bool? isFingerNew;
//  SendOtpParams ? _sendOtpParams;
  @override
  Widget buildWidget(BuildContext context, UnInitState state) {
    int? argument = getArguments<int>(context);
    return LoginScreen(
      type: argument ?? 1,
      onFinger: (isFinger) {
        isFingerNew = isFinger;
      },
      onLogin: (LoginParams params) {
        bloc.login(params);
        //  Navigators.pushNamedAndRemoveUntil(Routes.navigationPages);
      },
    );
  }

  @override
  void onSuccessDismissed() {
    (isFingerNew == true || isFingerNew != null)
        ? pushNamedAndRemoveUntil(Routes.navigationPages)
        : pushNamedAndRemoveUntil(Routes.otpMessagePage,);
  }
}

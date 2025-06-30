import 'package:flutter/cupertino.dart';
import 'package:onservice24/core/components/base_widget_bloc.dart';

import '../../../../../../core/resources/data_state.dart';
import '../../../../../../core/routes/routes.dart';
import '../../bloc/forgot_password_bloc.dart';
import '../../widgets/auth_widget.dart';
import 'enter_phone_number_screen.dart';

class EnterPhoneNumberPage extends BaseBlocWidget<UnInitState, ForgotPasswordCubit> {
  EnterPhoneNumberPage({Key? key}) : super(key: key);

  @override
  Widget buildWidget(BuildContext context, UnInitState state) {
    return EnterPhoneNumberScreen(
      onEnterPhoneNumber: (String phoneNumber) {
        //  Navigator.pushNamed(context, Routes.enterPinCodePage);
        bloc.enterPhoneNumber(phoneNumber);
      },
    );
  }

  @override
  void onSuccessDismissed() {
    Navigator.pushNamed(context!, Routes.enterPinCodePage);
  }
}

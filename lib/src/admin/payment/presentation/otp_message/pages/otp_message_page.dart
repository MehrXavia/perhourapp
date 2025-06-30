import 'package:flutter/material.dart';
import 'package:onservice24/core/components/base_widget_bloc.dart';
import 'package:onservice24/core/utils/helper_methods.dart';
import 'package:onservice24/core/widgets/dialogs/dialogs_manager.dart';
import 'package:onservice24/src/admin/payment/presentation/otp_message/cubit/otp_message_cubit.dart';
import '../../../../../../core/di/injector.dart';
import '../../../../../../core/resources/data_state.dart';
import '../../../../../../core/routes/routes.dart';
import '../../../../../../core/utils/navigator.dart';
import 'otp_message_screen.dart';

class OtpMessagePage extends BaseBlocWidget<UnInitState, OtpMessageCubit> {
  OtpMessagePage({Key? key}) : super(key: key);
  @override
  String? title(BuildContext context) {
    return strings.verification_code;
  }

  String? verify;
  @override
  Widget buildWidget(BuildContext context, UnInitState state) {
    return OtpMessageScreen(
      sendOTPCode: (email) {
        bloc.sendOTPCode(email);
      },
      verifyOtpCode: (params) async {
        await bloc.verifyOTPCode(params);
        verify = await HelperMethods.getVerify();
      },
    );
  }

  @override
  void onRequestSuccess(String? message) {
    print(message);
    print("jjkjkjkjkjkjk");
    BuildContext? context =
        injector<ServicesLocator>().navigatorKey.currentContext;

    if (message!.contains("الكود غير صحيح او ربما انتهى الوقت") ||
        message.contains("Not Verified") ||
        message.contains("تم ارسال الكود") ||
        message.contains("OTP was sent successfully")) {
      DialogsManager.showErrorDialog(
        context!,
        message,
      );
    } else {
      DialogsManager.showSuccessDialog(
        context!,
        message: message,
        onClickOk: () {
          Navigators.pushNamedAndRemoveUntil(Routes.navigationPages);
        },
      );
    }
  }
}

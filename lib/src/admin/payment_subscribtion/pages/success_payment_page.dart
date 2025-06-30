import 'package:flutter/material.dart';
import 'package:onservice24/core/components/base_widget_bloc.dart';
 import 'package:onservice24/src/admin/payment_subscribtion/pages/success_payment_screen.dart';

import '../../../../../../core/resources/data_state.dart';
import '../../../../core/utils/navigator.dart';
import '../../../../navigation_pages_v2.dart';
import '../../subscriptions/data/models/AllSubscriptionDto.dart';
import '../cubit/payment_cubit.dart';
import 'payment_screen.dart';

//
class SuccessPaymentPage extends BaseBlocWidget<UnInitState, PaymentCubit> {
   @override
  String? title(BuildContext context) {
    return strings.payment_status;
  }

  @override
  Widget buildWidget(BuildContext context, UnInitState state) {
    return SuccessPaymentScreen(


    );
  }

}

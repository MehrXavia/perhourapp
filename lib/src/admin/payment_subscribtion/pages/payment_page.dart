import 'package:flutter/material.dart';
import 'package:onservice24/core/components/base_widget_bloc.dart';
import 'package:onservice24/src/admin/payment_subscribtion/pages/success_payment_page.dart';
 import 'package:onservice24/src/admin/payment_subscribtion/pages/success_payment_screen.dart';

import '../../../../../../core/resources/data_state.dart';
import '../../../../core/utils/navigator.dart';
import '../../../../navigation_pages_v2.dart';
import '../../subscriptions/data/models/AllSubscriptionDto.dart';
import '../cubit/payment_cubit.dart';
import 'payment_screen.dart';

//
class PaymentPage extends BaseBlocWidget<UnInitState, PaymentCubit> {
  PaymentPage({Key? key,required this.allSubscriptionDto}) : super(key: key);
  AllSubscriptionDto  allSubscriptionDto;
  @override
  String? title(BuildContext context) {
    return strings.payment_card_data;
  }

  @override
  Widget buildWidget(BuildContext context, UnInitState state) {
    return PaymentScreen(

        allSubscriptionDto :allSubscriptionDto,
    addSubsriptions: (addSubscriptionsPrams) {
      bloc.addSubscription(addSubscriptionsPrams);
    },
    );
  }
  @override
  void onSuccessDismissed() {
  push(kContext, SuccessPaymentPage());

  }
}

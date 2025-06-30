import 'package:flutter/material.dart';
import 'package:onservice24/core/exceptions/extensions.dart';
import 'package:onservice24/core/themes/colors.dart';
import 'package:onservice24/core/themes/text_styles.dart';
import 'package:onservice24/core/widgets/buttons/app_icon.dart';

import '../../../../../../core/assets/app_icons.dart';
import '../../../../../../core/components/base_stateless_widget.dart';

class SuccessPaymentScreen extends BaseStatelessWidget {
  SuccessPaymentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              130.ph,
              const AppIcon(icon: AppIcons.successs,size: 120,),
              50.ph,
              Text(strings.payment_completed_successfully,style: kTextSemiBold.copyWith(color: kBlackColor_12,fontSize: 20),),
              10.ph,
              Text(strings.you_will_receive_a_copy_of_the_invoice_to_your_email,style: kTextMedium.copyWith(color: kBlackColor_12,fontSize: 16),),
              6.ph,
              Text(strings.you_are_now_subscribed_to,style: kTextMedium.copyWith(color: kBlackColor_12,fontSize: 16),),
              6.ph,
              Text(strings.silver_package,style: kTextMedium.copyWith(color: kBlackColor_12,fontSize: 16),),
            ],
          ),
        ),
      ),
    );
  }
}

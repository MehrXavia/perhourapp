import 'package:flutter/material.dart';

import '../../../../../../core/components/base_stateless_widget.dart';
import '../../../../../../core/themes/colors.dart';
import '../../../../../../core/themes/text_styles.dart';
import '../../data/models/AllSubscriptionDto.dart';

class CommonText extends BaseStatelessWidget {
   CommonText({super.key,required this.allSubscriptionDto});
   AllSubscriptionDto allSubscriptionDto;
  @override
  Widget build(BuildContext context) {
    return  Center(child: Text("${strings.you_will_pay} ${allSubscriptionDto.amount} ${strings.sr}",style: kTextSemiBold.copyWith(fontSize: 19,color: kMainColor),));
  }
}

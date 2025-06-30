import 'package:flutter/material.dart';
import 'package:onservice24/core/exceptions/extensions.dart';

import '../../../../../../core/components/base_stateless_widget.dart';
import '../../../../../../core/decorations/decorations.dart';
import '../../../../../../core/themes/colors.dart';
import '../../../../../../core/themes/text_styles.dart';
import '../../data/models/AllSubscriptionDto.dart';

class PaymentBody extends BaseStatelessWidget {
  PaymentBody({super.key, required this.allSubscriptionDto});
  AllSubscriptionDto allSubscriptionDto;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      decoration: Decorations.kDecorationBorderRadius(
          color: kPrimaryLight,
          radius: 15,
          borderColor: const Color(0xffA0BCFF)),
      padding: 5.paddingAll,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 110,
            child: Column(
              children: [
                Container(

                    margin: 16.paddingTop + 10.paddingHoriz  ,
                    padding: 10.paddingAll,
                    decoration: Decorations.kDecorationBorderRadius(
                        color: const Color(0xffA0BCFF),
                        radius: 10,
                        borderColor: const Color(0xffA0BCFF)),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          allSubscriptionDto.period ?? '',
                          // textAlign: TextAlign.center,
                          style: kTextBold.copyWith(
                              color: Colors.white, fontSize: 20),
                        ),
                        Text(
                          strings.months,
                          // textAlign: TextAlign.center,
                          style: kTextBold.copyWith(
                              color: Colors.white, fontSize: 20),
                        ),
                      ],
                    )),

                Container(
                  decoration: BoxDecoration(
                      color: kPrimaryLight,
                      border: Border.all(color: const Color(0xffA0BCFF)),
                      borderRadius: BorderRadius.circular(15)),
                  height: 20,
                 margin:10.paddingHoriz +10.paddingTop+10.paddingBottom,
                  child: Center(
                      child: Text(
                    "${strings.package_price}: ${allSubscriptionDto.amount} ${strings.sr}",
                    style: kTextRegular.copyWith(
                        fontSize: 8, color: kBlackColor_12),
                  ),),
                )
              ],
            ),
          ),
          Expanded(

            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                10.ph,
                Text(
                  getName(
                      allSubscriptionDto.name ?? '',
                      allSubscriptionDto.enName ?? '',
                      ),
                  style:
                      kTextBold.copyWith(color: kBlackColor_12, fontSize: 16),
                ),
                Text(
                  getName(
                      allSubscriptionDto.description ?? '',
                      allSubscriptionDto.enDescription ?? '',
                    ),
                  style:
                      kTextMedium.copyWith(color: kBlackColor_12, fontSize: 13),
                )
              ],
            ),
          )
        ],
      ),
    );

  }
}

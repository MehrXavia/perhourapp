import 'package:flutter/material.dart';
import 'package:onservice24/core/exceptions/extensions.dart';

import '../../../../../core/components/base_stateless_widget.dart';
import '../../../../../core/decorations/decorations.dart';
import '../../../../../core/themes/colors.dart';
import '../../../../../core/themes/text_styles.dart';
import '../../data/models/Subscription_dto.dart';

class ContentBody extends BaseStatelessWidget {
  ContentBody({required this.subscriptionDto, super.key});
  final SubscriptionDto subscriptionDto;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width - 50,
      decoration: Decorations.kDecorationBorderRadius(
          color: const Color(0xffE6EDFF),
          radius: 20,
          borderColor: const Color(0xffA0BCFF)),
      margin: 5.paddingAll,

      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
              height: 110,
              width: 80,
              margin: 20.paddingVert + 10.paddingHoriz,
              decoration: Decorations.kDecorationBorderRadius(
                  color: const Color(0xffA0BCFF),
                  radius: 10,
                  borderColor: const Color(0xffA0BCFF)),
              alignment: Alignment.center,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "${subscriptionDto.subsriptionsMangementPeriod}  ",

                    style: kTextBold.copyWith(color: Colors.white, fontSize: 25),
                  ),
                  FittedBox(
                    child: Text(
                      strings.month,
                      style: kTextBold.copyWith(color: Colors.white, fontSize: 25),
                    ),
                  ),
                ],
              )),
          Expanded(

            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                10.ph,
                Text(
                  getName(subscriptionDto.subsriptionsMangementName ?? "", subscriptionDto.subsriptionsMangementNameEN ?? ""),
                  style: kTextBold.copyWith(color: kBlueColorE4, fontSize: 18),
                ),
                Text(
                 getName( subscriptionDto.subsriptionsMangementDesc ?? "",  subscriptionDto.subsriptionsMangementDescEN ?? ""),
                  style:
                      kTextMedium.copyWith(color: kBlueColorE4, fontSize: 12),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

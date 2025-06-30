import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:onservice24/core/exceptions/extensions.dart';
import 'package:readmore/readmore.dart';

import '../../../../../../core/assets/app_icons.dart';
import '../../../../../../core/components/base_stateless_widget.dart';
import '../../../../../../core/decorations/decorations.dart';
import '../../../../../../core/themes/colors.dart';
import '../../../../../../core/themes/text_styles.dart';
import '../../../../../admin/service/data/models/GetAllService.dart';

class ServiceBody extends BaseStatelessWidget {
  ServiceBody( {required this.listService,super.key});

  final List<GetAllService> listService;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: listService.length,
        scrollDirection: Axis.vertical,
        physics: const BouncingScrollPhysics(),
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return Container(
            margin: 10.paddingHoriz + 10.paddingTop,
            padding: 15.paddingAll,
            decoration: Decorations.baseDecoration(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  getName(listService[index].service?.arName??"", listService[index].service?.enName??"")
                  ,
                  style: kTextBold.copyWith(
                      fontSize: 17, color: kBlackColor_12),
                ),
                10.ph,
                Row(
                  children: [
                    SvgPicture.asset(AppIcons.time),
                    7.pw,
                    Text(
                      strings.hour_price,
                      style: kTextRegular.copyWith(
                          fontSize: 10, color: kBlackColor_12),
                    ),
                    2.pw,
                    Text(
                      "${listService[index].price} ${translateCurrency(listService[index].currency??"")}",
                      style: kTextRegular.copyWith(
                          fontSize: 10, color: kBlackColor_12),
                    ),
                    20.pw,
                    SvgPicture.asset(AppIcons.experiences),
                    7.pw,
                    Text(
                      strings.experience,
                      style: kTextRegular.copyWith(
                          fontSize: 10, color: kBlackColor_12),
                    ),
                    2.pw,
                    Text(
                      "${listService[index].experience} ${strings.years}",
                      style: kTextRegular.copyWith(
                          fontSize: 10, color: kBlackColor_12),
                    ),
                  ],
                ),
                5.ph,
                Text(
                  listService[index].description??"",
                  maxLines: 4,
                  overflow: TextOverflow.ellipsis,
                  style: kTextRegular.copyWith(
                    fontSize: 13,
                    color: kDark12,
                    fontWeight: FontWeight.w400,
                  ),
                ),

              ],
            ),
          );
        });
  }
}

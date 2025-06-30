import 'package:dartz/dartz.dart';
import 'package:onservice24/core/utils/helper_methods.dart';
import 'package:onservice24/src/main_index.dart';

import '../../../../../core/utils/navigator.dart';
import '../../data/models/GetAllService.dart';
import '../../data/models/currency_dto.dart';
import '../pages/add_sevice_page.dart';

class ItemService extends BaseStatelessWidget {
  final Function(int id) onDelete;
  final Function(GetAllService getAllService) onEditFunction;
  final GetAllService data;
  ItemService(
      {super.key,
      required this.onDelete,
      required this.onEditFunction,
      required this.data});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: 5.paddingAll + 10.paddingHoriz,
      padding: 10.paddingAll,
      decoration: Decorations.baseDecoration(),
      // height: 220,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              InkWell(
                  onTap: () {
                    onEditFunction(data);
                  },
                  child: Padding(
                    padding: 30.paddingHoriz,
                    child: AppIcon(icon: AppIcons.editp, size: 20),
                  )),
              InkWell(
                  onTap: () {
                    DialogsManager.showAlertDialog(
                        context,
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const AppIcon(
                              icon: AppIcons.alert,
                              size: 100,
                            ),
                            20.ph,
                            Text(strings.delete_message,
                                style:
                                    kTextMedium.copyWith(color: Colors.black)),
                            40.ph,
                            Padding(
                              padding: 20.paddingHoriz,
                              child: Row(
                                children: [
                                  InkWell(
                                    child: Text(strings.ok,
                                        style: kTextMedium.copyWith(
                                            color: kBlueColorE4)),
                                    onTap: () {
                                      onDelete(int.parse("${data.id ?? 0}"));
                                    },
                                  ),
                                  30.pw,
                                  InkWell(
                                      onTap: () {
                                        pop();
                                      },
                                      child: Text(strings.no,
                                          style: kTextMedium.copyWith(
                                              color: kGreyColor))),
                                ],
                              ),
                            ),
                          ],
                        ));
                  },
                  child: Padding(
                    padding: 10.paddingHoriz,
                    child: AppIcon(icon: AppIcons.delet, size: 20),
                  )),
            ],
          ),
          Text(
            getName(
              data.service?.arName ?? '',
              data.service?.enName ?? '',
            ),
            style: kTextBold.copyWith(
                fontSize: 18, color: kDark12, fontWeight: FontWeight.w700),
          ),
          5.ph,
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              AppIcon(icon: AppIcons.time, size: 14),
              5.pw,
              //
              Text(
                "${strings.hour_price} :  ${data.price ?? ''} ${translateCurrency(data.currency ?? "")} ",
                style: kTextRegular.copyWith(fontSize: 10, color: kDark12),
              ),
              20.pw,

              AppIcon(icon: AppIcons.star1, size: 14),
              5.pw,
              Text(
                "${strings.experience} : ${data.experience ?? ''} ${strings.years} ",
                style: kTextRegular.copyWith(fontSize: 10, color: kDark12),
              ),
            ],
          ),
          5.ph,
          Text(
            data.description ?? '',
            maxLines: 4,
            overflow: TextOverflow.ellipsis,
            style: kTextRegular.copyWith(
              fontSize: 13,
              color: kDark12,
              fontWeight: FontWeight.w400,
            ),
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              10.pw,
              Container(
                decoration: Decorations.kDecorationBorderRadius(
                    radius: 15,
                    color: colorContainer(),
                    borderColor: colorBorderContainer()),
                padding: 10.paddingHoriz + 5.paddingVert,
                child: Text(
                  textString(),
                  style: kTextSemiBold.copyWith(
                      fontSize: 15, color: colorTextContainer()),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

  Color colorContainer() {
    if (data.status == 1) {
      return const Color(0xffE2E3E5);
    }
    if (data.status == 2) {
      return const Color(0xffF8D7DA);
    } else {
      return const Color(0xffD1E7DD);
    }
  }

  Color colorBorderContainer() {
    if (data.status == 1) {
      return const Color(0xffD3D6D8);
    }
    if (data.status == 2) {
      return const Color(0xffF5C2C7);
    } else {
      return const Color(0xffBADBCC);
    }
  }

  Color colorTextContainer() {
    if (data.status == 1) {
      return const Color(0xff41464B);
    }
    if (data.status == 2) {
      return const Color(0xff842029);
    } else {
      return const Color(0xff0F5132);
    }
  }

  String textString() {
    if (data.status == 1) {
      return strings.under_revision;
    }
    if (data.status == 2) {
      return strings.rejected;
    } else {
      return strings.published;
    }
  }

}

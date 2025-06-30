import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';
import 'package:onservice24/core/exceptions/extensions.dart';
import 'package:onservice24/src/main_index.dart';

import '../../../../../core/assets/app_icons.dart';
import '../../../../../core/components/base_stateless_widget.dart';
import '../../../../../core/decorations/decorations.dart';
import '../../../../../core/themes/colors.dart';
import '../../../../../core/themes/text_styles.dart';
import '../../../../../core/utils/date_formatter.dart';
import '../../../../../core/widgets/buttons/app_icon.dart';
import '../../../profile/presentation/profile/widgets/text_utils.dart';
import '../../data/models/NotificationsDto.dart';

class NotificationItem extends BaseStatelessWidget {
  NotificationItem(
      {super.key, required this.type, required this.notificationsDto});
  int type;
  final NotificationsDto notificationsDto;

  @override
  Widget build(BuildContext context) {
    DateTime dateTime = type==4? DateFormat('MM/dd/yyyy hh:mm:ss a').parse(notificationsDto.dateNotification ?? ''):DateFormat("yyyy-MM-dd'T'HH:mm:ss").parse(notificationsDto.dateNotification ?? '');
    // convert to timestamp
    String date = DateFormat('dd/MM/yyyy').format(dateTime);
    String time = DateFormat('hh:mm a').format(dateTime);
    // final date =
    //     DateFormatter.formatFromString(notificationsDto.dateNotification ?? '');
    // final time = DateFormatter.formatFromTimeString(
    //     notificationsDto.dateNotification ?? '');
    return Container(
        margin: 10.paddingHoriz+10.paddingTop,
        padding: 10.paddingHoriz+10.paddingVert,
        decoration: Decorations.baseDecoration(color: type == 4 ?const Color(0xffA0BCFF):Colors.white,radius: 7),
        child: Row(
          children: [
            AppIcon(
              icon: type == 4 ? AppIcons.admin2 : AppIcons.person2,
              size: 18,
            ),
            4.pw,
            Expanded(
              child: Text(
                type == 4 ?notificationsDto.message ?? "":  getName(notificationsDto.message ?? "",
                    notificationsDto.messageEN ?? ""),
                style: kTextRegular.copyWith(
                  fontSize: 11,
                  color: type == 4 ?Colors.white: kBlackColor_12,
                ),
              ),
            ),
            AppIcon(
                icon: AppIcons.date, color: type == 4 ?Colors.white: kBlackColor_12, size: 14),
            2.pw,
            Text(date,
                style:
                kTextLabel.copyWith(fontSize: 10, color:type == 4 ?Colors.white: kPrimaryDark)),
            5.pw,
            AppIcon(icon: AppIcons.time, color: type == 4 ?Colors.white: kBlackColor_12, size: 14),
            2.pw,
            Text(time,
                style:
                kTextLabel.copyWith(fontSize: 10, color:type == 4 ?Colors.white: kPrimaryDark)),

          ],
        ));
  }
}

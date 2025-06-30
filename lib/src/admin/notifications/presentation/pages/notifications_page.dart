import 'package:flutter/material.dart';
import 'package:onservice24/core/assets/app_icons.dart';
import 'package:onservice24/core/commen/common_state.dart';
import 'package:onservice24/core/components/base_widget_bloc.dart';
import 'package:onservice24/core/exceptions/extensions.dart';
import 'package:onservice24/core/resources/data_state.dart';
import 'package:onservice24/core/themes/colors.dart';
import 'package:onservice24/src/admin/notifications/data/models/NotificationsDto.dart';
import 'package:onservice24/src/admin/notifications/presentation/cubit/notification_cubit.dart';
import 'package:onservice24/src/admin/notifications/presentation/pages/notifications_screen.dart';

import '../../../../../core/widgets/tabview/dynamic_tab_bar_view.dart';

class NotificationPage extends BaseBlocWidget<
    DataSuccess<List<NotificationsDto>>, NotificationCubit> {
  final bool isShowBack;
  NotificationPage({super.key, this.isShowBack = false});
  @override
  int  type=4  ;

  @override
  String? title(BuildContext context) {
    return strings.notifications;
  }

  @override
  bool? isBack(BuildContext context) {
    return isShowBack;
  }

  @override
  void loadInitialData(BuildContext context) {
    bloc.getNotifications( contactType: type);
  }

  StreamStateInitial<List<NotificationsDto>> streamData = StreamStateInitial();


  @override
  Widget build(
      BuildContext context) {

    return mainFrame(
      body: DynamicTabBarView(
          onTap: (id) {
            type = id;
            print(type);
            print("ghghjhuhuhkjhk22");
            bloc.getNotifications( contactType: type);
          },
        padding: 0.paddingAll,
        marginTabs: 10.paddingAll,
          tabs: [
            DynamicItem(id: 4, name: strings.app_management, icon: AppIcons.id),
            DynamicItem(
              id: 1,
              name: strings.profile,
              icon: AppIcons.person,
            ),
            DynamicItem(id: 2, name: strings.telecom, icon: AppIcons.id),
            DynamicItem(id: 3, name: strings.whatsapp, icon: AppIcons.id),

          ],
          pageWidget: buildConsumer(context),
      ),
    );
  }


  @override
  Widget buildWidget(
      BuildContext context, DataSuccess<List<NotificationsDto>> state) {
    return RefreshIndicator(
      color: kBlueColorE4,
      onRefresh: () {
       return bloc.getNotifications( contactType: type);
      },
      child: NotificationScreen(
        data: state.data!,
          type:type
      ),
    );
  }
}

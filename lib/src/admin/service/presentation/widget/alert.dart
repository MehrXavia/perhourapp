import 'package:flutter/material.dart';
import 'package:onservice24/core/assets/app_icons.dart';
import 'package:onservice24/core/exceptions/extensions.dart';
import 'package:onservice24/core/themes/colors.dart';
import 'package:onservice24/core/themes/text_styles.dart';
import 'package:onservice24/core/widgets/buttons/app_icon.dart';
import 'package:onservice24/core/widgets/buttons/primary_button.dart';
import 'package:onservice24/src/admin/service/presentation/pages/sevice_page.dart';
import 'package:onservice24/src/admin/subscriptions/presentation/pages/subscriptions_page.dart';
import '../../../../../core/components/base_stateless_widget.dart';
import '../../../../../core/decorations/decorations.dart';
import '../../../../../core/utils/navigator.dart';
import '../../../../shared/support/presentation/pages/support_page.dart';

class AlertScreen extends BaseStatelessWidget {
  AlertScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        color: kPrimaryLight,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            const AppIcon(
              icon: AppIcons.alert,
              size: 190,
            ),
            Container(
              padding: 20.paddingAll,
              decoration: Decorations.baseDecoration(color: kColor_77),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  textMain(
                      text: strings
                          .you_do_not_have_an_activated_package_in_your_account_and_it_will_not_appear),
                  textMain(
                      text: strings
                          .your_account_in_the_search_list_on_the_map_or_add),
                  textMain(text: strings.new_services_or_view_your_profile),
                  textMain(
                      text: strings
                          .we_ask_you_to_subscribe_and_activate_a_new_package_to_enjoy),
                  textMain(text: strings.application_services),
                ],
              ),
            ),
            40.ph,
            Row(
              children: [
                Expanded(
                  child: PrimaryButton(
                    margin: 45.paddingStart,
                    title: strings.activate_a_new_package,
                    fontSize: 14,
                    onPressed: () {
                      Navigators.push(SubscriptionsPage());
                    },
                  ),
                ),
                10.pw,
                Expanded(
                  child: PrimaryButton(
                    margin: 45.paddingEnd,
                    title: strings.technical_support,
                    backgroundColor: kColor,
                    fontSize: 14,
                    onPressed: () {
                      Navigators.push(SupportPage());
                    },
                  ),
                ),
              ],
            ),

            40.ph,
          ],
        ),
      ),
    );
  }

  Text textMain({required String text}) {
    return Text(
      text,
      textAlign: TextAlign.center,
      style: kTextMedium.copyWith(color: kBlackColor_12, fontSize: 16,height: 1.5),
    );
  }
}

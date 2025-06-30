import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:onservice24/core/exceptions/extensions.dart';
import 'package:flutter/material.dart';
import 'package:onservice24/src/shared/support/presentation/pages/support_page.dart';
import 'package:onservice24/src/user/profile_user/presentation/pages/user_profile_page.dart';

import '../../../navigation_pages_v2.dart';
import '../../../src/shared/auth/presentation/create_service_provider_account/create_service_provider_account_page.dart';
import '../../../src/shared/on_boarding/widgets/languages_selection.dart';
import '../../assets/app_icons.dart';
import '../../components/base_stateless_widget.dart';
import '../../decorations/decorations.dart';
import '../../routes/routes.dart';
import '../../themes/colors.dart';
import '../../themes/text_styles.dart';
import '../../utils/helper_methods.dart';
import '../../utils/navigator.dart';
import '../buttons/app_icon.dart';
import 'cubit/more_cubit.dart';

class MoreUser extends BaseStatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: HelperMethods.getUserId(),
        initialData: false,
        builder: (context, snapshot) {
          return Container(
              margin: 0.paddingBottom + 20.paddingHoriz,
              padding: 10.paddingAll,
              clipBehavior: Clip.antiAlias,
              decoration: Decorations.shapeTopDecorationShadow(
                colorShadow: context.disabledColor,
                radius: 10,
              ),
              child: Material(
                color: context.cardColor,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(12),
                    topRight: Radius.circular(12),
                  ),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        snapshot.data == null || snapshot.data == 0
                            ? 0.ph
                            : main(
                                text: strings.profile,
                                appIcon: AppIcons.admin,
                                onTap: () {
                                  push(context, UserProfilePage());
                                }),
                        14.pw,
                        snapshot.data == null || snapshot.data == 0
                            ? 0.ph
                            : line(),
                        14.pw,
                        main(
                            text: strings.technical_support,
                            appIcon: AppIcons.support,
                            onTap: () {
                              push(context, SupportPage());
                            }),
                        14.pw,
                        snapshot.data == null || snapshot.data == 0
                            ? 0.ph
                            : line(),
                        14.pw,
                        snapshot.data == null || snapshot.data == 0
                            ? 0.ph
                            : BlocProvider(
                                create: (context) =>
                                    GetIt.instance<MoreCubit>(),
                                child: BlocConsumer<MoreCubit, MoreState>(
                                  listener: (context, state) async {
                                    if (state is SuccussLogOut) {
                                      streamStateInitial.setData(
                                          Args(isShow: false, isAdmin: false));
                                      await HelperMethods.removeProfile();

                                      Navigators.pushNamedAndRemoveUntil(
                                          Routes.onBoardingPage);
                                    }
                                  },
                                  builder: (context, state) {
                                    return main(
                                        text: strings.sign_out,
                                        appIcon: AppIcons.signout,
                                        onTap: () async {
                                          MoreCubit.of(context).logOut(1);
                                        });
                                  },
                                ),
                              ),
                      ],
                    ),
                    20.ph,
                    snapshot.data == null || snapshot.data == 0
                        ? 0.ph
                        : InkWell(
                            onTap: () {
                              push (context, CreateServiceProviderAccountPage());
                            },
                            child: Container(
                                height: 50,
                                width: 260,
                                decoration: BoxDecoration(
                                  border: Border.all(color: kMainColor),
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: Center(
                                  child: Text(
                                    strings.register_as_a_service_provider,
                                    style: kTextMedium.copyWith(
                                        fontSize: 17, color: kMainColor),
                                  ),
                                )),
                          ),
                    10.ph,
                    LanguagesSelection(),
                    5.ph,
                  ],
                ),
              ));
        });
  }

  Widget main(
      {required String text, required String appIcon, Function()? onTap}) {
    return InkWell(
      onTap: onTap,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          AppIcon(
            icon: appIcon,
            size: 20,
          ),
          10.ph,
          Text(
            text,
            style: bodyLarge.copyWith(fontSize: 13),
          ),
        ],
      ),
    );
  }

  Widget line() {
    return Container(
      height: 80,
      width: 1,
      color: kDropDown,
    );
  }
}

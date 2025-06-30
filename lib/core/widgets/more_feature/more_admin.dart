

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:onservice24/core/exceptions/extensions.dart';
import 'package:onservice24/core/themes/colors.dart';
import 'package:onservice24/core/themes/text_styles.dart';
import 'package:onservice24/core/utils/helper_methods.dart';
import 'package:onservice24/core/widgets/buttons/app_icon.dart';

 import '../../../navigation_pages_v2.dart';
import '../../../src/admin/profile/data/models/EditProfilePrams.dart';
 import '../../../src/admin/profile/presentation/profile/pages/profile/profile_service_provider_page.dart';
import '../../../src/admin/subscriptions/presentation/pages/subscriptions_page.dart';
import '../../../src/shared/auth/data/models/profile_dto.dart';
import '../../../src/shared/on_boarding/widgets/languages_selection.dart';
import '../../../src/shared/support/presentation/pages/support_page.dart';
import '../../assets/app_icons.dart';
import '../../components/base_stateless_widget.dart';
 import '../../decorations/decorations.dart';
 import '../../routes/routes.dart';
import '../../utils/navigator.dart';
import '../dialogs/dialogs_manager.dart';
import 'cubit/more_cubit.dart';

class MoreAdmin extends BaseStatelessWidget {
  MoreAdmin({super.key});

  @override
  Widget build(BuildContext context) {
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
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                main(
                    text: strings.profile,
                    appIcon: AppIcons.admin,
                    onTap: () {
                      push(context, ProfileServiceProviderPage());
                    }),
                30.pw,
                heightLine(),
                // 10.ph,
                // main(
                //     text: strings.subscriptions,
                //     appIcon: AppIcons.subscription,
                //     onTap: () {
                //       push(context, SubscriptionsPage());
                //     }),
               // 10.ph,
                // heightLine(),
                30.pw,
                main(
                    text: strings.technical_support,
                    appIcon: AppIcons.support,
                    onTap: () {
                      push(context, SupportPage());
                    }),
              ],
            ),
            Padding(
              padding: 20.paddingHoriz,
              child: const Divider(color: kDropDown, height: .5),
            ),
            Row(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                main(
                    text: strings.account_suspension,
                    appIcon: AppIcons.lock,
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
                              Text(strings.massage_bloc,
                                  style: kTextMedium.copyWith(
                                      color: Colors.black)),
                              40.ph,
                              Padding(
                                padding: 20.paddingHoriz,
                                child: Row(
                                  children: [
                                    BlocProvider(
                                      create: (context) =>
                                          GetIt.instance<MoreCubit>(),
                                      child: BlocConsumer<MoreCubit, MoreState>(
                                        listener: (context, state) async {
                                          if (state is Succuss) {
                                            streamStateInitial.setData(Args(
                                                isShow: false, isAdmin: false));

                                            await HelperMethods.removeProfile();
                                            Navigators.pushNamedAndRemoveUntil(
                                                Routes.onBoardingPage);
                                          }
                                        },
                                        builder: (context, state) {

                                          return InkWell(
                                              onTap: () async {
                                                ProfileDto? data =
                                                    await HelperMethods
                                                        .getProfile();
                                                MoreCubit.of(context)
                                                    .editProfile(
                                                        EditProfilePrams(
                                                  status: false,
                                                  id: data?.id ?? 0,
                                                  lng: data?.lng ?? 0,
                                                  fcm: data?.fcm ?? '',
                                                  lat: data?.lat ?? 0,
                                                  loginDate: data?.loginDate??'',
                                                  logoutDate: data?.logoutDate??'',
                                                  isLogedOut:true,
                                                  createdDate:
                                                      data?.createdDate ?? '',
                                                  twitter: data?.twitter ?? "",
                                                  facebook:
                                                      data?.facebook ?? "",
                                                  email: data?.email ?? '',
                                                  lastName:
                                                      data?.lastName ?? "",
                                                  companyName:
                                                      data?.companyName ?? "",
                                                  companyTradeNumber:
                                                      data?.companyTradeNumber ??
                                                          "",
                                                  fingerprint: '',
                                                  firstName:
                                                      data?.firstName ?? "",
                                                  gender: data?.gender ?? "",
                                                  identityPhotoId:
                                                      data?.identityPhotoId ??
                                                          0,
                                                  insagram:
                                                      data?.insagram ?? "",
                                                  isDeleted:
                                                      data?.isDeleted ?? false,
                                                  nationalityId:
                                                      data?.nationalityId ?? 0,
                                                  isSendNotification:
                                                      data?.isSendNotification ??
                                                          true,
                                                  isverified:
                                                      data?.isverified ?? true,
                                                  linkedin:
                                                      data?.linkedin ?? "",
                                                  phoneNumber:
                                                      data?.phoneNumber ?? '',
                                                  photoId: data?.photoId ?? 0,
                                                  rateing: data?.rateing ?? 0,
                                                  slno: data?.slno ?? '',
                                                  type: data?.type ?? '',
                                                  typeOfFile:
                                                      data?.typeOfFile ?? 0,
                                                ));
                                              },
                                              child: state is Loading
                                                  ? const CircularProgressIndicator(
                                                      backgroundColor:
                                                          Colors.white,
                                                      color: kBlueColorE4,
                                                    )
                                                  : Text(strings.ok,
                                                      style: kTextMedium.copyWith(
                                                          color:
                                                              kBlueColorE4)));
                                        },
                                      ),
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
                    }),
                // 10.ph,
                // heightLine(),
                // 10.ph,
                // const SizedBox(
                //   height: 75,
                //   width: 80,
                // ),
                30.pw,
                heightLine(),
                30.pw,
                BlocProvider(
                  create: (context) =>
                      GetIt.instance<MoreCubit>(),
  child: BlocConsumer<MoreCubit, MoreState>(
                  listener: (context, state) async {
                    if (state is SuccussLogOut) {
                      streamStateInitial
                          .setData(Args(isShow: false, isAdmin: false));

                      await HelperMethods.removeProfile();
                      Navigators.pushNamedAndRemoveUntil(Routes.onBoardingPage);
                    }
                  },
                  builder: (context, state) {
                    return main(
                        text: strings.sign_out,
                        appIcon: AppIcons.signout,
                        onTap: () async {
                          MoreCubit.of(context).logOut(2);


                        });
                  },
                ),
),
              ],
            ),
            10.ph,
            LanguagesSelection(),
            5.ph,
          ],
        ),
      ),
    );
  }

  Widget main(
      {required String text, required String appIcon, Function()? onTap}) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 75,
        width: 80,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            AppIcon(
              icon: appIcon,
              size: 15,
            ),
            10.ph,
            Text(
              text,
              style: bodyLarge.copyWith(fontSize: 10),
            ),
          ],
        ),
      ),
    );
  }

  Widget heightLine() {
    return Container(
      height: 75,
      width: 1,
      color: kDropDown,
    );
  }

  // @override
  // Future<void> onRequestSuccess(String? message) async {
  //   streamStateInitial
  //       .setData(Args(isShow: false, isAdmin: false));
  //
  //   await HelperMethods.removeProfile();
  //   Navigators.pushNamedAndRemoveUntil(
  //       Routes.onBoardingPage);
  // }
}
